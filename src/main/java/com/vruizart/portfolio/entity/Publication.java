package com.vruizart.portfolio.entity;

import jakarta.persistence.*;
import org.hibernate.annotations.JdbcTypeCode;
import org.hibernate.type.SqlTypes;
import java.time.LocalDate;
import java.util.UUID;

@Entity
@Table(name = "publication")
public class Publication extends BaseAuditableEntity {
    @Id @GeneratedValue
    private UUID id;
    @Column(nullable = false, length = 200)
    private String title;
    @Column(nullable = false, unique = true, length = 200)
    private String slug;
    @Enumerated(EnumType.STRING)
    @JdbcTypeCode(SqlTypes.NAMED_ENUM)
    @Column(name = "publication_type", nullable = false, columnDefinition = "publication_type")
    private PublicationType publicationType;
    @Column(name = "publisher_name", length = 150)
    private String publisherName;
    @Column(name = "author_name", length = 150)
    private String authorName;
    @Column(name = "publication_date")
    private LocalDate publicationDate;
    @Column(columnDefinition = "text")
    private String description;
    @Column(name = "external_url", length = 500)
    private String externalUrl;
    @Column(name = "cover_image_url", length = 255)
    private String coverImageUrl;
    @Column(name = "file_url", length = 255)
    private String fileUrl;
    @Column(length = 255)
    private String reference;
    @Column(name = "is_featured", nullable = false)
    private boolean featured = false;
    @Column(name = "is_visible", nullable = false)
    private boolean visible = true;
    @Column(name = "sort_order", nullable = false)
    private Integer sortOrder = 0;

    public UUID getId() { return id; }
    public String getTitle() { return title; }
    public String getSlug() { return slug; }
    public PublicationType getPublicationType() { return publicationType; }
    public String getPublisherName() { return publisherName; }
    public String getAuthorName() { return authorName; }
    public LocalDate getPublicationDate() { return publicationDate; }
    public String getDescription() { return description; }
    public String getExternalUrl() { return externalUrl; }
    public String getCoverImageUrl() { return coverImageUrl; }
    public String getFileUrl() { return fileUrl; }
    public String getReference() { return reference; }
    public boolean isFeatured() { return featured; }
    public boolean isVisible() { return visible; }
    public Integer getSortOrder() { return sortOrder; }
}
