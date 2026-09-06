package com.vruizart.portfolio.dto;

public record ArtworkImageResponse(
        String imageUrl,
        String altText,
        Integer sortOrder,
        boolean main
) {}
