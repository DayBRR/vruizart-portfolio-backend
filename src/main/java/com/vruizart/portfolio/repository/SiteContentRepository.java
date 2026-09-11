package com.vruizart.portfolio.repository;

import com.vruizart.portfolio.entity.ContentType;
import com.vruizart.portfolio.entity.SiteContent;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

public interface SiteContentRepository extends JpaRepository<SiteContent, UUID> {

    List<SiteContent> findByActiveTrueOrderBySortOrderAsc();

    List<SiteContent> findByActiveTrueAndTypeOrderBySortOrderAsc(ContentType type);

    Optional<SiteContent> findByKeyAndActiveTrue(String key);
}