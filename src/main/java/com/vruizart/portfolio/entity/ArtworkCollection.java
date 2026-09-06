package com.vruizart.portfolio.entity;

import jakarta.persistence.*;
import java.util.UUID;

@Entity
@Table(name = "collection")
public class ArtworkCollection extends BaseAuditableEntity {
    @Id @GeneratedValue
    private UUID id;
    @Column(nullable = false, length = 100)
    private String name;
    @Column(nullable = false, unique = true, length = 100)
    private String slug;
    @Column(columnDefinition = "text")
    private String description;
    @Column(name = "cover_image_url", length = 255)
    private String coverImageUrl;
    @Column(name = "sort_order", nullable = false)
    private Integer sortOrder = 0;
    @Column(name = "is_active", nullable = false)
    private boolean active = true;

    public UUID getId() { return id; }
    public String getName() { return name; }
    public String getSlug() { return slug; }
    public String getDescription() { return description; }
    public String getCoverImageUrl() { return coverImageUrl; }
    public Integer getSortOrder() { return sortOrder; }
    public boolean isActive() { return active; }
}
