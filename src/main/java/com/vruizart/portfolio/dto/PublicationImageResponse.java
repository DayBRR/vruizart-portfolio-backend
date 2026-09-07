package com.vruizart.portfolio.dto;

import lombok.Builder;

@Builder
public record PublicationImageResponse(
        String imageUrl,
        String altText,
        Integer sortOrder,
        boolean cover
) {
}