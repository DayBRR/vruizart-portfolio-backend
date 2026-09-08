-- =========================================================
-- Seed manual: imágenes principales de obras
-- Generado a partir de artworks.zip
--
-- Convención:
--   Angular: src/assets/images/artworks/<coleccion>/<archivo>
--   BBDD:    assets/images/artworks/<coleccion>/<archivo>
--
-- Una imagen principal por obra:
--   sort_order = 1
--   is_main    = TRUE
--
-- El script es idempotente por artwork_id + image_url.
-- =========================================================

INSERT INTO artwork_image (
    artwork_id,
    image_url,
    alt_text,
    sort_order,
    is_main
)
SELECT
    a.id,
    'assets/images/artworks/20x20/After Painting.jpg',
    'After Painting — Vicente Ruiz',
    1,
    TRUE
FROM artwork a
WHERE a.slug = 'after-painting'
  AND NOT EXISTS (
    SELECT 1
    FROM artwork_image ai
    WHERE ai.artwork_id = a.id
      AND ai.image_url = 'assets/images/artworks/20x20/After Painting.jpg'
);

INSERT INTO artwork_image (
    artwork_id,
    image_url,
    alt_text,
    sort_order,
    is_main
)
SELECT
    a.id,
    'assets/images/artworks/20x20/Alma del Ebro.jpg',
    'Alma del Ebro — Vicente Ruiz',
    1,
    TRUE
FROM artwork a
WHERE a.slug = 'alma-del-ebro'
  AND NOT EXISTS (
    SELECT 1
    FROM artwork_image ai
    WHERE ai.artwork_id = a.id
      AND ai.image_url = 'assets/images/artworks/20x20/Alma del Ebro.jpg'
);

INSERT INTO artwork_image (
    artwork_id,
    image_url,
    alt_text,
    sort_order,
    is_main
)
SELECT
    a.id,
    'assets/images/artworks/20x20/Ana Piruleta.jpg',
    'Ana Piruleta — Vicente Ruiz',
    1,
    TRUE
FROM artwork a
WHERE a.slug = 'ana-piruleta'
  AND NOT EXISTS (
    SELECT 1
    FROM artwork_image ai
    WHERE ai.artwork_id = a.id
      AND ai.image_url = 'assets/images/artworks/20x20/Ana Piruleta.jpg'
);

INSERT INTO artwork_image (
    artwork_id,
    image_url,
    alt_text,
    sort_order,
    is_main
)
SELECT
    a.id,
    'assets/images/artworks/20x20/Anekke.jpg',
    'Anekke — Vicente Ruiz',
    1,
    TRUE
FROM artwork a
WHERE a.slug = 'anekke'
  AND NOT EXISTS (
    SELECT 1
    FROM artwork_image ai
    WHERE ai.artwork_id = a.id
      AND ai.image_url = 'assets/images/artworks/20x20/Anekke.jpg'
);

INSERT INTO artwork_image (
    artwork_id,
    image_url,
    alt_text,
    sort_order,
    is_main
)
SELECT
    a.id,
    'assets/images/artworks/20x20/Basura.jpg',
    'Basura — Vicente Ruiz',
    1,
    TRUE
FROM artwork a
WHERE a.slug = 'basura'
  AND NOT EXISTS (
    SELECT 1
    FROM artwork_image ai
    WHERE ai.artwork_id = a.id
      AND ai.image_url = 'assets/images/artworks/20x20/Basura.jpg'
);

INSERT INTO artwork_image (
    artwork_id,
    image_url,
    alt_text,
    sort_order,
    is_main
)
SELECT
    a.id,
    'assets/images/artworks/20x20/Caixaforum.jpg',
    'Caixaforum — Vicente Ruiz',
    1,
    TRUE
FROM artwork a
WHERE a.slug = 'caixaforum'
  AND NOT EXISTS (
    SELECT 1
    FROM artwork_image ai
    WHERE ai.artwork_id = a.id
      AND ai.image_url = 'assets/images/artworks/20x20/Caixaforum.jpg'
);

INSERT INTO artwork_image (
    artwork_id,
    image_url,
    alt_text,
    sort_order,
    is_main
)
SELECT
    a.id,
    'assets/images/artworks/20x20/Candado.jpg',
    'Candado — Vicente Ruiz',
    1,
    TRUE
FROM artwork a
WHERE a.slug = 'candado'
  AND NOT EXISTS (
    SELECT 1
    FROM artwork_image ai
    WHERE ai.artwork_id = a.id
      AND ai.image_url = 'assets/images/artworks/20x20/Candado.jpg'
);

INSERT INTO artwork_image (
    artwork_id,
    image_url,
    alt_text,
    sort_order,
    is_main
)
SELECT
    a.id,
    'assets/images/artworks/20x20/Coke.jpg',
    'Coke — Vicente Ruiz',
    1,
    TRUE
FROM artwork a
WHERE a.slug = 'coke'
  AND NOT EXISTS (
    SELECT 1
    FROM artwork_image ai
    WHERE ai.artwork_id = a.id
      AND ai.image_url = 'assets/images/artworks/20x20/Coke.jpg'
);

INSERT INTO artwork_image (
    artwork_id,
    image_url,
    alt_text,
    sort_order,
    is_main
)
SELECT
    a.id,
    'assets/images/artworks/20x20/In Memoriam NYC.jpg',
    'In Memoriam NYC — Vicente Ruiz',
    1,
    TRUE
FROM artwork a
WHERE a.slug = 'in-memoriam-nyc'
  AND NOT EXISTS (
    SELECT 1
    FROM artwork_image ai
    WHERE ai.artwork_id = a.id
      AND ai.image_url = 'assets/images/artworks/20x20/In Memoriam NYC.jpg'
);

INSERT INTO artwork_image (
    artwork_id,
    image_url,
    alt_text,
    sort_order,
    is_main
)
SELECT
    a.id,
    'assets/images/artworks/20x20/Joven budista.jpg',
    'Joven budista — Vicente Ruiz',
    1,
    TRUE
FROM artwork a
WHERE a.slug = 'joven-budista'
  AND NOT EXISTS (
    SELECT 1
    FROM artwork_image ai
    WHERE ai.artwork_id = a.id
      AND ai.image_url = 'assets/images/artworks/20x20/Joven budista.jpg'
);

INSERT INTO artwork_image (
    artwork_id,
    image_url,
    alt_text,
    sort_order,
    is_main
)
SELECT
    a.id,
    'assets/images/artworks/20x20/Joven guerrero.jpg',
    'Joven guerrero — Vicente Ruiz',
    1,
    TRUE
FROM artwork a
WHERE a.slug = 'joven-guerrero'
  AND NOT EXISTS (
    SELECT 1
    FROM artwork_image ai
    WHERE ai.artwork_id = a.id
      AND ai.image_url = 'assets/images/artworks/20x20/Joven guerrero.jpg'
);

INSERT INTO artwork_image (
    artwork_id,
    image_url,
    alt_text,
    sort_order,
    is_main
)
SELECT
    a.id,
    'assets/images/artworks/20x20/La Partida.jpg',
    'La Partida — Vicente Ruiz',
    1,
    TRUE
FROM artwork a
WHERE a.slug = 'la-partida'
  AND NOT EXISTS (
    SELECT 1
    FROM artwork_image ai
    WHERE ai.artwork_id = a.id
      AND ai.image_url = 'assets/images/artworks/20x20/La Partida.jpg'
);

INSERT INTO artwork_image (
    artwork_id,
    image_url,
    alt_text,
    sort_order,
    is_main
)
SELECT
    a.id,
    'assets/images/artworks/20x20/Little Italy.jpg',
    'Little Italy — Vicente Ruiz',
    1,
    TRUE
FROM artwork a
WHERE a.slug = 'little-italy'
  AND NOT EXISTS (
    SELECT 1
    FROM artwork_image ai
    WHERE ai.artwork_id = a.id
      AND ai.image_url = 'assets/images/artworks/20x20/Little Italy.jpg'
);

INSERT INTO artwork_image (
    artwork_id,
    image_url,
    alt_text,
    sort_order,
    is_main
)
SELECT
    a.id,
    'assets/images/artworks/20x20/Nostalgia.jpg',
    'Nostalgia — Vicente Ruiz',
    1,
    TRUE
FROM artwork a
WHERE a.slug = 'nostalgia'
  AND NOT EXISTS (
    SELECT 1
    FROM artwork_image ai
    WHERE ai.artwork_id = a.id
      AND ai.image_url = 'assets/images/artworks/20x20/Nostalgia.jpg'
);

INSERT INTO artwork_image (
    artwork_id,
    image_url,
    alt_text,
    sort_order,
    is_main
)
SELECT
    a.id,
    'assets/images/artworks/20x20/NYC.jpg',
    'NYC — Vicente Ruiz',
    1,
    TRUE
FROM artwork a
WHERE a.slug = 'nyc'
  AND NOT EXISTS (
    SELECT 1
    FROM artwork_image ai
    WHERE ai.artwork_id = a.id
      AND ai.image_url = 'assets/images/artworks/20x20/NYC.jpg'
);

INSERT INTO artwork_image (
    artwork_id,
    image_url,
    alt_text,
    sort_order,
    is_main
)
SELECT
    a.id,
    'assets/images/artworks/20x20/Pilar.jpg',
    'Pilar — Vicente Ruiz',
    1,
    TRUE
FROM artwork a
WHERE a.slug = 'pilar'
  AND NOT EXISTS (
    SELECT 1
    FROM artwork_image ai
    WHERE ai.artwork_id = a.id
      AND ai.image_url = 'assets/images/artworks/20x20/Pilar.jpg'
);

