package com.vruizart.portfolio.entity;

import jakarta.persistence.*;
import lombok.Getter;
import org.hibernate.annotations.JdbcTypeCode;
import org.hibernate.type.SqlTypes;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Getter
@Entity
@Table(name = "artwork")
public class Artwork extends BaseAuditableEntity {

    @Id
    @GeneratedValue
    private UUID id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "collection_id")
    private ArtworkCollection collection;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "technique_id")
    private Technique technique;

    @Column(nullable = false, length = 150)
    private String title;

    @Column(nullable = false, unique = true, length = 150)
    private String slug;

    private Integer year;

    @Column(columnDefinition = "text")
    private String description;

    @Column(columnDefinition = "text")
    private String observations;

    @Column(name = "width_cm", precision = 6, scale = 2)
    private BigDecimal widthCm;

    @Column(name = "height_cm", precision = 6, scale = 2)
    private BigDecimal heightCm;

    @Column(precision = 10, scale = 2)
    private BigDecimal price;

    @Enumerated(EnumType.STRING)
    @JdbcTypeCode(SqlTypes.NAMED_ENUM)
    @Column(nullable = false, columnDefinition = "artwork_status")
    private ArtworkStatus status = ArtworkStatus.AVAILABLE;

    @Column(name = "is_featured", nullable = false)
    private boolean featured = false;

    @Column(name = "is_visible", nullable = false)
    private boolean visible = true;

    @Column(name = "sort_order", nullable = false)
    private Integer sortOrder = 0;

    @OneToMany(
        mappedBy = "artwork",
        fetch = FetchType.LAZY,
        cascade = CascadeType.ALL,
        orphanRemoval = true
    )
    @OrderBy("sortOrder ASC")
    private List<ArtworkImage> images = new ArrayList<>();
}
