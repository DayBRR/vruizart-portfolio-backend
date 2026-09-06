DROP INDEX IF EXISTS idx_artwork_style_id;

ALTER TABLE artwork
DROP CONSTRAINT IF EXISTS fk_artwork_style;

ALTER TABLE artwork
DROP COLUMN IF EXISTS style_id;

DROP TABLE IF EXISTS style;