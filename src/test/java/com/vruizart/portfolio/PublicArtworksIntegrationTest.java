package com.vruizart.portfolio;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import io.zonky.test.db.postgres.embedded.EmbeddedPostgres;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.test.context.DynamicPropertyRegistry;
import org.springframework.test.context.DynamicPropertySource;
import org.springframework.test.web.servlet.MockMvc;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import static org.assertj.core.api.Assertions.assertThat;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@SpringBootTest
@AutoConfigureMockMvc
class PublicArtworksIntegrationTest {
    // Isolated PostgreSQL: real Flyway migrations and Hibernate validation, no application DB.
    static final EmbeddedPostgres POSTGRES = postgres();

    static EmbeddedPostgres postgres() {
        try {
            var postgres = EmbeddedPostgres.builder().setPort(0).start();
            Runtime.getRuntime().addShutdownHook(new Thread(() -> {
                try { postgres.close(); } catch (IOException e) { throw new RuntimeException(e); }
            }));
            return postgres;
        } catch (IOException e) { throw new ExceptionInInitializerError(e); }
    }

    @DynamicPropertySource
    static void database(DynamicPropertyRegistry properties) {
        properties.add("spring.datasource.url", () -> POSTGRES.getJdbcUrl("postgres", "postgres"));
        properties.add("spring.datasource.username", () -> "postgres");
        properties.add("spring.datasource.password", () -> "postgres");
        properties.add("spring.jpa.properties.hibernate.query.fail_on_pagination_over_collection_fetch", () -> true);
    }

    @Autowired MockMvc mvc;
    @Autowired ObjectMapper mapper;
    @Autowired JdbcTemplate jdbc;

    UUID portraits;
    UUID urban;
    UUID oil;
    UUID pastel;

    @BeforeEach
    void fixtures() {
        jdbc.execute("truncate artwork_image, artwork, collection, technique cascade");
        portraits = collection("retratos", 1, true);
        urban = collection("paisaje-urbano", 2, false);
        oil = technique("Óleo sobre lienzo");
        pastel = technique("Pastel sobre papel");
        for (int i = 0; i < 26; i++) {
            artwork("obra-" + i, portraits, i < 13 ? oil : pastel, i, true);
        }
        artwork("urbano", urban, oil, 0, true);
        artwork("sin-tecnica", null, null, 99, true);
        artwork("blanco", null, technique(" \t\r\n "), 100, true);
        artwork("duplicada", urban, technique(" \tÓleo sobre lienzo\n "), 1, true);
        artwork("oculta", portraits, technique("Solo oculta"), 101, false);
        technique("Sin obras");
        jdbc.update("update artwork set is_featured = true, hero_position = case when slug = 'obra-0' then 1 else 2 end where slug in ('obra-0', 'oculta')");
        UUID id = jdbc.queryForObject("select id from artwork where slug = 'obra-13'", UUID.class);
        for (int i = 0; i < 3; i++) {
            jdbc.update("insert into artwork_image(artwork_id,image_url,sort_order) values (?, ?, ?)",
                    id, "https://example.test/image-" + i + ".jpg", i);
        }
    }

    UUID technique(String name) {
        return jdbc.queryForObject("insert into technique(name) values (?) returning id", UUID.class, name);
    }

    UUID collection(String slug, int order, boolean active) {
        return jdbc.queryForObject("insert into collection(name,slug,sort_order,is_active) values (?,?,?,?) returning id",
                UUID.class, slug, slug, order, active);
    }

    void artwork(String slug, UUID collection, UUID technique, int order, boolean visible) {
        jdbc.update("insert into artwork(title,slug,collection_id,technique_id,sort_order,is_visible) values (?,?,?,?,?,?)",
                slug, slug, collection, technique, order, visible);
    }

    JsonNode request(String path, String... params) throws Exception {
        var request = get("/api/public/artworks" + path);
        for (int i = 0; i < params.length; i += 2) request.param(params[i], params[i + 1]);
        return mapper.readTree(mvc.perform(request).andExpect(status().isOk()).andReturn().getResponse().getContentAsString());
    }

    void page(JsonNode response, int number, int size, long total, int pages, int count) {
        assertThat(response.path("content").size()).isEqualTo(count);
        assertThat(response.path("page").path("number").asInt()).isEqualTo(number);
        assertThat(response.path("page").path("size").asInt()).isEqualTo(size);
        assertThat(response.path("page").path("totalElements").asLong()).isEqualTo(total);
        assertThat(response.path("page").path("totalPages").asInt()).isEqualTo(pages);
    }

