package com.vruizart.portfolio.entity;

import jakarta.persistence.*;
import lombok.Getter;

import java.time.LocalDateTime;
import java.util.UUID;

@Entity
@Table(name = "artwork_image")
public class ArtworkImage {

    @Getter
    @Id
    @GeneratedValue
    private UUID id;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "artwork_id", nullable = false)
    private Artwork artwork;

    @Getter
    @Column(name = "image_url", nullable = false, length = 255)
    private String imageUrl;

    @Getter
    @Column(name = "alt_text", length = 255)
    private String altText;

    @Getter
    @Column(name = "sort_order", nullable = false)
    private Integer sortOrder = 0;

    @Getter
    @Column(name = "is_main", nullable = false)
    private boolean main = false;

    @Column(name = "created_at", nullable = false, updatable = false)
    private LocalDateTime createdAt;

    @PrePersist
    void prePersist() {
        if (createdAt == null) {
            createdAt = LocalDateTime.now();
        }
    }
}
