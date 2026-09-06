package com.vruizart.portfolio.repository;

import com.vruizart.portfolio.entity.ArtworkImage;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.UUID;

public interface ArtworkImageRepository extends JpaRepository<ArtworkImage, UUID> {}
