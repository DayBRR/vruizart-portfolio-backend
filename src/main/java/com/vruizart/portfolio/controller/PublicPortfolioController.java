package com.vruizart.portfolio.controller;

import com.vruizart.portfolio.dto.*;
import com.vruizart.portfolio.service.PublicPortfolioService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/public")
@RequiredArgsConstructor
public class PublicPortfolioController {

    private final PublicPortfolioService service;

    @GetMapping("/profile")
    public ArtistProfileResponse profile() {
        return service.getProfile();
    }

    @GetMapping("/collections")
    public List<CollectionResponse> collections() {
        return service.getCollections();
    }

    @GetMapping("/artworks")
    public Page<ArtworkResponse> artworks(
            @RequestParam(required = false) String collection,
            @PageableDefault(size = 12) Pageable pageable
    ) {
        return service.getArtworks(collection, pageable);
    }

    @GetMapping("/artworks/hero")
    public List<ArtworkResponse> heroArtworks() {
        return service.getHeroArtworks();
    }

    @GetMapping("/artworks/featured")
    public List<ArtworkResponse> featuredArtworks() {
        return service.getFeaturedArtworks();
    }

    @GetMapping("/artworks/{slug}")
    public ArtworkResponse artwork(@PathVariable String slug) {
        return service.getArtwork(slug);
    }

    @GetMapping("/exhibitions")
    public List<ExhibitionResponse> exhibitions() {
        return service.getExhibitions();
    }

    @GetMapping("/publications")
    public List<PublicationResponse> publications(@RequestParam(required = false) Boolean featured) {
        return service.getPublications(featured);
    }

    @GetMapping("/publications/{slug}")
    public PublicationResponse publication(@PathVariable String slug) {
        return service.getPublication(slug);
    }

    @GetMapping("/content")
    public List<SiteContentResponse> content() {
        return service.getSiteContent();
    }

    @GetMapping("/content/hero")
    public List<SiteContentResponse> heroContent() {
        return service.getHeroContent();
    }
}
