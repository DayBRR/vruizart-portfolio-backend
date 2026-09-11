package com.vruizart.portfolio.dto;

import com.vruizart.portfolio.entity.ContentType;
import lombok.Builder;

@Builder
public record SiteContentResponse(
        String key,
        String title,
        String subtitle,
        String content,
        ContentType type,
        String imageUrl,
        String altText,
        String buttonLabel,
        String buttonUrl,
        Integer sortOrder
) {}