package com.vruizart.portfolio.entity;

import jakarta.persistence.*;
import java.time.LocalDate;
import java.util.UUID;

@Entity
@Table(name = "exhibition")
public class Exhibition extends BaseAuditableEntity {
    @Id @GeneratedValue
    private UUID id;
    @Column(nullable = false, length = 150)
    private String title;
    @Column(nullable = false, unique = true, length = 150)
    private String slug;
    @Column(columnDefinition = "text")
    private String description;
    @Column(name = "start_date")
    private LocalDate startDate;
    @Column(name = "end_date")
    private LocalDate endDate;
    @Column(name = "location_name", length = 150)
    private String locationName;
    @Column(name = "location_address", length = 255)
    private String locationAddress;
    @Column(name = "image_url", length = 255)
    private String imageUrl;
    @Column(name = "is_current", nullable = false)
    private boolean current = false;
    @Column(name = "sort_order", nullable = false)
    private Integer sortOrder = 0;

    public UUID getId() { return id; }
    public String getTitle() { return title; }
    public String getSlug() { return slug; }
    public String getDescription() { return description; }
    public LocalDate getStartDate() { return startDate; }
    public LocalDate getEndDate() { return endDate; }
    public String getLocationName() { return locationName; }
    public String getLocationAddress() { return locationAddress; }
    public String getImageUrl() { return imageUrl; }
    public boolean isCurrent() { return current; }
    public Integer getSortOrder() { return sortOrder; }
}
