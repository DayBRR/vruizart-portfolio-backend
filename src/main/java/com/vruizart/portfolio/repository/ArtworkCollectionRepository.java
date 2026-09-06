package com.vruizart.portfolio.repository;

import com.vruizart.portfolio.entity.ArtworkCollection;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

public interface ArtworkCollectionRepository extends JpaRepository<ArtworkCollection, UUID> {
    List<ArtworkCollection> findByActiveTrueOrderBySortOrderAscNameAsc();
    Optional<ArtworkCollection> findBySlugAndActiveTrue(String slug);
}
