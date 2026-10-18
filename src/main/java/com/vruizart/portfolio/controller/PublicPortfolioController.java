package com.vruizart.portfolio.controller;

import com.vruizart.portfolio.dto.*;
import com.vruizart.portfolio.service.PublicPortfolioService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/public")
@RequiredArgsConstructor
public class PublicPortfolioController {

    private final PublicPortfolioService service;

    @GetMapping("/profile")
    public ArtistProfileResponse profile() {
        return service.getProfile();
    }

    @GetMapping("/collections")
    public List<CollectionResponse> collections() {
        return service.getCollections();
    }

    @GetMapping("/artworks")
    @Operation(summary = "Obras visibles paginadas", description = "Colección y técnica se combinan con AND antes de paginar y contar. Sin coincidencias devuelve 200 con contenido vacío. Tamaño predeterminado: 12.")
    public Page<ArtworkResponse> artworks(
            @Parameter(description = "Slug exacto. Omitido o blanco elimina el filtro; desconocido devuelve vacío.")
            @RequestParam(required = false) String collection,
            @Parameter(description = "Nombre de /artworks/techniques, sensible a mayúsculas y acentos, recortando blancos exteriores. Omitido o blanco elimina el filtro; desconocido devuelve vacío.")
            @RequestParam(required = false) String technique,
            @PageableDefault(size = 12) Pageable pageable
    ) {
        return service.getArtworks(collection, technique, pageable);
    }

    @GetMapping("/artworks/techniques")
    @Operation(summary = "Técnicas usadas por obras visibles", description = "Nombres distintos sin blancos exteriores, no vacíos y ordenados según la colación de PostgreSQL. Opcionalmente por colección. Independiente de página y técnica activa; devuelve string[].")
    public List<String> artworkTechniques(@RequestParam(required = false) String collection) {
        return service.getArtworkTechniques(collection);
    }

    @GetMapping("/artworks/hero")
    public List<ArtworkResponse> heroArtworks() {
        return service.getHeroArtworks();
    }

    @GetMapping("/artworks/featured")
    public List<ArtworkResponse> featuredArtworks() {
        return service.getFeaturedArtworks();
    }

    @GetMapping("/artworks/{slug}")
    public ArtworkResponse artwork(@PathVariable String slug) {
        return service.getArtwork(slug);
    }

    @GetMapping("/exhibitions")
    public List<ExhibitionResponse> exhibitions() {
        return service.getExhibitions();
    }

    @GetMapping("/publications")
    public List<PublicationResponse> publications(@RequestParam(required = false) Boolean featured) {
        return service.getPublications(featured);
    }

    @GetMapping("/publications/{slug}")
    public PublicationResponse publication(@PathVariable String slug) {
        return service.getPublication(slug);
    }

    @GetMapping("/content")
    public List<SiteContentResponse> content() {
        return service.getSiteContent();
    }

    @GetMapping("/content/hero")
    public List<SiteContentResponse> heroContent() {
        return service.getHeroContent();
    }
}
