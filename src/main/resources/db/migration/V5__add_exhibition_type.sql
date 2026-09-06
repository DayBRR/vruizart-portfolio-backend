CREATE TYPE exhibition_type AS ENUM (
    'INDIVIDUAL',
    'COLLECTIVE'
);

ALTER TABLE exhibition
    ADD COLUMN type exhibition_type NOT NULL DEFAULT 'INDIVIDUAL';