package com.vruizart.portfolio.dto;

import com.vruizart.portfolio.entity.ExhibitionType;
import lombok.Builder;

import java.time.LocalDate;

@Builder
public record ExhibitionResponse(
        String title,
        String slug,
        ExhibitionType type,
        String description,
        LocalDate startDate,
        LocalDate endDate,
        Integer year,
        String locationName,
        String locationAddress,
        String imageUrl,
        boolean current,
        Integer sortOrder
) {}