    @Test
    void filtersApplyBeforePaginationAndCountIncludingImages() throws Exception {
        page(request(""), 0, 12, 30, 3, 12);
        page(request("", "collection", "retratos"), 0, 12, 26, 3, 12);
        JsonNode filtered = request("", "technique", "Pastel sobre papel");
        page(filtered, 0, 12, 13, 2, 12);
        assertThat(filtered.path("content").get(0).path("slug").asText()).isEqualTo("obra-13");
        assertThat(filtered.path("content").get(0).path("images").size()).isEqualTo(3);
        page(request("", "collection", "retratos", "technique", "Pastel sobre papel", "page", "1"),
                1, 12, 13, 2, 1);
        page(request("", "collection", "retratos", "technique", "Pastel sobre papel", "page", "2"),
                2, 12, 13, 2, 0);
        page(request("", "technique", " Óleo sobre lienzo "), 0, 12, 15, 2, 12);
        page(request("", "technique", "\tÓleo sobre lienzo\n"), 0, 12, 15, 2, 12);
        // Java trim() would silently remove U+001C, while PostgreSQL does not.
        // Input and stored names must use exactly the same SQL normalization.
        UUID unusual = technique("\u001CTécnica especial\u001C");
        artwork("tecnica-especial", urban, unusual, 2, true);
        page(request("", "technique", "\u001CTécnica especial\u001C"), 0, 12, 1, 1, 1);
    }

    @Test
    void paginationPreservesStableExistingOrder() throws Exception {
        List<String> slugs = new ArrayList<>();
        for (int p = 0; p < 3; p++) {
            var response = request("", "collection", "retratos", "page", String.valueOf(p));
            for (JsonNode artwork : response.path("content")) slugs.add(artwork.path("slug").asText());
        }
        assertThat(slugs).containsExactlyElementsOf(java.util.stream.IntStream.range(0, 26)
                .mapToObj(i -> "obra-" + i).toList());
        UUID sameOrder = collection("empate", 3, true);
        artwork("empate-a", sameOrder, oil, 0, true);
        artwork("empate-b", sameOrder, oil, 0, true);
        var ordered = jdbc.queryForList("select slug from artwork where collection_id = ? order by sort_order, id", String.class, sameOrder);
        assertThat(request("", "collection", "empate").path("content").findValuesAsText("slug"))
                .containsExactlyElementsOf(ordered);
    }

    @Test
    void optionalUnknownAndIncompatibleFilters() throws Exception {
        for (String blank : List.of("", "  ", "\t\n")) {
            page(request("", "collection", blank, "technique", blank), 0, 12, 30, 3, 12);
            page(request("", "collection", "retratos", "technique", blank), 0, 12, 26, 3, 12);
        }
        page(request("", "technique", "Desconocida"), 0, 12, 0, 0, 0);
        page(request("", "technique", "óleo sobre lienzo"), 0, 12, 0, 0, 0);
        page(request("", "collection", "paisaje-urbano", "technique", "Pastel sobre papel"), 0, 12, 0, 0, 0);
        page(request("", "collection", "inexistente"), 0, 12, 0, 0, 0);
        page(request("", "collection", " retratos "), 0, 12, 0, 0, 0);
        jdbc.execute("update artwork set is_visible = false");
        page(request(""), 0, 12, 0, 0, 0);
        assertThat(request("/techniques").isEmpty()).isTrue();
    }

    @Test
    void optionsAreCompleteDistinctAndPublicAndIgnoreActiveTechniqueAndPage() throws Exception {
        var expected = jdbc.queryForList("select name from technique where id in (?, ?) order by name", String.class, oil, pastel);
        assertThat(mapper.convertValue(request("/techniques"), List.class)).isEqualTo(expected);
        assertThat(mapper.convertValue(request("/techniques", "collection", "retratos", "page", "100", "technique", "Nada"), List.class))
                .isEqualTo(expected);
        assertThat(mapper.convertValue(request("/techniques", "collection", "paisaje-urbano"), List.class))
                .isEqualTo(List.of("Óleo sobre lienzo"));
        assertThat(request("/techniques", "collection", "inexistente").isEmpty()).isTrue();
        assertThat(request("/techniques", "collection", "  ")).isEqualTo(request("/techniques"));
    }

    @Test
    void staticRoutesDetailAndDtoRemainCompatible() throws Exception {
        var detail = request("/obra-0");
        assertThat(detail.path("technique").asText()).isEqualTo("Óleo sobre lienzo");
        assertThat(detail.path("collectionSlug").asText()).isEqualTo("retratos");
        assertThat(detail.properties()).extracting(java.util.Map.Entry::getKey).containsExactlyInAnyOrder(
                "title", "slug", "year", "description", "widthCm", "heightCm", "price", "status", "featured",
                "collectionName", "collectionSlug", "technique", "mainImageUrl", "images");
        for (String route : List.of("/hero", "/featured")) {
            var result = request(route);
            assertThat(result.size()).isEqualTo(1);
            assertThat(result.get(0).path("slug").asText()).isEqualTo("obra-0");
        }
        mvc.perform(get("/api/public/artworks/oculta")).andExpect(status().isNotFound());
        mvc.perform(get("/api/public/artworks/inexistente")).andExpect(status().isNotFound());
        // The old README mentioned featured=true, but the actual catalog ignores it.
        assertThat(request("", "featured", "true")).isEqualTo(request(""));
    }

    @Test
    void pageableResolverKeepsExistingFallbacksAndMaximum() throws Exception {
        page(request("", "page", "-1", "size", "0"), 0, 12, 30, 3, 12);
        page(request("", "page", "abc", "size", "bad"), 0, 12, 30, 3, 12);
        page(request("", "size", "-2"), 0, 12, 30, 3, 12);
        page(request("", "size", "99999"), 0, 2000, 30, 1, 30);
    }
}