INSERT INTO artwork_image (
    artwork_id,
    image_url,
    alt_text,
    sort_order,
    is_main
)
SELECT
    a.id,
    'assets/images/artworks/20x20/Second Life.jpg',
    'Second Life — Vicente Ruiz',
    1,
    TRUE
FROM artwork a
WHERE a.slug = 'second-life'
  AND NOT EXISTS (
    SELECT 1
    FROM artwork_image ai
    WHERE ai.artwork_id = a.id
      AND ai.image_url = 'assets/images/artworks/20x20/Second Life.jpg'
);

INSERT INTO artwork_image (
    artwork_id,
    image_url,
    alt_text,
    sort_order,
    is_main
)
SELECT
    a.id,
    'assets/images/artworks/leyendas-de-la-musica/Amaral.jpg',
    'Amaral — Vicente Ruiz',
    1,
    TRUE
FROM artwork a
WHERE a.slug = 'amaral'
  AND NOT EXISTS (
    SELECT 1
    FROM artwork_image ai
    WHERE ai.artwork_id = a.id
      AND ai.image_url = 'assets/images/artworks/leyendas-de-la-musica/Amaral.jpg'
);

INSERT INTO artwork_image (
    artwork_id,
    image_url,
    alt_text,
    sort_order,
    is_main
)
SELECT
    a.id,
    'assets/images/artworks/leyendas-de-la-musica/Amy.jpg',
    'Amy — Vicente Ruiz',
    1,
    TRUE
FROM artwork a
WHERE a.slug = 'amy'
  AND NOT EXISTS (
    SELECT 1
    FROM artwork_image ai
    WHERE ai.artwork_id = a.id
      AND ai.image_url = 'assets/images/artworks/leyendas-de-la-musica/Amy.jpg'
);

INSERT INTO artwork_image (
    artwork_id,
    image_url,
    alt_text,
    sort_order,
    is_main
)
SELECT
    a.id,
    'assets/images/artworks/leyendas-de-la-musica/Bowie II.jpg',
    'Bowie II — Vicente Ruiz',
    1,
    TRUE
FROM artwork a
WHERE a.slug = 'bowie-ii'
  AND NOT EXISTS (
    SELECT 1
    FROM artwork_image ai
    WHERE ai.artwork_id = a.id
      AND ai.image_url = 'assets/images/artworks/leyendas-de-la-musica/Bowie II.jpg'
);

INSERT INTO artwork_image (
    artwork_id,
    image_url,
    alt_text,
    sort_order,
    is_main
)
SELECT
    a.id,
    'assets/images/artworks/leyendas-de-la-musica/Bowie III.jpg',
    'Bowie III — Vicente Ruiz',
    1,
    TRUE
FROM artwork a
WHERE a.slug = 'bowie-iii'
  AND NOT EXISTS (
    SELECT 1
    FROM artwork_image ai
    WHERE ai.artwork_id = a.id
      AND ai.image_url = 'assets/images/artworks/leyendas-de-la-musica/Bowie III.jpg'
);

INSERT INTO artwork_image (
    artwork_id,
    image_url,
    alt_text,
    sort_order,
    is_main
)
SELECT
    a.id,
    'assets/images/artworks/leyendas-de-la-musica/Bowie.jpg',
    'Bowie — Vicente Ruiz',
    1,
    TRUE
FROM artwork a
WHERE a.slug = 'bowie'
  AND NOT EXISTS (
    SELECT 1
    FROM artwork_image ai
    WHERE ai.artwork_id = a.id
      AND ai.image_url = 'assets/images/artworks/leyendas-de-la-musica/Bowie.jpg'
);

INSERT INTO artwork_image (
    artwork_id,
    image_url,
    alt_text,
    sort_order,
    is_main
)
SELECT
    a.id,
    'assets/images/artworks/leyendas-de-la-musica/Bunbury II.jpg',
    'Bunbury II — Vicente Ruiz',
    1,
    TRUE
FROM artwork a
WHERE a.slug = 'bunbury-ii'
  AND NOT EXISTS (
    SELECT 1
    FROM artwork_image ai
    WHERE ai.artwork_id = a.id
      AND ai.image_url = 'assets/images/artworks/leyendas-de-la-musica/Bunbury II.jpg'
);

INSERT INTO artwork_image (
    artwork_id,
    image_url,
    alt_text,
    sort_order,
    is_main
)
SELECT
    a.id,
    'assets/images/artworks/leyendas-de-la-musica/Bunbury III.jpg',
    'Bunbury III — Vicente Ruiz',
    1,
    TRUE
FROM artwork a
WHERE a.slug = 'bunbury-iii'
  AND NOT EXISTS (
    SELECT 1
    FROM artwork_image ai
    WHERE ai.artwork_id = a.id
      AND ai.image_url = 'assets/images/artworks/leyendas-de-la-musica/Bunbury III.jpg'
);

INSERT INTO artwork_image (
    artwork_id,
    image_url,
    alt_text,
    sort_order,
    is_main
)
SELECT
    a.id,
    'assets/images/artworks/leyendas-de-la-musica/Bunbury.jpg',
    'Bunbury — Vicente Ruiz',
    1,
    TRUE
FROM artwork a
WHERE a.slug = 'bunbury'
  AND NOT EXISTS (
    SELECT 1
    FROM artwork_image ai
    WHERE ai.artwork_id = a.id
      AND ai.image_url = 'assets/images/artworks/leyendas-de-la-musica/Bunbury.jpg'
);

INSERT INTO artwork_image (
    artwork_id,
    image_url,
    alt_text,
    sort_order,
    is_main
)
SELECT
    a.id,
    'assets/images/artworks/leyendas-de-la-musica/Cooper.jpg',
    'Cooper — Vicente Ruiz',
    1,
    TRUE
FROM artwork a
WHERE a.slug = 'cooper'
  AND NOT EXISTS (
    SELECT 1
    FROM artwork_image ai
    WHERE ai.artwork_id = a.id
      AND ai.image_url = 'assets/images/artworks/leyendas-de-la-musica/Cooper.jpg'
);

INSERT INTO artwork_image (
    artwork_id,
    image_url,
    alt_text,
    sort_order,
    is_main
)
SELECT
    a.id,
    'assets/images/artworks/leyendas-de-la-musica/Cyrus.jpg',
    'Cyrus — Vicente Ruiz',
    1,
    TRUE
FROM artwork a
WHERE a.slug = 'cyrus'
  AND NOT EXISTS (
    SELECT 1
    FROM artwork_image ai
    WHERE ai.artwork_id = a.id
      AND ai.image_url = 'assets/images/artworks/leyendas-de-la-musica/Cyrus.jpg'
);

INSERT INTO artwork_image (
    artwork_id,
    image_url,
    alt_text,
    sort_order,
    is_main
)
SELECT
    a.id,
    'assets/images/artworks/leyendas-de-la-musica/Freddie II.jpg',
    'Freddie II — Vicente Ruiz',
    1,
    TRUE
FROM artwork a
WHERE a.slug = 'freddie-ii'
  AND NOT EXISTS (
    SELECT 1
    FROM artwork_image ai
    WHERE ai.artwork_id = a.id
      AND ai.image_url = 'assets/images/artworks/leyendas-de-la-musica/Freddie II.jpg'
);

INSERT INTO artwork_image (
    artwork_id,
    image_url,
    alt_text,
    sort_order,
    is_main
)
SELECT
    a.id,
    'assets/images/artworks/leyendas-de-la-musica/Freddie.jpg',
    'Freddie — Vicente Ruiz',
    1,
    TRUE
FROM artwork a
WHERE a.slug = 'freddie'
  AND NOT EXISTS (
    SELECT 1
    FROM artwork_image ai
    WHERE ai.artwork_id = a.id
      AND ai.image_url = 'assets/images/artworks/leyendas-de-la-musica/Freddie.jpg'
);

INSERT INTO artwork_image (
    artwork_id,
    image_url,
    alt_text,
    sort_order,
    is_main
)
SELECT
    a.id,
    'assets/images/artworks/leyendas-de-la-musica/Jim Morrison.jpg',
    'Jim Morrison — Vicente Ruiz',
    1,
    TRUE
FROM artwork a
WHERE a.slug = 'jim-morrison'
  AND NOT EXISTS (
    SELECT 1
    FROM artwork_image ai
    WHERE ai.artwork_id = a.id
      AND ai.image_url = 'assets/images/artworks/leyendas-de-la-musica/Jim Morrison.jpg'
);

INSERT INTO artwork_image (
    artwork_id,
    image_url,
    alt_text,
    sort_order,
    is_main
)
SELECT
    a.id,
    'assets/images/artworks/leyendas-de-la-musica/LadyGaga.jpg',
    'LadyGaga — Vicente Ruiz',
    1,
    TRUE
FROM artwork a
WHERE a.slug = 'ladygaga'
  AND NOT EXISTS (
    SELECT 1
    FROM artwork_image ai
    WHERE ai.artwork_id = a.id
      AND ai.image_url = 'assets/images/artworks/leyendas-de-la-musica/LadyGaga.jpg'
);

INSERT INTO artwork_image (
    artwork_id,
    image_url,
    alt_text,
    sort_order,
    is_main
)
SELECT
    a.id,
    'assets/images/artworks/leyendas-de-la-musica/Lennon II.jpg',
    'lennon II — Vicente Ruiz',
    1,
    TRUE
