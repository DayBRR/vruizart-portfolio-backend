package com.vruizart.portfolio.service;

import com.vruizart.portfolio.dto.*;
import com.vruizart.portfolio.entity.Artwork;
import com.vruizart.portfolio.entity.ArtworkImage;
import com.vruizart.portfolio.repository.*;
import jakarta.persistence.EntityNotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Comparator;
import java.util.List;

@Service
@Transactional(readOnly = true)
@RequiredArgsConstructor
public class PublicPortfolioService {

    private final ArtistProfileRepository artistProfileRepository;
    private final ArtworkCollectionRepository collectionRepository;
    private final ArtworkRepository artworkRepository;
    private final ExhibitionRepository exhibitionRepository;
    private final PublicationRepository publicationRepository;
    private final SiteContentRepository siteContentRepository;

    public ArtistProfileResponse getProfile() {
        return artistProfileRepository.findAll().stream().findFirst()
                .map(p -> ArtistProfileResponse.builder()
                        .name(p.getName())
                        .subtitle(p.getSubtitle())
                        .bio(p.getBio())
                        .statement(p.getStatement())
                        .quote(p.getQuote())
                        .profileImageUrl(p.getProfileImageUrl())
                        .signatureImageUrl(p.getSignatureImageUrl())
                        .instagram(p.getInstagram())
                        .facebook(p.getFacebook())
                        .youtube(p.getYoutube())
                        .email(p.getEmail())
                        .build())
                .orElseThrow(() -> new EntityNotFoundException("Artist profile not found"));
    }

    public List<CollectionResponse> getCollections() {
        return collectionRepository.findByActiveTrueOrderBySortOrderAscNameAsc().stream()
                .map(c -> new CollectionResponse(
                        c.getName(),
                        c.getSlug(),
                        c.getDescription(),
                        c.getCoverImageUrl(),
                        c.getSortOrder()
                ))
                .toList();
    }

    public List<ArtworkResponse> getArtworks(Boolean featured, String collectionSlug) {
        List<Artwork> artworks;

        if (collectionSlug != null && !collectionSlug.isBlank()) {
            artworks = artworkRepository.findVisibleByCollectionSlug(collectionSlug);

            if (Boolean.TRUE.equals(featured)) {
                artworks = artworks.stream()
                        .filter(Artwork::isFeatured)
                        .toList();
            }
        } else if (Boolean.TRUE.equals(featured)) {
            artworks = artworkRepository
                    .findByVisibleTrueAndFeaturedTrueOrderBySortOrderAscYearDescTitleAsc();
        } else {
            artworks = artworkRepository
                    .findByVisibleTrueOrderBySortOrderAscYearDescTitleAsc();
        }

        return artworks.stream()
                .map(this::toArtworkResponse)
                .toList();
    }

    public ArtworkResponse getArtwork(String slug) {
        return artworkRepository.findBySlugAndVisibleTrue(slug)
                .map(this::toArtworkResponse)
                .orElseThrow(() -> new EntityNotFoundException("Artwork not found: " + slug));
    }

    public List<ExhibitionResponse> getExhibitions() {
        return exhibitionRepository.findAllByOrderBySortOrderAscStartDateDescTitleAsc().stream()
                .map(e -> new ExhibitionResponse(
                        e.getTitle(),
                        e.getSlug(),
                        e.getDescription(),
                        e.getStartDate(),
                        e.getEndDate(),
                        e.getLocationName(),
                        e.getLocationAddress(),
                        e.getImageUrl(),
                        e.isCurrent(),
                        e.getSortOrder()
                ))
                .toList();
    }

    public List<PublicationResponse> getPublications(Boolean featured) {
        var items = Boolean.TRUE.equals(featured)
                ? publicationRepository
                .findByVisibleTrueAndFeaturedTrueOrderBySortOrderAscPublicationDateDescTitleAsc()
                : publicationRepository
                .findByVisibleTrueOrderBySortOrderAscPublicationDateDescTitleAsc();

        return items.stream()
                .map(p -> new PublicationResponse(
                        p.getTitle(),
                        p.getSlug(),
                        p.getPublicationType(),
                        p.getPublisherName(),
                        p.getAuthorName(),
                        p.getPublicationDate(),
                        p.getDescription(),
                        p.getExternalUrl(),
                        p.getCoverImageUrl(),
                        p.getFileUrl(),
                        p.getReference(),
                        p.isFeatured(),
                        p.getSortOrder()
                ))
                .toList();
    }

    public PublicationResponse getPublication(String slug) {
        var p = publicationRepository.findBySlugAndVisibleTrue(slug)
                .orElseThrow(() -> new EntityNotFoundException("Publication not found: " + slug));

        return new PublicationResponse(
                p.getTitle(),
                p.getSlug(),
                p.getPublicationType(),
                p.getPublisherName(),
                p.getAuthorName(),
                p.getPublicationDate(),
                p.getDescription(),
                p.getExternalUrl(),
                p.getCoverImageUrl(),
                p.getFileUrl(),
                p.getReference(),
                p.isFeatured(),
                p.getSortOrder()
        );
    }

    public List<SiteContentResponse> getSiteContent() {
        return siteContentRepository.findByActiveTrueOrderBySortOrderAsc().stream()
                .map(c -> new SiteContentResponse(
                        c.getKey(),
                        c.getTitle(),
                        c.getContent(),
                        c.getType(),
                        c.getImageUrl(),
                        c.getSortOrder()
                ))
                .toList();
    }

    private ArtworkResponse toArtworkResponse(Artwork artwork) {
        List<ArtworkImageResponse> images = artwork.getImages().stream()
                .sorted(Comparator.comparing(ArtworkImage::getSortOrder))
                .map(image -> new ArtworkImageResponse(
                        image.getImageUrl(),
                        image.getAltText(),
                        image.getSortOrder(),
                        image.isMain()
                ))
                .toList();

        String mainImage = artwork.getImages().stream()
                .filter(ArtworkImage::isMain)
                .findFirst()
                .or(() -> artwork.getImages().stream()
                        .min(Comparator.comparing(ArtworkImage::getSortOrder)))
                .map(ArtworkImage::getImageUrl)
                .orElse(null);

        return new ArtworkResponse(
                artwork.getTitle(),
                artwork.getSlug(),
                artwork.getYear(),
                artwork.getDescription(),
                artwork.getWidthCm(),
                artwork.getHeightCm(),
                artwork.getPrice(),
                artwork.getStatus(),
                artwork.isFeatured(),
                artwork.getCollection() != null ? artwork.getCollection().getName() : null,
                artwork.getCollection() != null ? artwork.getCollection().getSlug() : null,
                artwork.getTechnique() != null ? artwork.getTechnique().getName() : null,
                artwork.getStyle() != null ? artwork.getStyle().getName() : null,
                mainImage,
                images
        );
    }
}
