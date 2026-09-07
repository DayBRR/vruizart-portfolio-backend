ALTER TABLE publication
    ADD COLUMN publication_year INTEGER;

CREATE TABLE publication_image (
                                   id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
                                   publication_id UUID NOT NULL,
                                   image_url VARCHAR(255) NOT NULL,
                                   alt_text VARCHAR(255),
                                   sort_order INTEGER NOT NULL DEFAULT 0,
                                   is_cover BOOLEAN NOT NULL DEFAULT FALSE,
                                   created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

                                   CONSTRAINT fk_publication_image_publication
                                       FOREIGN KEY (publication_id)
                                           REFERENCES publication(id)
                                           ON DELETE CASCADE
);

CREATE INDEX idx_publication_image_publication
    ON publication_image(publication_id);

CREATE INDEX idx_publication_year
    ON publication(publication_year);