package com.vruizart.portfolio.controller;

import com.vruizart.portfolio.dto.*;
import com.vruizart.portfolio.service.PublicPortfolioService;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@RequestMapping("/api/public")
public class PublicPortfolioController {
    private final PublicPortfolioService service;

    public PublicPortfolioController(PublicPortfolioService service) {
        this.service = service;
    }

    @GetMapping("/profile")
    public ArtistProfileResponse profile() { return service.getProfile(); }

    @GetMapping("/collections")
    public List<CollectionResponse> collections() { return service.getCollections(); }

    @GetMapping("/artworks")
    public List<ArtworkResponse> artworks(
            @RequestParam(required = false) Boolean featured,
            @RequestParam(required = false) String collection) {
        return service.getArtworks(featured, collection);
    }

    @GetMapping("/artworks/{slug}")
    public ArtworkResponse artwork(@PathVariable String slug) { return service.getArtwork(slug); }

    @GetMapping("/exhibitions")
    public List<ExhibitionResponse> exhibitions() { return service.getExhibitions(); }

    @GetMapping("/publications")
    public List<PublicationResponse> publications(@RequestParam(required = false) Boolean featured) {
        return service.getPublications(featured);
    }

    @GetMapping("/publications/{slug}")
    public PublicationResponse publication(@PathVariable String slug) { return service.getPublication(slug); }

    @GetMapping("/content")
    public List<SiteContentResponse> content() { return service.getSiteContent(); }
}
