package com.vruizart.portfolio.repository;

import com.vruizart.portfolio.entity.ArtistProfile;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.UUID;

public interface ArtistProfileRepository extends JpaRepository<ArtistProfile, UUID> {}
