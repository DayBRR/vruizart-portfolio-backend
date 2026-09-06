package com.vruizart.portfolio.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "exhibition_artwork")
@IdClass(ExhibitionArtworkId.class)
public class ExhibitionArtwork {
    @Id
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "exhibition_id", nullable = false)
    private Exhibition exhibition;

    @Id
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "artwork_id", nullable = false)
    private Artwork artwork;

    @Column(name = "sort_order", nullable = false)
    private Integer sortOrder = 0;

    public Exhibition getExhibition() { return exhibition; }
    public Artwork getArtwork() { return artwork; }
    public Integer getSortOrder() { return sortOrder; }
}
