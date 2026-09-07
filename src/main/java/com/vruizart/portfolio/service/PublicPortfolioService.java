package com.vruizart.portfolio.service;

import com.vruizart.portfolio.dto.*;
import com.vruizart.portfolio.entity.Artwork;
import com.vruizart.portfolio.entity.ArtworkImage;
import com.vruizart.portfolio.entity.Publication;
import com.vruizart.portfolio.entity.PublicationImage;
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
                .map(e -> ExhibitionResponse.builder()
                        .title(e.getTitle())
                        .slug(e.getSlug())
                        .type(e.getType())
                        .description(e.getDescription())
                        .startDate(e.getStartDate())
                        .endDate(e.getEndDate())
                        .year(e.getYear())
                        .locationName(e.getLocationName())
                        .locationAddress(e.getLocationAddress())
                        .imageUrl(e.getImageUrl())
                        .current(e.isCurrent())
                        .sortOrder(e.getSortOrder())
                        .build())
                .toList();
    }

    public List<PublicationResponse> getPublications(Boolean featured) {
        var items = Boolean.TRUE.equals(featured)
                ? publicationRepository
                .findByVisibleTrueAndFeaturedTrueOrderBySortOrderAscPublicationDateDescTitleAsc()
                : publicationRepository
                .findByVisibleTrueOrderBySortOrderAscPublicationDateDescTitleAsc();

        return items.stream()
                .map(this::toPublicationResponse)
                .toList();
    }

    public PublicationResponse getPublication(String slug) {
        var publication = publicationRepository.findBySlugAndVisibleTrue(slug)
                .orElseThrow(() ->
                        new EntityNotFoundException("Publication not found: " + slug)
                );

        return toPublicationResponse(publication);
    }

    private PublicationResponse toPublicationResponse(Publication publication) {
        var images = publication.getImages() == null
                ? List.<PublicationImageResponse>of()
                : publication.getImages().stream()
                .sorted(Comparator.comparing(PublicationImage::getSortOrder))
                .map(this::toPublicationImageResponse)
                .toList();

        return PublicationResponse.builder()
                .title(publication.getTitle())
                .slug(publication.getSlug())
                .publicationType(publication.getPublicationType())
                .publisherName(publication.getPublisherName())
                .authorName(publication.getAuthorName())
                .publicationDate(publication.getPublicationDate())
                .publicationYear(publication.getPublicationYear())
                .description(publication.getDescription())
                .externalUrl(publication.getExternalUrl())
                .coverImageUrl(publication.getCoverImageUrl())
                .fileUrl(publication.getFileUrl())
                .reference(publication.getReference())
                .featured(publication.isFeatured())
                .sortOrder(publication.getSortOrder())
                .images(images)
                .build();
    }

    private PublicationImageResponse toPublicationImageResponse(PublicationImage image) {
        return PublicationImageResponse.builder()
                .imageUrl(image.getImageUrl())
                .altText(image.getAltText())
                .sortOrder(image.getSortOrder())
                .cover(image.isCover())
                .build();
    }

    public List<SiteContentResponse> getSiteContent() {
        return siteContentRepository.findByActiveTrueOrderBySortOrderAsc().stream()
                .map(content -> SiteContentResponse.builder()
                        .key(content.getKey())
                        .title(content.getTitle())
                        .content(content.getContent())
                        .type(content.getType())
                        .imageUrl(content.getImageUrl())
                        .sortOrder(content.getSortOrder())
                        .build())
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
                mainImage,
                images
        );
    }
}
