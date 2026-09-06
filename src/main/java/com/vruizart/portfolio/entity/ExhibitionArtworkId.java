package com.vruizart.portfolio.entity;

import java.io.Serializable;
import java.util.Objects;
import java.util.UUID;

public class ExhibitionArtworkId implements Serializable {
    private UUID exhibition;
    private UUID artwork;

    public ExhibitionArtworkId() {}
    public ExhibitionArtworkId(UUID exhibition, UUID artwork) {
        this.exhibition = exhibition;
        this.artwork = artwork;
    }
    public UUID getExhibition() { return exhibition; }
    public UUID getArtwork() { return artwork; }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof ExhibitionArtworkId that)) return false;
        return Objects.equals(exhibition, that.exhibition) && Objects.equals(artwork, that.artwork);
    }

    @Override
    public int hashCode() { return Objects.hash(exhibition, artwork); }
}