FROM artwork a
WHERE a.slug = 'lennon-ii'
  AND NOT EXISTS (
    SELECT 1
    FROM artwork_image ai
    WHERE ai.artwork_id = a.id
      AND ai.image_url = 'assets/images/artworks/leyendas-de-la-musica/Lennon II.jpg'
);

INSERT INTO artwork_image (
    artwork_id,
    image_url,
    alt_text,
    sort_order,
    is_main
)
SELECT
    a.id,
    'assets/images/artworks/leyendas-de-la-musica/Lennon.jpg',
    'Lennon — Vicente Ruiz',
    1,
    TRUE
FROM artwork a
WHERE a.slug = 'lennon'
  AND NOT EXISTS (
    SELECT 1
    FROM artwork_image ai
    WHERE ai.artwork_id = a.id
      AND ai.image_url = 'assets/images/artworks/leyendas-de-la-musica/Lennon.jpg'
);

INSERT INTO artwork_image (
    artwork_id,
    image_url,
    alt_text,
    sort_order,
    is_main
)
SELECT
    a.id,
    'assets/images/artworks/leyendas-de-la-musica/Maddona II.jpg',
    'Maddona II — Vicente Ruiz',
    1,
    TRUE
FROM artwork a
WHERE a.slug = 'maddona-ii'
  AND NOT EXISTS (
    SELECT 1
    FROM artwork_image ai
    WHERE ai.artwork_id = a.id
      AND ai.image_url = 'assets/images/artworks/leyendas-de-la-musica/Maddona II.jpg'
);

INSERT INTO artwork_image (
    artwork_id,
    image_url,
    alt_text,
    sort_order,
    is_main
)
SELECT
    a.id,
    'assets/images/artworks/leyendas-de-la-musica/Madonna.jpg',
    'Madonna — Vicente Ruiz',
    1,
    TRUE
FROM artwork a
WHERE a.slug = 'madonna'
  AND NOT EXISTS (
    SELECT 1
    FROM artwork_image ai
    WHERE ai.artwork_id = a.id
      AND ai.image_url = 'assets/images/artworks/leyendas-de-la-musica/Madonna.jpg'
);

INSERT INTO artwork_image (
    artwork_id,
    image_url,
    alt_text,
    sort_order,
    is_main
)
SELECT
    a.id,
    'assets/images/artworks/leyendas-de-la-musica/Malikian.jpg',
    'Malikian — Vicente Ruiz',
    1,
    TRUE
FROM artwork a
WHERE a.slug = 'malikian'
  AND NOT EXISTS (
    SELECT 1
    FROM artwork_image ai
    WHERE ai.artwork_id = a.id
      AND ai.image_url = 'assets/images/artworks/leyendas-de-la-musica/Malikian.jpg'
);

INSERT INTO artwork_image (
    artwork_id,
    image_url,
    alt_text,
    sort_order,
    is_main
)
SELECT
    a.id,
    'assets/images/artworks/leyendas-de-la-musica/Michael.jpg',
    'Michael — Vicente Ruiz',
    1,
    TRUE
FROM artwork a
WHERE a.slug = 'michael'
  AND NOT EXISTS (
    SELECT 1
    FROM artwork_image ai
    WHERE ai.artwork_id = a.id
      AND ai.image_url = 'assets/images/artworks/leyendas-de-la-musica/Michael.jpg'
);

INSERT INTO artwork_image (
    artwork_id,
    image_url,
    alt_text,
    sort_order,
    is_main
)
SELECT
    a.id,
    'assets/images/artworks/leyendas-de-la-musica/Prince.jpg',
    'Prince — Vicente Ruiz',
    1,
    TRUE
FROM artwork a
WHERE a.slug = 'prince'
  AND NOT EXISTS (
    SELECT 1
    FROM artwork_image ai
    WHERE ai.artwork_id = a.id
      AND ai.image_url = 'assets/images/artworks/leyendas-de-la-musica/Prince.jpg'
);

INSERT INTO artwork_image (
    artwork_id,
    image_url,
    alt_text,
    sort_order,
    is_main
)
SELECT
    a.id,
    'assets/images/artworks/leyendas-de-la-musica/Rosalia II.jpg',
    'Rosalia II — Vicente Ruiz',
    1,
    TRUE
FROM artwork a
WHERE a.slug = 'rosalia-ii'
  AND NOT EXISTS (
    SELECT 1
    FROM artwork_image ai
    WHERE ai.artwork_id = a.id
      AND ai.image_url = 'assets/images/artworks/leyendas-de-la-musica/Rosalia II.jpg'
);

INSERT INTO artwork_image (
    artwork_id,
    image_url,
    alt_text,
    sort_order,
    is_main
)
SELECT
    a.id,
    'assets/images/artworks/leyendas-de-la-musica/Rosalia.jpg',
    'Rosalia — Vicente Ruiz',
    1,
    TRUE
FROM artwork a
WHERE a.slug = 'rosalia'
  AND NOT EXISTS (
    SELECT 1
    FROM artwork_image ai
    WHERE ai.artwork_id = a.id
      AND ai.image_url = 'assets/images/artworks/leyendas-de-la-musica/Rosalia.jpg'
);

INSERT INTO artwork_image (
    artwork_id,
    image_url,
    alt_text,
    sort_order,
    is_main
)
SELECT
    a.id,
    'assets/images/artworks/otras-obras/Estudio para la cabeza de Apolo.jpg',
    'Estudio para la cabeza de Apolo — Vicente Ruiz',
    1,
    TRUE
FROM artwork a
WHERE a.slug = 'estudio-para-la-cabeza-de-apolo'
  AND NOT EXISTS (
    SELECT 1
    FROM artwork_image ai
    WHERE ai.artwork_id = a.id
      AND ai.image_url = 'assets/images/artworks/otras-obras/Estudio para la cabeza de Apolo.jpg'
);

INSERT INTO artwork_image (
    artwork_id,
    image_url,
    alt_text,
    sort_order,
    is_main
)
SELECT
    a.id,
    'assets/images/artworks/otras-obras/Fondo Marino.jpg',
    'Fondo marino — Vicente Ruiz',
    1,
    TRUE
FROM artwork a
WHERE a.slug = 'fondo-marino'
  AND NOT EXISTS (
    SELECT 1
    FROM artwork_image ai
    WHERE ai.artwork_id = a.id
      AND ai.image_url = 'assets/images/artworks/otras-obras/Fondo Marino.jpg'
);

INSERT INTO artwork_image (
    artwork_id,
    image_url,
    alt_text,
    sort_order,
    is_main
)
SELECT
    a.id,
    'assets/images/artworks/otras-obras/La bruja de Cadaqués.jpg',
    'La bruja de Cadaqués — Vicente Ruiz',
    1,
    TRUE
FROM artwork a
WHERE a.slug = 'la-bruja-de-cadaques'
  AND NOT EXISTS (
    SELECT 1
    FROM artwork_image ai
    WHERE ai.artwork_id = a.id
      AND ai.image_url = 'assets/images/artworks/otras-obras/La bruja de Cadaqués.jpg'
);

INSERT INTO artwork_image (
    artwork_id,
    image_url,
    alt_text,
    sort_order,
    is_main
)
SELECT
    a.id,
    'assets/images/artworks/otras-obras/Mi primer Rembrandt.jpg',
    'Mi primer Rembrandt — Vicente Ruiz',
    1,
    TRUE
FROM artwork a
WHERE a.slug = 'mi-primer-rembrandt'
  AND NOT EXISTS (
    SELECT 1
    FROM artwork_image ai
    WHERE ai.artwork_id = a.id
      AND ai.image_url = 'assets/images/artworks/otras-obras/Mi primer Rembrandt.jpg'
);

INSERT INTO artwork_image (
    artwork_id,
    image_url,
    alt_text,
    sort_order,
    is_main
)
SELECT
    a.id,
    'assets/images/artworks/otras-obras/Nadie me abraza.jpg',
    'Nadie me abraza — Vicente Ruiz',
    1,
    TRUE
FROM artwork a
WHERE a.slug = 'nadie-me-abraza'
  AND NOT EXISTS (
    SELECT 1
    FROM artwork_image ai
    WHERE ai.artwork_id = a.id
      AND ai.image_url = 'assets/images/artworks/otras-obras/Nadie me abraza.jpg'
);

INSERT INTO artwork_image (
    artwork_id,
    image_url,
    alt_text,
    sort_order,
    is_main
)
SELECT
    a.id,
    'assets/images/artworks/otras-obras/Rosa rosae.jpg',
    'Rosa rosae — Vicente Ruiz',
    1,
    TRUE
FROM artwork a
WHERE a.slug = 'rosa-rosae'
  AND NOT EXISTS (
    SELECT 1
    FROM artwork_image ai
    WHERE ai.artwork_id = a.id
      AND ai.image_url = 'assets/images/artworks/otras-obras/Rosa rosae.jpg'
);

INSERT INTO artwork_image (
    artwork_id,
    image_url,
    alt_text,
    sort_order,
    is_main
)
SELECT
    a.id,
    'assets/images/artworks/paisaje-urbano/Basílica del Pilar.jpg',
    'Basílica del Pilar — Vicente Ruiz',
    1,
    TRUE
FROM artwork a
WHERE a.slug = 'basilica-del-pilar'
  AND NOT EXISTS (
    SELECT 1
    FROM artwork_image ai
    WHERE ai.artwork_id = a.id
      AND ai.image_url = 'assets/images/artworks/paisaje-urbano/Basílica del Pilar.jpg'
);

