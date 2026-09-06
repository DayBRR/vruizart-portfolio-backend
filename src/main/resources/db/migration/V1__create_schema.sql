-- =========================================================
-- vruizart-portfolio
-- Esquema PostgreSQL completo
-- Incluye:
--   - artwork.observations
--   - artwork_status.PRIVATE_COLLECTION
--   - tabla independiente publication
-- =========================================================

CREATE EXTENSION IF NOT EXISTS pgcrypto;

-- =========================
-- ENUMS
-- =========================

CREATE TYPE artwork_status AS ENUM (
    'AVAILABLE',
    'SOLD',
    'NOT_FOR_SALE',
    'RESERVED',
    'PRIVATE_COLLECTION'
);

CREATE TYPE content_type AS ENUM (
    'TEXT',
    'IMAGE',
    'TEXT_IMAGE',
    'QUOTE',
    'VIDEO'
);

CREATE TYPE publication_type AS ENUM (
    'PRESS',
    'MAGAZINE',
    'BOOK',
    'CATALOG',
    'WEB_ARTICLE',
    'VIDEO',
    'PODCAST',
    'TV',
    'RADIO',
    'OTHER'
);

-- =========================
-- ARTIST PROFILE
-- =========================

CREATE TABLE artist_profile (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name VARCHAR(100) NOT NULL,
    subtitle VARCHAR(150),
    bio TEXT,
    statement TEXT,
    profile_image_url VARCHAR(255),
    signature_image_url VARCHAR(255),
    instagram VARCHAR(100),
    facebook VARCHAR(100),
    youtube VARCHAR(100),
    email VARCHAR(150),
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- =========================
-- COLLECTION
-- =========================

CREATE TABLE collection (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name VARCHAR(100) NOT NULL,
    slug VARCHAR(100) NOT NULL UNIQUE,
    description TEXT,
    cover_image_url VARCHAR(255),
    sort_order INTEGER NOT NULL DEFAULT 0,
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- =========================
-- TECHNIQUE
-- =========================

CREATE TABLE technique (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name VARCHAR(100) NOT NULL UNIQUE,
    description TEXT,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- =========================
-- STYLE
-- =========================

CREATE TABLE style (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name VARCHAR(100) NOT NULL UNIQUE,
    description TEXT,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- =========================
-- ARTWORK
-- =========================

CREATE TABLE artwork (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    collection_id UUID,
    technique_id UUID,
    style_id UUID,
    title VARCHAR(150) NOT NULL,
    slug VARCHAR(150) NOT NULL UNIQUE,
    year INTEGER,
    description TEXT,
    observations TEXT,
    width_cm DECIMAL(6,2),
    height_cm DECIMAL(6,2),
    price DECIMAL(10,2),
    status artwork_status NOT NULL DEFAULT 'AVAILABLE',
    is_featured BOOLEAN NOT NULL DEFAULT FALSE,
    is_visible BOOLEAN NOT NULL DEFAULT TRUE,
    sort_order INTEGER NOT NULL DEFAULT 0,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_artwork_collection
        FOREIGN KEY (collection_id)
        REFERENCES collection(id)
        ON DELETE SET NULL,

    CONSTRAINT fk_artwork_technique
        FOREIGN KEY (technique_id)
        REFERENCES technique(id)
        ON DELETE SET NULL,

    CONSTRAINT fk_artwork_style
        FOREIGN KEY (style_id)
        REFERENCES style(id)
        ON DELETE SET NULL
);

-- =========================
-- ARTWORK IMAGE
-- =========================

CREATE TABLE artwork_image (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    artwork_id UUID NOT NULL,
    image_url VARCHAR(255) NOT NULL,
    alt_text VARCHAR(255),
    sort_order INTEGER NOT NULL DEFAULT 0,
    is_main BOOLEAN NOT NULL DEFAULT FALSE,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_artwork_image_artwork
        FOREIGN KEY (artwork_id)
        REFERENCES artwork(id)
        ON DELETE CASCADE
);

-- =========================
-- EXHIBITION
-- =========================

CREATE TABLE exhibition (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    title VARCHAR(150) NOT NULL,
    slug VARCHAR(150) NOT NULL UNIQUE,
    description TEXT,
    start_date DATE,
    end_date DATE,
    location_name VARCHAR(150),
    location_address VARCHAR(255),
    image_url VARCHAR(255),
    is_current BOOLEAN NOT NULL DEFAULT FALSE,
    sort_order INTEGER NOT NULL DEFAULT 0,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- =========================
-- EXHIBITION <-> ARTWORK
-- =========================

CREATE TABLE exhibition_artwork (
    exhibition_id UUID NOT NULL,
    artwork_id UUID NOT NULL,
    sort_order INTEGER NOT NULL DEFAULT 0,

    PRIMARY KEY (exhibition_id, artwork_id),

    CONSTRAINT fk_exhibition_artwork_exhibition
        FOREIGN KEY (exhibition_id)
        REFERENCES exhibition(id)
        ON DELETE CASCADE,

    CONSTRAINT fk_exhibition_artwork_artwork
        FOREIGN KEY (artwork_id)
        REFERENCES artwork(id)
        ON DELETE CASCADE
);

-- =========================
-- PUBLICATION
-- Tabla independiente, sin FK a artwork.
-- =========================

CREATE TABLE publication (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    title VARCHAR(200) NOT NULL,
    slug VARCHAR(200) NOT NULL UNIQUE,
    publication_type publication_type NOT NULL,
    publisher_name VARCHAR(150),
    author_name VARCHAR(150),
    publication_date DATE,
    description TEXT,
    external_url VARCHAR(500),
    cover_image_url VARCHAR(255),
    file_url VARCHAR(255),
    reference VARCHAR(255),
    is_featured BOOLEAN NOT NULL DEFAULT FALSE,
    is_visible BOOLEAN NOT NULL DEFAULT TRUE,
    sort_order INTEGER NOT NULL DEFAULT 0,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- =========================
-- SITE CONTENT
-- =========================

CREATE TABLE site_content (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    key VARCHAR(100) NOT NULL UNIQUE,
    title VARCHAR(255),
    content TEXT,
    type content_type NOT NULL DEFAULT 'TEXT',
    image_url VARCHAR(255),
    sort_order INTEGER NOT NULL DEFAULT 0,
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- =========================
-- CONTACT MESSAGE
-- =========================

CREATE TABLE contact_message (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL,
    subject VARCHAR(150),
    message TEXT NOT NULL,
    is_read BOOLEAN NOT NULL DEFAULT FALSE,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- =========================
-- INDEXES
-- =========================

CREATE INDEX idx_artwork_collection_id
    ON artwork(collection_id);

CREATE INDEX idx_artwork_technique_id
    ON artwork(technique_id);

CREATE INDEX idx_artwork_style_id
    ON artwork(style_id);

CREATE INDEX idx_artwork_status
    ON artwork(status);

CREATE INDEX idx_artwork_visible
    ON artwork(is_visible);

CREATE INDEX idx_artwork_featured
    ON artwork(is_featured);

CREATE INDEX idx_artwork_sort_order
    ON artwork(sort_order);

CREATE INDEX idx_artwork_image_artwork_id
    ON artwork_image(artwork_id);

CREATE INDEX idx_artwork_image_sort_order
    ON artwork_image(sort_order);

CREATE INDEX idx_exhibition_start_date
    ON exhibition(start_date);

CREATE INDEX idx_exhibition_current
    ON exhibition(is_current);

CREATE INDEX idx_exhibition_artwork_artwork
    ON exhibition_artwork(artwork_id);

CREATE INDEX idx_publication_type
    ON publication(publication_type);

CREATE INDEX idx_publication_date
    ON publication(publication_date);

CREATE INDEX idx_publication_visible
    ON publication(is_visible);

CREATE INDEX idx_publication_featured
    ON publication(is_featured);

CREATE INDEX idx_publication_sort_order
    ON publication(sort_order);

CREATE INDEX idx_site_content_active
    ON site_content(is_active);

CREATE INDEX idx_site_content_sort_order
    ON site_content(sort_order);

CREATE INDEX idx_contact_message_read
    ON contact_message(is_read);

CREATE INDEX idx_contact_message_created_at
    ON contact_message(created_at);
