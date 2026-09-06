package com.vruizart.portfolio.entity;

import jakarta.persistence.*;
import lombok.Getter;

import java.time.LocalDate;
import java.util.UUID;

@Getter
@Entity
@Table(name = "exhibition")
public class Exhibition extends BaseAuditableEntity {

    @Id
    @GeneratedValue
    private UUID id;

    @Column(nullable = false, length = 150)
    private String title;

    @Column(nullable = false, unique = true, length = 150)
    private String slug;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private ExhibitionType type;

    @Column(columnDefinition = "text")
    private String description;

    @Column(name = "start_date")
    private LocalDate startDate;

    @Column(name = "end_date")
    private LocalDate endDate;

    @Column
    private Integer year;

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
}
