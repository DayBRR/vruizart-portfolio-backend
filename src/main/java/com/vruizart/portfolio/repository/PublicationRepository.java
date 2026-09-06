package com.vruizart.portfolio.repository;

import com.vruizart.portfolio.entity.Publication;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

public interface PublicationRepository extends JpaRepository<Publication, UUID> {
    List<Publication> findByVisibleTrueOrderBySortOrderAscPublicationDateDescTitleAsc();
    List<Publication> findByVisibleTrueAndFeaturedTrueOrderBySortOrderAscPublicationDateDescTitleAsc();
    Optional<Publication> findBySlugAndVisibleTrue(String slug);
}
