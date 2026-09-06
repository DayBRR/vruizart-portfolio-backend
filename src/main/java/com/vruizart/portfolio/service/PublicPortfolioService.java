package com.vruizart.portfolio.service;

import com.vruizart.portfolio.dto.*;
import com.vruizart.portfolio.entity.Artwork;
import com.vruizart.portfolio.entity.ArtworkImage;
import com.vruizart.portfolio.repository.*;
import jakarta.persistence.EntityNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Comparator;
import java.util.List;

@Service
@Transactional(readOnly = true)
public class PublicPortfolioService {

    private final ArtistProfileRepository artistProfileRepository;
    private final ArtworkCollectionRepository collectionRepository;
    private final ArtworkRepository artworkRepository;
    private final ExhibitionRepository exhibitionRepository;
    private final PublicationRepository publicationRepository;
    private final SiteContentRepository siteContentRepository;

    public PublicPortfolioService(
            ArtistProfileRepository artistProfileRepository,
            ArtworkCollectionRepository collectionRepository,
            ArtworkRepository artworkRepository,
            ExhibitionRepository exhibitionRepository,
            PublicationRepository publicationRepository,
            SiteContentRepository siteContentRepository) {
        this.artistProfileRepository = artistProfileRepository;
        this.collectionRepository = collectionRepository;
        this.artworkRepository = artworkRepository;
        this.exhibitionRepository = exhibitionRepository;
        this.publicationRepository = publicationRepository;
        this.siteContentRepository = siteContentRepository;
    }

    public ArtistProfileResponse getProfile() {
        return artistProfileRepository.findAll().stream().findFirst()
                .map(p -> new ArtistProfileResponse(
                        p.getName(), p.getSubtitle(), p.getBio(), p.getStatement(),
                        p.getProfileImageUrl(), p.getSignatureImageUrl(), p.getInstagram(),
                        p.getFacebook(), p.getYoutube(), p.getEmail()))
                .orElseThrow(() -> new EntityNotFoundException("Artist profile not found"));
    }

    public List<CollectionResponse> getCollections() {
        return collectionRepository.findByActiveTrueOrderBySortOrderAscNameAsc().stream()
                .map(c -> new CollectionResponse(c.getName(), c.getSlug(), c.getDescription(), c.getCoverImageUrl(), c.getSortOrder()))
                .toList();
    }

    public List<ArtworkResponse> getArtworks(Boolean featured, String collectionSlug) {
        List<Artwork> artworks;
        if (collectionSlug != null && !collectionSlug.isBlank()) {
            artworks = artworkRepository.findVisibleByCollectionSlug(collectionSlug);
            if (Boolean.TRUE.equals(featured)) {
                artworks = artworks.stream().filter(Artwork::isFeatured).toList();
            }
        } else if (Boolean.TRUE.equals(featured)) {
            artworks = artworkRepository.findByVisibleTrueAndFeaturedTrueOrderBySortOrderAscYearDescTitleAsc();
        } else {
            artworks = artworkRepository.findByVisibleTrueOrderBySortOrderAscYearDescTitleAsc();
        }
        return artworks.stream().map(this::toArtworkResponse).toList();
    }

    public ArtworkResponse getArtwork(String slug) {
        return artworkRepository.findBySlugAndVisibleTrue(slug)
                .map(this::toArtworkResponse)
                .orElseThrow(() -> new EntityNotFoundException("Artwork not found: " + slug));
    }

    public List<ExhibitionResponse> getExhibitions() {
        return exhibitionRepository.findAllByOrderBySortOrderAscStartDateDescTitleAsc().stream()
                .map(e -> new ExhibitionResponse(
                        e.getTitle(), e.getSlug(), e.getDescription(), e.getStartDate(), e.getEndDate(),
                        e.getLocationName(), e.getLocationAddress(), e.getImageUrl(), e.isCurrent(), e.getSortOrder()))
                .toList();
    }

    public List<PublicationResponse> getPublications(Boolean featured) {
        var items = Boolean.TRUE.equals(featured)
                ? publicationRepository.findByVisibleTrueAndFeaturedTrueOrderBySortOrderAscPublicationDateDescTitleAsc()
                : publicationRepository.findByVisibleTrueOrderBySortOrderAscPublicationDateDescTitleAsc();
        return items.stream().map(p -> new PublicationResponse(
                p.getTitle(), p.getSlug(), p.getPublicationType(), p.getPublisherName(), p.getAuthorName(),
                p.getPublicationDate(), p.getDescription(), p.getExternalUrl(), p.getCoverImageUrl(),
                p.getFileUrl(), p.getReference(), p.isFeatured(), p.getSortOrder())).toList();
    }

    public PublicationResponse getPublication(String slug) {
        var p = publicationRepository.findBySlugAndVisibleTrue(slug)
                .orElseThrow(() -> new EntityNotFoundException("Publication not found: " + slug));
        return new PublicationResponse(
                p.getTitle(), p.getSlug(), p.getPublicationType(), p.getPublisherName(), p.getAuthorName(),
                p.getPublicationDate(), p.getDescription(), p.getExternalUrl(), p.getCoverImageUrl(),
                p.getFileUrl(), p.getReference(), p.isFeatured(), p.getSortOrder());
    }

    public List<SiteContentResponse> getSiteContent() {
        return siteContentRepository.findByActiveTrueOrderBySortOrderAsc().stream()
                .map(c -> new SiteContentResponse(c.getKey(), c.getTitle(), c.getContent(), c.getType(), c.getImageUrl(), c.getSortOrder()))
                .toList();
    }

    private ArtworkResponse toArtworkResponse(Artwork a) {
        List<ArtworkImageResponse> images = a.getImages().stream()
                .sorted(Comparator.comparing(ArtworkImage::getSortOrder))
                .map(i -> new ArtworkImageResponse(i.getImageUrl(), i.getAltText(), i.getSortOrder(), i.isMain()))
                .toList();

        String mainImage = a.getImages().stream()
                .filter(ArtworkImage::isMain)
                .findFirst()
                .or(() -> a.getImages().stream().min(Comparator.comparing(ArtworkImage::getSortOrder)))
                .map(ArtworkImage::getImageUrl)
                .orElse(null);

        return new ArtworkResponse(
                a.getTitle(), a.getSlug(), a.getYear(), a.getDescription(), a.getWidthCm(), a.getHeightCm(),
                a.getPrice(), a.getStatus(), a.isFeatured(),
                a.getCollection() != null ? a.getCollection().getName() : null,
                a.getCollection() != null ? a.getCollection().getSlug() : null,
                a.getTechnique() != null ? a.getTechnique().getName() : null,
                a.getStyle() != null ? a.getStyle().getName() : null,
                mainImage, images
        );
    }
}
