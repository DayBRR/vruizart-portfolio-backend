package com.vruizart.portfolio.dto;

import java.time.LocalDate;

public record ExhibitionResponse(
        String title,
        String slug,
        String description,
        LocalDate startDate,
        LocalDate endDate,
        String locationName,
        String locationAddress,
        String imageUrl,
        boolean current,
        Integer sortOrder
) {}
