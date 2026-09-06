package com.vruizart.portfolio.repository;

import com.vruizart.portfolio.entity.ExhibitionArtwork;
import com.vruizart.portfolio.entity.ExhibitionArtworkId;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ExhibitionArtworkRepository extends JpaRepository<ExhibitionArtwork, ExhibitionArtworkId> {}
