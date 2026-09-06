package com.vruizart.portfolio.dto;

public record CollectionResponse(
        String name,
        String slug,
        String description,
        String coverImageUrl,
        Integer sortOrder
) {}