INSERT INTO artwork_image (
    artwork_id,
    image_url,
    alt_text,
    sort_order,
    is_main
)
SELECT
    a.id,
    'assets/images/artworks/paisaje-urbano/Cara oculta de Piazza San Marco.jpg',
    'Cara oculta en Plaza San Marcos — Vicente Ruiz',
    1,
    TRUE
FROM artwork a
WHERE a.slug = 'cara-oculta-en-plaza-san-marcos'
  AND NOT EXISTS (
    SELECT 1
    FROM artwork_image ai
    WHERE ai.artwork_id = a.id
      AND ai.image_url = 'assets/images/artworks/paisaje-urbano/Cara oculta de Piazza San Marco.jpg'
);

INSERT INTO artwork_image (
    artwork_id,
    image_url,
    alt_text,
    sort_order,
    is_main
)
SELECT
    a.id,
    'assets/images/artworks/paisaje-urbano/Casa Perico.jpg',
    'Casa Perico — Vicente Ruiz',
    1,
    TRUE
FROM artwork a
WHERE a.slug = 'casa-perico'
  AND NOT EXISTS (
    SELECT 1
    FROM artwork_image ai
    WHERE ai.artwork_id = a.id
      AND ai.image_url = 'assets/images/artworks/paisaje-urbano/Casa Perico.jpg'
);

INSERT INTO artwork_image (
    artwork_id,
    image_url,
    alt_text,
    sort_order,
    is_main
)
SELECT
    a.id,
    'assets/images/artworks/paisaje-urbano/Doña Casta.jpg',
    'Doña Casta — Vicente Ruiz',
    1,
    TRUE
FROM artwork a
WHERE a.slug = 'dona-casta'
  AND NOT EXISTS (
    SELECT 1
    FROM artwork_image ai
    WHERE ai.artwork_id = a.id
      AND ai.image_url = 'assets/images/artworks/paisaje-urbano/Doña Casta.jpg'
);

INSERT INTO artwork_image (
    artwork_id,
    image_url,
    alt_text,
    sort_order,
    is_main
)
SELECT
    a.id,
    'assets/images/artworks/paisaje-urbano/Efímera modernidad.jpg',
    'Efímera modernidad — Vicente Ruiz',
    1,
    TRUE
FROM artwork a
WHERE a.slug = 'efimera-modernidad'
  AND NOT EXISTS (
    SELECT 1
    FROM artwork_image ai
    WHERE ai.artwork_id = a.id
      AND ai.image_url = 'assets/images/artworks/paisaje-urbano/Efímera modernidad.jpg'
);

INSERT INTO artwork_image (
    artwork_id,
    image_url,
    alt_text,
    sort_order,
    is_main
)
SELECT
    a.id,
    'assets/images/artworks/paisaje-urbano/Entrando al Tercer Milenio.jpg',
    'Entrando al Tercer Milenio — Vicente Ruiz',
    1,
    TRUE
FROM artwork a
WHERE a.slug = 'entrando-al-tercer-milenio'
  AND NOT EXISTS (
    SELECT 1
    FROM artwork_image ai
    WHERE ai.artwork_id = a.id
      AND ai.image_url = 'assets/images/artworks/paisaje-urbano/Entrando al Tercer Milenio.jpg'
);

INSERT INTO artwork_image (
    artwork_id,
    image_url,
    alt_text,
    sort_order,
    is_main
)
SELECT
    a.id,
    'assets/images/artworks/paisaje-urbano/Fábrica abandonada.jpg',
    'Fábrica abandonada — Vicente Ruiz',
    1,
    TRUE
FROM artwork a
WHERE a.slug = 'fabrica-abandonada'
  AND NOT EXISTS (
    SELECT 1
    FROM artwork_image ai
    WHERE ai.artwork_id = a.id
      AND ai.image_url = 'assets/images/artworks/paisaje-urbano/Fábrica abandonada.jpg'
);

INSERT INTO artwork_image (
    artwork_id,
    image_url,
    alt_text,
    sort_order,
    is_main
)
SELECT
    a.id,
    'assets/images/artworks/paisaje-urbano/Imagine.jpg',
    'Imagine — Vicente Ruiz',
    1,
    TRUE
FROM artwork a
WHERE a.slug = 'imagine'
  AND NOT EXISTS (
    SELECT 1
    FROM artwork_image ai
    WHERE ai.artwork_id = a.id
      AND ai.image_url = 'assets/images/artworks/paisaje-urbano/Imagine.jpg'
);

INSERT INTO artwork_image (
    artwork_id,
    image_url,
    alt_text,
    sort_order,
    is_main
)
SELECT
    a.id,
    'assets/images/artworks/paisaje-urbano/In Memoriam.jpg',
    'In memoriam — Vicente Ruiz',
    1,
    TRUE
FROM artwork a
WHERE a.slug = 'in-memoriam'
  AND NOT EXISTS (
    SELECT 1
    FROM artwork_image ai
    WHERE ai.artwork_id = a.id
      AND ai.image_url = 'assets/images/artworks/paisaje-urbano/In Memoriam.jpg'
);

INSERT INTO artwork_image (
    artwork_id,
    image_url,
    alt_text,
    sort_order,
    is_main
)
SELECT
    a.id,
    'assets/images/artworks/paisaje-urbano/Incomunicacion.jpg',
    'Incomunicacion — Vicente Ruiz',
    1,
    TRUE
FROM artwork a
WHERE a.slug = 'incomunicacion'
  AND NOT EXISTS (
    SELECT 1
    FROM artwork_image ai
    WHERE ai.artwork_id = a.id
      AND ai.image_url = 'assets/images/artworks/paisaje-urbano/Incomunicacion.jpg'
);

INSERT INTO artwork_image (
    artwork_id,
    image_url,
    alt_text,
    sort_order,
    is_main
)
SELECT
    a.id,
    'assets/images/artworks/paisaje-urbano/La naturaleza siempre vence.jpg',
    'La naturaleza siempre vence — Vicente Ruiz',
    1,
    TRUE
FROM artwork a
WHERE a.slug = 'la-naturaleza-siempre-vence'
  AND NOT EXISTS (
    SELECT 1
    FROM artwork_image ai
    WHERE ai.artwork_id = a.id
      AND ai.image_url = 'assets/images/artworks/paisaje-urbano/La naturaleza siempre vence.jpg'
);

INSERT INTO artwork_image (
    artwork_id,
    image_url,
    alt_text,
    sort_order,
    is_main
)
SELECT
    a.id,
    'assets/images/artworks/paisaje-urbano/Paseo por Tetuan.jpg',
    'Paseo por Tetuán — Vicente Ruiz',
    1,
    TRUE
FROM artwork a
WHERE a.slug = 'paseo-por-tetuan'
  AND NOT EXISTS (
    SELECT 1
    FROM artwork_image ai
    WHERE ai.artwork_id = a.id
      AND ai.image_url = 'assets/images/artworks/paisaje-urbano/Paseo por Tetuan.jpg'
);

INSERT INTO artwork_image (
    artwork_id,
    image_url,
    alt_text,
    sort_order,
    is_main
)
SELECT
    a.id,
    'assets/images/artworks/paisaje-urbano/Patinando por el Barrio Gótico.jpg',
    'Patinando por el Barrio Gótico — Vicente Ruiz',
    1,
    TRUE
FROM artwork a
WHERE a.slug = 'patinando-por-el-barrio-gotico'
  AND NOT EXISTS (
    SELECT 1
    FROM artwork_image ai
    WHERE ai.artwork_id = a.id
      AND ai.image_url = 'assets/images/artworks/paisaje-urbano/Patinando por el Barrio Gótico.jpg'
);

INSERT INTO artwork_image (
    artwork_id,
    image_url,
    alt_text,
    sort_order,
    is_main
)
SELECT
    a.id,
    'assets/images/artworks/paisaje-urbano/Purasal.jpg',
    'Purasal — Vicente Ruiz',
    1,
    TRUE
FROM artwork a
WHERE a.slug = 'purasal'
  AND NOT EXISTS (
    SELECT 1
    FROM artwork_image ai
    WHERE ai.artwork_id = a.id
      AND ai.image_url = 'assets/images/artworks/paisaje-urbano/Purasal.jpg'
);

INSERT INTO artwork_image (
    artwork_id,
    image_url,
    alt_text,
    sort_order,
    is_main
)
SELECT
    a.id,
    'assets/images/artworks/paisaje-urbano/Sanatorio de Agramonte.jpg',
    'Sanatorio de Agramonte — Vicente Ruiz',
    1,
    TRUE
FROM artwork a
WHERE a.slug = 'sanatorio-de-agramonte'
  AND NOT EXISTS (
    SELECT 1
    FROM artwork_image ai
    WHERE ai.artwork_id = a.id
      AND ai.image_url = 'assets/images/artworks/paisaje-urbano/Sanatorio de Agramonte.jpg'
);

INSERT INTO artwork_image (
    artwork_id,
    image_url,
    alt_text,
    sort_order,
    is_main
)
SELECT
    a.id,
    'assets/images/artworks/paisaje-urbano/Tauste en fiestas.jpg',
    'Tauste en fiestas — Vicente Ruiz',
    1,
    TRUE
FROM artwork a
WHERE a.slug = 'tauste-en-fiestas'
  AND NOT EXISTS (
    SELECT 1
    FROM artwork_image ai
    WHERE ai.artwork_id = a.id
      AND ai.image_url = 'assets/images/artworks/paisaje-urbano/Tauste en fiestas.jpg'
);

