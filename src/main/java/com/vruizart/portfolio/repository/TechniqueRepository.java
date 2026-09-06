package com.vruizart.portfolio.repository;

import com.vruizart.portfolio.entity.Technique;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.UUID;

public interface TechniqueRepository extends JpaRepository<Technique, UUID> {}
