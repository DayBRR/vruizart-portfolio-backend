ALTER TYPE content_type ADD VALUE IF NOT EXISTS 'HERO';

ALTER TABLE site_content
    ADD COLUMN subtitle VARCHAR(255),
    ADD COLUMN button_label VARCHAR(100),
    ADD COLUMN button_url VARCHAR(255);