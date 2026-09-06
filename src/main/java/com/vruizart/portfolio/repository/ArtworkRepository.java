package com.vruizart.portfolio.repository;

import com.vruizart.portfolio.entity.Artwork;
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
}
