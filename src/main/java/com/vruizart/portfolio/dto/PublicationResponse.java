package com.vruizart.portfolio.dto;

import com.vruizart.portfolio.entity.PublicationType;
import lombok.Builder;

import java.time.LocalDate;
import java.util.List;

@Builder
public record PublicationResponse(
        String title,
        String slug,
        PublicationType publicationType,
        String publisherName,
        String authorName,
        LocalDate publicationDate,
        Integer publicationYear,
        String description,
        String externalUrl,
        String coverImageUrl,
        String fileUrl,
        String reference,
        boolean featured,
        Integer sortOrder,
        List<PublicationImageResponse> images
) {
}