ALTER TABLE artwork
    ADD COLUMN hero_position INTEGER;

ALTER TABLE artwork
    ADD CONSTRAINT chk_artwork_hero_position
        CHECK (hero_position IS NULL OR hero_position BETWEEN 1 AND 3);

CREATE UNIQUE INDEX uq_artwork_hero_position
    ON artwork(hero_position)
    WHERE hero_position IS NOT NULL;