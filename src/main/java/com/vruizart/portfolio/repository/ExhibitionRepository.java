package com.vruizart.portfolio.repository;

import com.vruizart.portfolio.entity.Exhibition;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

public interface ExhibitionRepository extends JpaRepository<Exhibition, UUID> {
    List<Exhibition> findAllByOrderBySortOrderAscStartDateDescTitleAsc();
    Optional<Exhibition> findBySlug(String slug);
}