INSERT INTO artwork_image (
    artwork_id,
    image_url,
    alt_text,
    sort_order,
    is_main
)
SELECT
    a.id,
    'assets/images/artworks/paisaje-urbano/The Big Apple.jpg',
    'The Big Apple — Vicente Ruiz',
    1,
    TRUE
FROM artwork a
WHERE a.slug = 'the-big-apple'
  AND NOT EXISTS (
    SELECT 1
    FROM artwork_image ai
    WHERE ai.artwork_id = a.id
      AND ai.image_url = 'assets/images/artworks/paisaje-urbano/The Big Apple.jpg'
);

INSERT INTO artwork_image (
    artwork_id,
    image_url,
    alt_text,
    sort_order,
    is_main
)
SELECT
    a.id,
    'assets/images/artworks/paisaje-urbano/Vigilando el Abandono.jpg',
    'Vigilando el abandono — Vicente Ruiz',
    1,
    TRUE
FROM artwork a
WHERE a.slug = 'vigilando-el-abandono'
  AND NOT EXISTS (
    SELECT 1
    FROM artwork_image ai
    WHERE ai.artwork_id = a.id
      AND ai.image_url = 'assets/images/artworks/paisaje-urbano/Vigilando el Abandono.jpg'
);

INSERT INTO artwork_image (
    artwork_id,
    image_url,
    alt_text,
    sort_order,
    is_main
)
SELECT
    a.id,
    'assets/images/artworks/paisaje-urbano/Nuestra Señora de la Asunción.jpg',
    'Nuestra Señora de la Asunción — Vicente Ruiz',
    1,
    TRUE
FROM artwork a
WHERE a.slug = 'nuestra-senora-de-la-asuncion'
  AND NOT EXISTS (
    SELECT 1
    FROM artwork_image ai
    WHERE ai.artwork_id = a.id
      AND ai.image_url = 'assets/images/artworks/paisaje-urbano/Nuestra Señora de la Asunción.jpg'
);
INSERT INTO artwork_image (
    artwork_id,
    image_url,
    alt_text,
    sort_order,
    is_main
)
SELECT
    a.id,
    'assets/images/artworks/retratos/Adri.jpg',
    'Adri — Vicente Ruiz',
    1,
    TRUE
FROM artwork a
WHERE a.slug = 'adri'
  AND NOT EXISTS (
    SELECT 1
    FROM artwork_image ai
    WHERE ai.artwork_id = a.id
      AND ai.image_url = 'assets/images/artworks/retratos/Adri.jpg'
);

INSERT INTO artwork_image (
    artwork_id,
    image_url,
    alt_text,
    sort_order,
    is_main
)
SELECT
    a.id,
    'assets/images/artworks/retratos/Ana.jpg',
    'Ana — Vicente Ruiz',
    1,
    TRUE
FROM artwork a
WHERE a.slug = 'ana'
  AND NOT EXISTS (
    SELECT 1
    FROM artwork_image ai
    WHERE ai.artwork_id = a.id
      AND ai.image_url = 'assets/images/artworks/retratos/Ana.jpg'
);

INSERT INTO artwork_image (
    artwork_id,
    image_url,
    alt_text,
    sort_order,
    is_main
)
SELECT
    a.id,
    'assets/images/artworks/retratos/Aprendiz de payaso.jpg',
    'Aprendiz de payaso — Vicente Ruiz',
    1,
    TRUE
FROM artwork a
WHERE a.slug = 'aprendiz-de-payaso'
  AND NOT EXISTS (
    SELECT 1
    FROM artwork_image ai
    WHERE ai.artwork_id = a.id
      AND ai.image_url = 'assets/images/artworks/retratos/Aprendiz de payaso.jpg'
);

INSERT INTO artwork_image (
    artwork_id,
    image_url,
    alt_text,
    sort_order,
    is_main
)
SELECT
    a.id,
    'assets/images/artworks/retratos/Autorretrato.jpg',
    'Autorretrato — Vicente Ruiz',
    1,
    TRUE
FROM artwork a
WHERE a.slug = 'autorretrato'
  AND NOT EXISTS (
    SELECT 1
    FROM artwork_image ai
    WHERE ai.artwork_id = a.id
      AND ai.image_url = 'assets/images/artworks/retratos/Autorretrato.jpg'
);

INSERT INTO artwork_image (
    artwork_id,
    image_url,
    alt_text,
    sort_order,
    is_main
)
SELECT
    a.id,
    'assets/images/artworks/retratos/David II.jpg',
    'David II — Vicente Ruiz',
    1,
    TRUE
FROM artwork a
WHERE a.slug = 'david-ii'
  AND NOT EXISTS (
    SELECT 1
    FROM artwork_image ai
    WHERE ai.artwork_id = a.id
      AND ai.image_url = 'assets/images/artworks/retratos/David II.jpg'
);

INSERT INTO artwork_image (
    artwork_id,
    image_url,
    alt_text,
    sort_order,
    is_main
)
SELECT
    a.id,
    'assets/images/artworks/retratos/David.jpg',
    'David — Vicente Ruiz',
    1,
    TRUE
FROM artwork a
WHERE a.slug = 'david'
  AND NOT EXISTS (
    SELECT 1
    FROM artwork_image ai
    WHERE ai.artwork_id = a.id
      AND ai.image_url = 'assets/images/artworks/retratos/David.jpg'
);

INSERT INTO artwork_image (
    artwork_id,
    image_url,
    alt_text,
    sort_order,
    is_main
)
SELECT
    a.id,
    'assets/images/artworks/retratos/Desde el cuarto creciente.jpg',
    'Desde el cuarto creciente — Vicente Ruiz',
    1,
    TRUE
FROM artwork a
WHERE a.slug = 'desde-el-cuarto-creciente'
  AND NOT EXISTS (
    SELECT 1
    FROM artwork_image ai
    WHERE ai.artwork_id = a.id
      AND ai.image_url = 'assets/images/artworks/retratos/Desde el cuarto creciente.jpg'
);

INSERT INTO artwork_image (
    artwork_id,
    image_url,
    alt_text,
    sort_order,
    is_main
)
SELECT
    a.id,
    'assets/images/artworks/retratos/Happy.JPG',
    'Happy — Vicente Ruiz',
    1,
    TRUE
FROM artwork a
WHERE a.slug = 'happy'
  AND NOT EXISTS (
    SELECT 1
    FROM artwork_image ai
    WHERE ai.artwork_id = a.id
      AND ai.image_url = 'assets/images/artworks/retratos/Happy.JPG'
);

INSERT INTO artwork_image (
    artwork_id,
    image_url,
    alt_text,
    sort_order,
    is_main
)
SELECT
    a.id,
    'assets/images/artworks/retratos/Homenaje a Goyo Dominguez.jpg',
    'Homenaje a Goyo Dominguez — Vicente Ruiz',
    1,
    TRUE
FROM artwork a
WHERE a.slug = 'homenaje-a-goyo-dominguez'
  AND NOT EXISTS (
    SELECT 1
    FROM artwork_image ai
    WHERE ai.artwork_id = a.id
      AND ai.image_url = 'assets/images/artworks/retratos/Homenaje a Goyo Dominguez.jpg'
);

INSERT INTO artwork_image (
    artwork_id,
    image_url,
    alt_text,
    sort_order,
    is_main
)
SELECT
    a.id,
    'assets/images/artworks/retratos/Homenaje a Luis Royo I.jpg',
    'Homenaje a Luis Royo I — Vicente Ruiz',
    1,
    TRUE
FROM artwork a
WHERE a.slug = 'homenaje-a-luis-royo-i'
  AND NOT EXISTS (
    SELECT 1
    FROM artwork_image ai
    WHERE ai.artwork_id = a.id
      AND ai.image_url = 'assets/images/artworks/retratos/Homenaje a Luis Royo I.jpg'
);

INSERT INTO artwork_image (
    artwork_id,
    image_url,
    alt_text,
    sort_order,
    is_main
)
SELECT
    a.id,
    'assets/images/artworks/retratos/Homenaje a Luis Royo II.jpg',
    'Homenaje a Luis Royo II — Vicente Ruiz',
    1,
    TRUE
FROM artwork a
WHERE a.slug = 'homenaje-a-luis-royo-ii'
  AND NOT EXISTS (
    SELECT 1
    FROM artwork_image ai
    WHERE ai.artwork_id = a.id
      AND ai.image_url = 'assets/images/artworks/retratos/Homenaje a Luis Royo II.jpg'
);

INSERT INTO artwork_image (
    artwork_id,
    image_url,
    alt_text,
    sort_order,
    is_main
)
SELECT
    a.id,
    'assets/images/artworks/retratos/Homenaje a Luis Royo III.jpg',
    'Homenaje a Luis Royo III — Vicente Ruiz',
    1,
    TRUE
FROM artwork a
WHERE a.slug = 'homenaje-a-luis-royo-iii'
  AND NOT EXISTS (
    SELECT 1
    FROM artwork_image ai
    WHERE ai.artwork_id = a.id
      AND ai.image_url = 'assets/images/artworks/retratos/Homenaje a Luis Royo III.jpg'
);

INSERT INTO artwork_image (
    artwork_id,
    image_url,
    alt_text,
    sort_order,
    is_main
)
SELECT
    a.id,
    'assets/images/artworks/retratos/Ione.jpg',
    'Ione — Vicente Ruiz',
    1,
    TRUE
FROM artwork a
WHERE a.slug = 'ione'
  AND NOT EXISTS (
    SELECT 1
    FROM artwork_image ai
    WHERE ai.artwork_id = a.id
      AND ai.image_url = 'assets/images/artworks/retratos/Ione.jpg'
);

