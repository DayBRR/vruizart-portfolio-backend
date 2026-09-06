package com.vruizart.portfolio.repository;

import com.vruizart.portfolio.entity.Style;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.UUID;

public interface StyleRepository extends JpaRepository<Style, UUID> {}
