package com.vruizart.portfolio.repository;

import com.vruizart.portfolio.entity.Artwork;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

public interface ArtworkRepository extends JpaRepository<Artwork, UUID> {

    @EntityGraph(attributePaths = {"collection", "technique", "images"})
    List<Artwork> findByVisibleTrueOrderBySortOrderAscYearDescTitleAsc();

    @EntityGraph(attributePaths = {"collection", "technique", "images"})
    List<Artwork> findByVisibleTrueAndFeaturedTrueOrderBySortOrderAscYearDescTitleAsc();

    @EntityGraph(attributePaths = {"collection", "technique", "images"})
    Optional<Artwork> findBySlugAndVisibleTrue(String slug);

    @EntityGraph(attributePaths = {"collection", "technique", "images"})
    @Query("select distinct a from Artwork a where a.visible = true and a.collection.slug = :slug order by a.sortOrder asc, a.year desc, a.title asc")
    List<Artwork> findVisibleByCollectionSlug(@Param("slug") String slug);

    @EntityGraph(attributePaths = {"collection", "technique", "images"})
    List<Artwork> findByVisibleTrueAndHeroPositionIsNotNullOrderByHeroPositionAsc();

    @Query("""
    select a.id
    from Artwork a
    left join a.collection c
    left join a.technique t
    where a.visible = true
      and (:technique is null or cast(function('regexp_replace', t.name, '^[[:space:]]+|[[:space:]]+$', '', 'g') as String) = cast(function('regexp_replace', cast(:technique as String), '^[[:space:]]+|[[:space:]]+$', '', 'g') as String))
    order by c.sortOrder asc, a.sortOrder asc, a.id asc
    """)
    Page<UUID> findVisibleIds(@Param("technique") String technique, Pageable pageable);

    @Query("""
    select a.id
    from Artwork a
    left join a.technique t
    where a.visible = true
      and a.collection.slug = :slug
      and (:technique is null or cast(function('regexp_replace', t.name, '^[[:space:]]+|[[:space:]]+$', '', 'g') as String) = cast(function('regexp_replace', cast(:technique as String), '^[[:space:]]+|[[:space:]]+$', '', 'g') as String))
    order by a.sortOrder asc, a.id asc
    """)
    Page<UUID> findVisibleIdsByCollectionSlug(
            @Param("slug") String slug,
            @Param("technique") String technique,
            Pageable pageable
    );

    @Query("""
    select distinct cast(function('regexp_replace', t.name, '^[[:space:]]+|[[:space:]]+$', '', 'g') as String)
    from Artwork a
    join a.technique t
    left join a.collection c
    where a.visible = true
      and (:collection is null or c.slug = :collection)
      and cast(function('regexp_replace', t.name, '^[[:space:]]+|[[:space:]]+$', '', 'g') as String) <> ''
    order by cast(function('regexp_replace', t.name, '^[[:space:]]+|[[:space:]]+$', '', 'g') as String) asc
    """)
    List<String> findVisibleTechniqueNames(@Param("collection") String collection);

    @EntityGraph(attributePaths = {"collection", "technique", "images"})
    @Query("""
    select distinct a
    from Artwork a
    where a.id in :ids
    """)
    List<Artwork> findAllWithDetailsByIdIn(@Param("ids") List<UUID> ids);
}