INSERT INTO artwork_image (
    artwork_id,
    image_url,
    alt_text,
    sort_order,
    is_main
)
SELECT
    a.id,
    'assets/images/artworks/retratos/Isabelle II.JPG',
    'Isabelle II — Vicente Ruiz',
    1,
    TRUE
FROM artwork a
WHERE a.slug = 'isabelle-ii'
  AND NOT EXISTS (
    SELECT 1
    FROM artwork_image ai
    WHERE ai.artwork_id = a.id
      AND ai.image_url = 'assets/images/artworks/retratos/Isabelle II.JPG'
);

INSERT INTO artwork_image (
    artwork_id,
    image_url,
    alt_text,
    sort_order,
    is_main
)
SELECT
    a.id,
    'assets/images/artworks/retratos/Isabelle.jpg',
    'Isabelle — Vicente Ruiz',
    1,
    TRUE
FROM artwork a
WHERE a.slug = 'isabelle-2022'
  AND NOT EXISTS (
    SELECT 1
    FROM artwork_image ai
    WHERE ai.artwork_id = a.id
      AND ai.image_url = 'assets/images/artworks/retratos/Isabelle.jpg'
);

INSERT INTO artwork_image (
    artwork_id,
    image_url,
    alt_text,
    sort_order,
    is_main
)
SELECT
    a.id,
    'assets/images/artworks/retratos/Iñaki, il giovane vigile di Ponte Vecchio.jpg',
    'Iñaki, il giovane vigile di Ponte Vecchio — Vicente Ruiz',
    1,
    TRUE
FROM artwork a
WHERE a.slug = 'inaki-il-giovane-vigile-di-ponte-vecchio'
  AND NOT EXISTS (
    SELECT 1
    FROM artwork_image ai
    WHERE ai.artwork_id = a.id
      AND ai.image_url = 'assets/images/artworks/retratos/Iñaki, il giovane vigile di Ponte Vecchio.jpg'
);

INSERT INTO artwork_image (
    artwork_id,
    image_url,
    alt_text,
    sort_order,
    is_main
)
SELECT
    a.id,
    'assets/images/artworks/retratos/Joven Melomano.jpg',
    'Joven melómano — Vicente Ruiz',
    1,
    TRUE
FROM artwork a
WHERE a.slug = 'joven-melomano'
  AND NOT EXISTS (
    SELECT 1
    FROM artwork_image ai
    WHERE ai.artwork_id = a.id
      AND ai.image_url = 'assets/images/artworks/retratos/Joven Melomano.jpg'
);

INSERT INTO artwork_image (
    artwork_id,
    image_url,
    alt_text,
    sort_order,
    is_main
)
SELECT
    a.id,
    'assets/images/artworks/retratos/Juan Pareja.jpg',
    'Juan Pareja — Vicente Ruiz',
    1,
    TRUE
FROM artwork a
WHERE a.slug = 'juan-pareja'
  AND NOT EXISTS (
    SELECT 1
    FROM artwork_image ai
    WHERE ai.artwork_id = a.id
      AND ai.image_url = 'assets/images/artworks/retratos/Juan Pareja.jpg'
);

INSERT INTO artwork_image (
    artwork_id,
    image_url,
    alt_text,
    sort_order,
    is_main
)
SELECT
    a.id,
    'assets/images/artworks/retratos/Sad Man.JPG',
    'Sad Man — Vicente Ruiz',
    1,
    TRUE
FROM artwork a
WHERE a.slug = 'sad-man'
  AND NOT EXISTS (
    SELECT 1
    FROM artwork_image ai
    WHERE ai.artwork_id = a.id
      AND ai.image_url = 'assets/images/artworks/retratos/Sad Man.JPG'
);

INSERT INTO artwork_image (
    artwork_id,
    image_url,
    alt_text,
    sort_order,
    is_main
)
SELECT
    a.id,
    'assets/images/artworks/retratos/Serenidad.jpg',
    'Serenidad — Vicente Ruiz',
    1,
    TRUE
FROM artwork a
WHERE a.slug = 'serenidad'
  AND NOT EXISTS (
    SELECT 1
    FROM artwork_image ai
    WHERE ai.artwork_id = a.id
      AND ai.image_url = 'assets/images/artworks/retratos/Serenidad.jpg'
);

INSERT INTO artwork_image (
    artwork_id,
    image_url,
    alt_text,
    sort_order,
    is_main
)
SELECT
    a.id,
    'assets/images/artworks/retratos/Tengo sed.jpg',
    'Tengo sed — Vicente Ruiz',
    1,
    TRUE
FROM artwork a
WHERE a.slug = 'tengo-sed'
  AND NOT EXISTS (
    SELECT 1
    FROM artwork_image ai
    WHERE ai.artwork_id = a.id
      AND ai.image_url = 'assets/images/artworks/retratos/Tengo sed.jpg'
);

INSERT INTO artwork_image (
    artwork_id,
    image_url,
    alt_text,
    sort_order,
    is_main
)
SELECT
    a.id,
    'assets/images/artworks/retratos/Testigo mudo.jpg',
    'Testigo mudo — Vicente Ruiz',
    1,
    TRUE
FROM artwork a
WHERE a.slug = 'testigo-mudo'
  AND NOT EXISTS (
    SELECT 1
    FROM artwork_image ai
    WHERE ai.artwork_id = a.id
      AND ai.image_url = 'assets/images/artworks/retratos/Testigo mudo.jpg'
);

INSERT INTO artwork_image (
    artwork_id,
    image_url,
    alt_text,
    sort_order,
    is_main
)
SELECT
    a.id,
    'assets/images/artworks/retratos/Tuareg.jpg',
    'Tuareg — Vicente Ruiz',
    1,
    TRUE
FROM artwork a
WHERE a.slug = 'tuareg'
  AND NOT EXISTS (
    SELECT 1
    FROM artwork_image ai
    WHERE ai.artwork_id = a.id
      AND ai.image_url = 'assets/images/artworks/retratos/Tuareg.jpg'
);

INSERT INTO artwork_image (
    artwork_id,
    image_url,
    alt_text,
    sort_order,
    is_main
)
SELECT
    a.id,
    'assets/images/artworks/retratos/Yaya Vito.jpg',
    'Yaya Vito — Vicente Ruiz',
    1,
    TRUE
FROM artwork a
WHERE a.slug = 'yaya-vito'
  AND NOT EXISTS (
    SELECT 1
    FROM artwork_image ai
    WHERE ai.artwork_id = a.id
      AND ai.image_url = 'assets/images/artworks/retratos/Yaya Vito.jpg'
);

INSERT INTO artwork_image (
    artwork_id,
    image_url,
    alt_text,
    sort_order,
    is_main
)
SELECT
    a.id,
    'assets/images/artworks/un-cuadro-una-historia/Bodas de Sangre.jpg',
    'Bodas de Sangre — Vicente Ruiz',
    1,
    TRUE
FROM artwork a
WHERE a.slug = 'bodas-de-sangre'
  AND NOT EXISTS (
    SELECT 1
    FROM artwork_image ai
    WHERE ai.artwork_id = a.id
      AND ai.image_url = 'assets/images/artworks/un-cuadro-una-historia/Bodas de Sangre.jpg'
);

INSERT INTO artwork_image (
    artwork_id,
    image_url,
    alt_text,
    sort_order,
    is_main
)
SELECT
    a.id,
    'assets/images/artworks/un-cuadro-una-historia/Cambios por el cambio.jpg',
    'Cambios por el cambio — Vicente Ruiz',
    1,
    TRUE
FROM artwork a
WHERE a.slug = 'cambios-por-el-cambio'
  AND NOT EXISTS (
    SELECT 1
    FROM artwork_image ai
    WHERE ai.artwork_id = a.id
      AND ai.image_url = 'assets/images/artworks/un-cuadro-una-historia/Cambios por el cambio.jpg'
);

INSERT INTO artwork_image (
    artwork_id,
    image_url,
    alt_text,
    sort_order,
    is_main
)
SELECT
    a.id,
    'assets/images/artworks/un-cuadro-una-historia/Ciclon.jpg',
    'Ciclon — Vicente Ruiz',
    1,
    TRUE
FROM artwork a
WHERE a.slug = 'ciclon'
  AND NOT EXISTS (
    SELECT 1
    FROM artwork_image ai
    WHERE ai.artwork_id = a.id
      AND ai.image_url = 'assets/images/artworks/un-cuadro-una-historia/Ciclon.jpg'
);

INSERT INTO artwork_image (
    artwork_id,
    image_url,
    alt_text,
    sort_order,
    is_main
)
SELECT
    a.id,
    'assets/images/artworks/un-cuadro-una-historia/Daño colateral.jpg',
    'Daño colateral — Vicente Ruiz',
    1,
    TRUE
FROM artwork a
WHERE a.slug = 'dano-colateral'
  AND NOT EXISTS (
    SELECT 1
    FROM artwork_image ai
    WHERE ai.artwork_id = a.id
      AND ai.image_url = 'assets/images/artworks/un-cuadro-una-historia/Daño colateral.jpg'
);

INSERT INTO artwork_image (
    artwork_id,
    image_url,
    alt_text,
    sort_order,
    is_main
)
SELECT
    a.id,
    'assets/images/artworks/un-cuadro-una-historia/Destino La Costa.jpg',
    'Destino La Costa — Vicente Ruiz',
    1,
    TRUE
FROM artwork a
WHERE a.slug = 'destino-la-costa'
  AND NOT EXISTS (
    SELECT 1
    FROM artwork_image ai
    WHERE ai.artwork_id = a.id
      AND ai.image_url = 'assets/images/artworks/un-cuadro-una-historia/Destino La Costa.jpg'
);

