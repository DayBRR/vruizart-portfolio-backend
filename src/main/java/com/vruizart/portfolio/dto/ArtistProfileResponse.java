package com.vruizart.portfolio.dto;

import lombok.Builder;

@Builder
public record ArtistProfileResponse(
    String name,
    String subtitle,
    String bio,
    String statement,
    String quote,
    String profileImageUrl,
    String signatureImageUrl,
    String instagram,
    String facebook,
    String youtube,
    String email
) {}
