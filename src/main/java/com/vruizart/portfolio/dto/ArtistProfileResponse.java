package com.vruizart.portfolio.dto;

public record ArtistProfileResponse(
        String name,
        String subtitle,
        String bio,
        String statement,
        String profileImageUrl,
        String signatureImageUrl,
        String instagram,
        String facebook,
        String youtube,
        String email
) {}