INSERT INTO artwork_image (
    artwork_id,
    image_url,
    alt_text,
    sort_order,
    is_main
)
SELECT
    a.id,
    'assets/images/artworks/un-cuadro-una-historia/Duelo.jpg',
    'Duelo — Vicente Ruiz',
    1,
    TRUE
FROM artwork a
WHERE a.slug = 'duelo'
  AND NOT EXISTS (
    SELECT 1
    FROM artwork_image ai
    WHERE ai.artwork_id = a.id
      AND ai.image_url = 'assets/images/artworks/un-cuadro-una-historia/Duelo.jpg'
);

INSERT INTO artwork_image (
    artwork_id,
    image_url,
    alt_text,
    sort_order,
    is_main
)
SELECT
    a.id,
    'assets/images/artworks/un-cuadro-una-historia/El drama de las vacunas.jpg',
    'El drama de las vacunas — Vicente Ruiz',
    1,
    TRUE
FROM artwork a
WHERE a.slug = 'el-drama-de-las-vacunas'
  AND NOT EXISTS (
    SELECT 1
    FROM artwork_image ai
    WHERE ai.artwork_id = a.id
      AND ai.image_url = 'assets/images/artworks/un-cuadro-una-historia/El drama de las vacunas.jpg'
);

INSERT INTO artwork_image (
    artwork_id,
    image_url,
    alt_text,
    sort_order,
    is_main
)
SELECT
    a.id,
    'assets/images/artworks/un-cuadro-una-historia/Escapando a Lesbos.jpg',
    'Escapando a Lesbos — Vicente Ruiz',
    1,
    TRUE
FROM artwork a
WHERE a.slug = 'escapando-a-lesbos'
  AND NOT EXISTS (
    SELECT 1
    FROM artwork_image ai
    WHERE ai.artwork_id = a.id
      AND ai.image_url = 'assets/images/artworks/un-cuadro-una-historia/Escapando a Lesbos.jpg'
);

INSERT INTO artwork_image (
    artwork_id,
    image_url,
    alt_text,
    sort_order,
    is_main
)
SELECT
    a.id,
    'assets/images/artworks/un-cuadro-una-historia/Escuelas para escapar.jpg',
    'Escuelas para escapar — Vicente Ruiz',
    1,
    TRUE
FROM artwork a
WHERE a.slug = 'escuelas-para-escapar'
  AND NOT EXISTS (
    SELECT 1
    FROM artwork_image ai
    WHERE ai.artwork_id = a.id
      AND ai.image_url = 'assets/images/artworks/un-cuadro-una-historia/Escuelas para escapar.jpg'
);

INSERT INTO artwork_image (
    artwork_id,
    image_url,
    alt_text,
    sort_order,
    is_main
)
SELECT
    a.id,
    'assets/images/artworks/un-cuadro-una-historia/Guerra y escuela.jpg',
    'Guerra y escuela — Vicente Ruiz',
    1,
    TRUE
FROM artwork a
WHERE a.slug = 'guerra-y-escuela'
  AND NOT EXISTS (
    SELECT 1
    FROM artwork_image ai
    WHERE ai.artwork_id = a.id
      AND ai.image_url = 'assets/images/artworks/un-cuadro-una-historia/Guerra y escuela.jpg'
);

INSERT INTO artwork_image (
    artwork_id,
    image_url,
    alt_text,
    sort_order,
    is_main
)
SELECT
    a.id,
    'assets/images/artworks/un-cuadro-una-historia/Guerreras del agua.jpg',
    'Guerreras del agua — Vicente Ruiz',
    1,
    TRUE
FROM artwork a
WHERE a.slug = 'guerreras-del-agua'
  AND NOT EXISTS (
    SELECT 1
    FROM artwork_image ai
    WHERE ai.artwork_id = a.id
      AND ai.image_url = 'assets/images/artworks/un-cuadro-una-historia/Guerreras del agua.jpg'
);

INSERT INTO artwork_image (
    artwork_id,
    image_url,
    alt_text,
    sort_order,
    is_main
)
SELECT
    a.id,
    'assets/images/artworks/un-cuadro-una-historia/Lo consegui.jpg',
    'Lo consegui — Vicente Ruiz',
    1,
    TRUE
FROM artwork a
WHERE a.slug = 'lo-consegui'
  AND NOT EXISTS (
    SELECT 1
    FROM artwork_image ai
    WHERE ai.artwork_id = a.id
      AND ai.image_url = 'assets/images/artworks/un-cuadro-una-historia/Lo consegui.jpg'
);

INSERT INTO artwork_image (
    artwork_id,
    image_url,
    alt_text,
    sort_order,
    is_main
)
SELECT
    a.id,
    'assets/images/artworks/un-cuadro-una-historia/Minas.jpg',
    'Minas — Vicente Ruiz',
    1,
    TRUE
FROM artwork a
WHERE a.slug = 'minas'
  AND NOT EXISTS (
    SELECT 1
    FROM artwork_image ai
    WHERE ai.artwork_id = a.id
      AND ai.image_url = 'assets/images/artworks/un-cuadro-una-historia/Minas.jpg'
);

INSERT INTO artwork_image (
    artwork_id,
    image_url,
    alt_text,
    sort_order,
    is_main
)
SELECT
    a.id,
    'assets/images/artworks/un-cuadro-una-historia/Niños mineros.jpg',
    'Niños mineros — Vicente Ruiz',
    1,
    TRUE
FROM artwork a
WHERE a.slug = 'ninos-mineros'
  AND NOT EXISTS (
    SELECT 1
    FROM artwork_image ai
    WHERE ai.artwork_id = a.id
      AND ai.image_url = 'assets/images/artworks/un-cuadro-una-historia/Niños mineros.jpg'
);

INSERT INTO artwork_image (
    artwork_id,
    image_url,
    alt_text,
    sort_order,
    is_main
)
SELECT
    a.id,
    'assets/images/artworks/un-cuadro-una-historia/Niños soldados.jpg',
    'Niños soldados — Vicente Ruiz',
    1,
    TRUE
FROM artwork a
WHERE a.slug = 'ninos-soldados'
  AND NOT EXISTS (
    SELECT 1
    FROM artwork_image ai
    WHERE ai.artwork_id = a.id
      AND ai.image_url = 'assets/images/artworks/un-cuadro-una-historia/Niños soldados.jpg'
);

INSERT INTO artwork_image (
    artwork_id,
    image_url,
    alt_text,
    sort_order,
    is_main
)
SELECT
    a.id,
    'assets/images/artworks/un-cuadro-una-historia/Penurias en Yida.jpg',
    'Penurias en Yida — Vicente Ruiz',
    1,
    TRUE
FROM artwork a
WHERE a.slug = 'penurias-en-yida'
  AND NOT EXISTS (
    SELECT 1
    FROM artwork_image ai
    WHERE ai.artwork_id = a.id
      AND ai.image_url = 'assets/images/artworks/un-cuadro-una-historia/Penurias en Yida.jpg'
);

INSERT INTO artwork_image (
    artwork_id,
    image_url,
    alt_text,
    sort_order,
    is_main
)
SELECT
    a.id,
    'assets/images/artworks/un-cuadro-una-historia/Resiliencia.jpg',
    'Resiliencia — Vicente Ruiz',
    1,
    TRUE
FROM artwork a
WHERE a.slug = 'resiliencia'
  AND NOT EXISTS (
    SELECT 1
    FROM artwork_image ai
    WHERE ai.artwork_id = a.id
      AND ai.image_url = 'assets/images/artworks/un-cuadro-una-historia/Resiliencia.jpg'
);

INSERT INTO artwork_image (
    artwork_id,
    image_url,
    alt_text,
    sort_order,
    is_main
)
SELECT
    a.id,
    'assets/images/artworks/un-cuadro-una-historia/Rostros robados.jpg',
    'Rostros robados — Vicente Ruiz',
    1,
    TRUE
FROM artwork a
WHERE a.slug = 'rostros-robados'
  AND NOT EXISTS (
    SELECT 1
    FROM artwork_image ai
    WHERE ai.artwork_id = a.id
      AND ai.image_url = 'assets/images/artworks/un-cuadro-una-historia/Rostros robados.jpg'
);

INSERT INTO artwork_image (
    artwork_id,
    image_url,
    alt_text,
    sort_order,
    is_main
)
SELECT
    a.id,
    'assets/images/artworks/un-cuadro-una-historia/Tengo hambre.jpg',
    'Tengo hambre — Vicente Ruiz',
    1,
    TRUE
FROM artwork a
WHERE a.slug = 'tengo-hambre'
  AND NOT EXISTS (
    SELECT 1
    FROM artwork_image ai
    WHERE ai.artwork_id = a.id
      AND ai.image_url = 'assets/images/artworks/un-cuadro-una-historia/Tengo hambre.jpg'
);

INSERT INTO artwork_image (
    artwork_id,
    image_url,
    alt_text,
    sort_order,
    is_main
)
SELECT
    a.id,
    'assets/images/artworks/un-cuadro-una-historia/Todos somos Mahsa.jpg',
    'Todos somos Mahsa — Vicente Ruiz',
    1,
    TRUE
FROM artwork a
WHERE a.slug = 'todos-somos-mahsa'
  AND NOT EXISTS (
    SELECT 1
    FROM artwork_image ai
    WHERE ai.artwork_id = a.id
      AND ai.image_url = 'assets/images/artworks/un-cuadro-una-historia/Todos somos Mahsa.jpg'
);

