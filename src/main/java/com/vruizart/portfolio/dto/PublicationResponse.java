package com.vruizart.portfolio.dto;

import com.vruizart.portfolio.entity.PublicationType;
import java.time.LocalDate;

public record PublicationResponse(
        String title,
        String slug,
        PublicationType publicationType,
        String publisherName,
        String authorName,
        LocalDate publicationDate,
        String description,
        String externalUrl,
        String coverImageUrl,
        String fileUrl,
        String reference,
        boolean featured,
        Integer sortOrder
) {}
