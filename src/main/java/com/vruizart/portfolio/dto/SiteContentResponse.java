package com.vruizart.portfolio.dto;

import com.vruizart.portfolio.entity.ContentType;

public record SiteContentResponse(
        String key,
        String title,
        String content,
        ContentType type,
        String imageUrl,
        Integer sortOrder
) {}