INSERT INTO artwork_image (
    artwork_id,
    image_url,
    alt_text,
    sort_order,
    is_main
)
SELECT
    a.id,
    'assets/images/artworks/un-cuadro-una-historia/Yo también quiero.jpg',
    'Yo también quiero — Vicente Ruiz',
    1,
    TRUE
FROM artwork a
WHERE a.slug = 'yo-tambien-quiero'
  AND NOT EXISTS (
    SELECT 1
    FROM artwork_image ai
    WHERE ai.artwork_id = a.id
      AND ai.image_url = 'assets/images/artworks/un-cuadro-una-historia/Yo también quiero.jpg'
);

INSERT INTO artwork_image (
    artwork_id,
    image_url,
    alt_text,
    sort_order,
    is_main
)
SELECT
    a.id,
    'assets/images/artworks/ventanas-del-alma/Bea.jpg',
    'Bea — Vicente Ruiz',
    1,
    TRUE
FROM artwork a
WHERE a.slug = 'bea'
  AND NOT EXISTS (
    SELECT 1
    FROM artwork_image ai
    WHERE ai.artwork_id = a.id
      AND ai.image_url = 'assets/images/artworks/ventanas-del-alma/Bea.jpg'
);

INSERT INTO artwork_image (
    artwork_id,
    image_url,
    alt_text,
    sort_order,
    is_main
)
SELECT
    a.id,
    'assets/images/artworks/ventanas-del-alma/Boxer.jpg',
    'Boxer — Vicente Ruiz',
    1,
    TRUE
FROM artwork a
WHERE a.slug = 'boxer'
  AND NOT EXISTS (
    SELECT 1
    FROM artwork_image ai
    WHERE ai.artwork_id = a.id
      AND ai.image_url = 'assets/images/artworks/ventanas-del-alma/Boxer.jpg'
);

INSERT INTO artwork_image (
    artwork_id,
    image_url,
    alt_text,
    sort_order,
    is_main
)
SELECT
    a.id,
    'assets/images/artworks/ventanas-del-alma/Gin I.jpg',
    'Gin I — Vicente Ruiz',
    1,
    TRUE
FROM artwork a
WHERE a.slug = 'gin-i'
  AND NOT EXISTS (
    SELECT 1
    FROM artwork_image ai
    WHERE ai.artwork_id = a.id
      AND ai.image_url = 'assets/images/artworks/ventanas-del-alma/Gin I.jpg'
);

INSERT INTO artwork_image (
    artwork_id,
    image_url,
    alt_text,
    sort_order,
    is_main
)
SELECT
    a.id,
    'assets/images/artworks/ventanas-del-alma/Gin II.jpg',
    'Gin II — Vicente Ruiz',
    1,
    TRUE
FROM artwork a
WHERE a.slug = 'gin-ii'
  AND NOT EXISTS (
    SELECT 1
    FROM artwork_image ai
    WHERE ai.artwork_id = a.id
      AND ai.image_url = 'assets/images/artworks/ventanas-del-alma/Gin II.jpg'
);

INSERT INTO artwork_image (
    artwork_id,
    image_url,
    alt_text,
    sort_order,
    is_main
)
SELECT
    a.id,
    'assets/images/artworks/ventanas-del-alma/Hands.jpg',
    'Hands — Vicente Ruiz',
    1,
    TRUE
FROM artwork a
WHERE a.slug = 'hands'
  AND NOT EXISTS (
    SELECT 1
    FROM artwork_image ai
    WHERE ai.artwork_id = a.id
      AND ai.image_url = 'assets/images/artworks/ventanas-del-alma/Hands.jpg'
);

INSERT INTO artwork_image (
    artwork_id,
    image_url,
    alt_text,
    sort_order,
    is_main
)
SELECT
    a.id,
    'assets/images/artworks/ventanas-del-alma/Isabelle.jpg',
    'Isabelle — Vicente Ruiz',
    1,
    TRUE
FROM artwork a
WHERE a.slug = 'isabelle-2019'
  AND NOT EXISTS (
    SELECT 1
    FROM artwork_image ai
    WHERE ai.artwork_id = a.id
      AND ai.image_url = 'assets/images/artworks/ventanas-del-alma/Isabelle.jpg'
);

INSERT INTO artwork_image (
    artwork_id,
    image_url,
    alt_text,
    sort_order,
    is_main
)
SELECT
    a.id,
    'assets/images/artworks/ventanas-del-alma/LionQueen.jpg',
    'Lion Queen — Vicente Ruiz',
    1,
    TRUE
FROM artwork a
WHERE a.slug = 'lion-queen'
  AND NOT EXISTS (
    SELECT 1
    FROM artwork_image ai
    WHERE ai.artwork_id = a.id
      AND ai.image_url = 'assets/images/artworks/ventanas-del-alma/LionQueen.jpg'
);

INSERT INTO artwork_image (
    artwork_id,
    image_url,
    alt_text,
    sort_order,
    is_main
)
SELECT
    a.id,
    'assets/images/artworks/ventanas-del-alma/Miami.jpg',
    'Miami — Vicente Ruiz',
    1,
    TRUE
FROM artwork a
WHERE a.slug = 'miami'
  AND NOT EXISTS (
    SELECT 1
    FROM artwork_image ai
    WHERE ai.artwork_id = a.id
      AND ai.image_url = 'assets/images/artworks/ventanas-del-alma/Miami.jpg'
);

INSERT INTO artwork_image (
    artwork_id,
    image_url,
    alt_text,
    sort_order,
    is_main
)
SELECT
    a.id,
    'assets/images/artworks/ventanas-del-alma/Portobello.jpg',
    'Portobello — Vicente Ruiz',
    1,
    TRUE
FROM artwork a
WHERE a.slug = 'portobello'
  AND NOT EXISTS (
    SELECT 1
    FROM artwork_image ai
    WHERE ai.artwork_id = a.id
      AND ai.image_url = 'assets/images/artworks/ventanas-del-alma/Portobello.jpg'
);

INSERT INTO artwork_image (
    artwork_id,
    image_url,
    alt_text,
    sort_order,
    is_main
)
SELECT
    a.id,
    'assets/images/artworks/ventanas-del-alma/Seattle.jpg',
    'Seattle — Vicente Ruiz',
    1,
    TRUE
FROM artwork a
WHERE a.slug = 'seattle'
  AND NOT EXISTS (
    SELECT 1
    FROM artwork_image ai
    WHERE ai.artwork_id = a.id
      AND ai.image_url = 'assets/images/artworks/ventanas-del-alma/Seattle.jpg'
);

INSERT INTO artwork_image (
    artwork_id,
    image_url,
    alt_text,
    sort_order,
    is_main
)
SELECT
    a.id,
    'assets/images/artworks/ventanas-del-alma/Smoker.jpg',
    'Smoker — Vicente Ruiz',
    1,
    TRUE
FROM artwork a
WHERE a.slug = 'smoker'
  AND NOT EXISTS (
    SELECT 1
    FROM artwork_image ai
    WHERE ai.artwork_id = a.id
      AND ai.image_url = 'assets/images/artworks/ventanas-del-alma/Smoker.jpg'
);

INSERT INTO artwork_image (
    artwork_id,
    image_url,
    alt_text,
    sort_order,
    is_main
)
SELECT
    a.id,
    'assets/images/artworks/ventanas-del-alma/Susan.jpg',
    'Susan — Vicente Ruiz',
    1,
    TRUE
FROM artwork a
WHERE a.slug = 'susan'
  AND NOT EXISTS (
    SELECT 1
    FROM artwork_image ai
    WHERE ai.artwork_id = a.id
      AND ai.image_url = 'assets/images/artworks/ventanas-del-alma/Susan.jpg'
);

INSERT INTO artwork_image (
    artwork_id,
    image_url,
    alt_text,
    sort_order,
    is_main
)
SELECT
    a.id,
    'assets/images/artworks/ventanas-del-alma/The Cat Lady.jpg',
    'The cat lady — Vicente Ruiz',
    1,
    TRUE
FROM artwork a
WHERE a.slug = 'the-cat-lady'
  AND NOT EXISTS (
    SELECT 1
    FROM artwork_image ai
    WHERE ai.artwork_id = a.id
      AND ai.image_url = 'assets/images/artworks/ventanas-del-alma/The Cat Lady.jpg'
);

INSERT INTO artwork_image (
    artwork_id,
    image_url,
    alt_text,
    sort_order,
    is_main
)
SELECT
    a.id,
    'assets/images/artworks/ventanas-del-alma/Tomas.jpg',
    'Tomas — Vicente Ruiz',
    1,
    TRUE
FROM artwork a
WHERE a.slug = 'tomas'
  AND NOT EXISTS (
    SELECT 1
    FROM artwork_image ai
    WHERE ai.artwork_id = a.id
      AND ai.image_url = 'assets/images/artworks/ventanas-del-alma/Tomas.jpg'
);

INSERT INTO artwork_image (
    artwork_id,
    image_url,
    alt_text,
    sort_order,
    is_main
)
SELECT
    a.id,
    'assets/images/artworks/retratos/Salvador Dali.jpg',
    'Salvador Dali — Vicente Ruiz',
    1,
    TRUE
FROM artwork a
WHERE a.slug = 'salvador-dali'
  AND NOT EXISTS (
    SELECT 1
    FROM artwork_image ai
    WHERE ai.artwork_id = a.id
      AND ai.image_url = 'assets/images/artworks/retratos/Salvador Dali.jpg'
);
