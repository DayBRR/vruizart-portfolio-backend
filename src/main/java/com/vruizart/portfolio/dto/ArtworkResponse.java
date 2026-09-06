package com.vruizart.portfolio.dto;

import com.vruizart.portfolio.entity.ArtworkStatus;
import java.math.BigDecimal;
import java.util.List;

public record ArtworkResponse(
        String title,
        String slug,
        Integer year,
        String description,
        BigDecimal widthCm,
        BigDecimal heightCm,
        BigDecimal price,
        ArtworkStatus status,
        boolean featured,
        String collectionName,
        String collectionSlug,
        String technique,
        String mainImageUrl,
        List<ArtworkImageResponse> images
) {}
