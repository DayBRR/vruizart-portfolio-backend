package com.vruizart.portfolio.entity;

import jakarta.persistence.*;
import java.time.LocalDateTime;
import java.util.UUID;

@Entity
@Table(name = "artwork_image")
public class ArtworkImage {
    @Id @GeneratedValue
    private UUID id;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "artwork_id", nullable = false)
    private Artwork artwork;

    @Column(name = "image_url", nullable = false, length = 255)
    private String imageUrl;
    @Column(name = "alt_text", length = 255)
    private String altText;
    @Column(name = "sort_order", nullable = false)
    private Integer sortOrder = 0;
    @Column(name = "is_main", nullable = false)
    private boolean main = false;
    @Column(name = "created_at", nullable = false, updatable = false)
    private LocalDateTime createdAt;

    @PrePersist
    void prePersist() { if (createdAt == null) createdAt = LocalDateTime.now(); }

    public UUID getId() { return id; }
    public String getImageUrl() { return imageUrl; }
    public String getAltText() { return altText; }
    public Integer getSortOrder() { return sortOrder; }
    public boolean isMain() { return main; }
}
