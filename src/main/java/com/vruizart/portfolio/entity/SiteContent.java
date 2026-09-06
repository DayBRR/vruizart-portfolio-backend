package com.vruizart.portfolio.entity;

import jakarta.persistence.*;
import org.hibernate.annotations.JdbcTypeCode;
import org.hibernate.type.SqlTypes;
import java.util.UUID;

@Entity
@Table(name = "site_content")
public class SiteContent extends BaseAuditableEntity {
    @Id @GeneratedValue
    private UUID id;
    @Column(nullable = false, unique = true, length = 100)
    private String key;
    @Column(length = 255)
    private String title;
    @Column(columnDefinition = "text")
    private String content;
    @Enumerated(EnumType.STRING)
    @JdbcTypeCode(SqlTypes.NAMED_ENUM)
    @Column(nullable = false, columnDefinition = "content_type")
    private ContentType type = ContentType.TEXT;
    @Column(name = "image_url", length = 255)
    private String imageUrl;
    @Column(name = "sort_order", nullable = false)
    private Integer sortOrder = 0;
    @Column(name = "is_active", nullable = false)
    private boolean active = true;

    public UUID getId() { return id; }
    public String getKey() { return key; }
    public String getTitle() { return title; }
    public String getContent() { return content; }
    public ContentType getType() { return type; }
    public String getImageUrl() { return imageUrl; }
    public Integer getSortOrder() { return sortOrder; }
    public boolean isActive() { return active; }
}
