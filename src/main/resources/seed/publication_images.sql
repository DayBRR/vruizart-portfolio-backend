DELETE FROM publication_image
WHERE publication_id IN (
    SELECT id FROM publication WHERE slug IN (
        'artist-portfolio-magazine',
        'guia-internacional-leonardo-2026',
        'guia-internacional-leonardo-2025',
        'guia-internacional-leonardo-2024',
        'articulo-sobre-inquietudes',
        'vi-salon-de-primavera-de-pintura-realista',
        'xxxiii-premio-santa-isabel-de-aragon-reina-de-portugal',
        'the-meam-hall',
        'xxiv-certamen-nacional-de-pintura-ciudad-de-calahorra'
    )
);

INSERT INTO publication_image (
    publication_id,
    image_url,
    alt_text,
    sort_order,
    is_cover
)
VALUES
((SELECT id FROM publication WHERE slug = 'artist-portfolio-magazine'), '/assets/images/publications/artist-portfolio-magazine-1.jpg', 'Portada Artist Portfolio Magazine', 1, TRUE),
((SELECT id FROM publication WHERE slug = 'artist-portfolio-magazine'), '/assets/images/publications/artist-portfolio-magazine-2.jpg', 'Página de Vicente Ruiz en Artist Portfolio Magazine', 2, FALSE),
((SELECT id FROM publication WHERE slug = 'artist-portfolio-magazine'), '/assets/images/publications/artist-portfolio-magazine-3.jpg', 'Contraportada Artist Portfolio Magazine con Imagine', 3, FALSE),
((SELECT id FROM publication WHERE slug = 'guia-internacional-leonardo-2026'), '/assets/images/publications/guia-internacional-leonardo-2026-1.jpg', 'Guía internacional Leonardo 2026', 1, TRUE),
((SELECT id FROM publication WHERE slug = 'guia-internacional-leonardo-2025'), '/assets/images/publications/guia-internacional-leonardo-2025-1.jpg', 'Guía internacional Leonardo 2025', 1, TRUE),
((SELECT id FROM publication WHERE slug = 'guia-internacional-leonardo-2024'), '/assets/images/publications/guia-internacional-leonardo-2024-1.jpg', 'Guía internacional Leonardo 2024', 1, TRUE),
((SELECT id FROM publication WHERE slug = 'guia-internacional-leonardo-2024'), '/assets/images/publications/guia-internacional-leonardo-2024-2.jpg', 'Guía internacional Leonardo 2024 · detalle', 2, FALSE),
((SELECT id FROM publication WHERE slug = 'articulo-sobre-inquietudes'), '/assets/images/publications/articulo-sobre-inquietudes-1.jpg', 'Artículo sobre «Inquietudes»', 1, TRUE),
((SELECT id FROM publication WHERE slug = 'vi-salon-de-primavera-de-pintura-realista'), '/assets/images/publications/vi-salon-de-primavera-de-pintura-realista-1.jpg', 'VI Salón de Primavera de Pintura Realista', 1, TRUE),
((SELECT id FROM publication WHERE slug = 'vi-salon-de-primavera-de-pintura-realista'), '/assets/images/publications/vi-salon-de-primavera-de-pintura-realista-2.jpg', 'VI Salón de Primavera de Pintura Realista · detalle', 2, FALSE),
((SELECT id FROM publication WHERE slug = 'xxxiii-premio-santa-isabel-de-aragon-reina-de-portugal'), '/assets/images/publications/xxxiii-premio-santa-isabel-de-aragon-reina-de-portugal-1.jpg', 'XXXIII Premio Santa Isabel de Aragón, Reina de Portugal', 1, TRUE),
((SELECT id FROM publication WHERE slug = 'xxxiii-premio-santa-isabel-de-aragon-reina-de-portugal'), '/assets/images/publications/xxxiii-premio-santa-isabel-de-aragon-reina-de-portugal-2.jpg', 'XXXIII Premio Santa Isabel de Aragón, Reina de Portugal · detalle', 2, FALSE),
((SELECT id FROM publication WHERE slug = 'the-meam-hall'), '/assets/images/publications/the-meam-hall-1.jpg', 'The MEAM Hall', 1, TRUE),
((SELECT id FROM publication WHERE slug = 'the-meam-hall'), '/assets/images/publications/the-meam-hall-2.jpg', 'The MEAM Hall · detalle', 2, FALSE),
((SELECT id FROM publication WHERE slug = 'the-meam-hall'), '/assets/images/publications/the-meam-hall-3.jpg', 'The MEAM Hall · detalle', 3, FALSE),
((SELECT id FROM publication WHERE slug = 'xxiv-certamen-nacional-de-pintura-ciudad-de-calahorra'), '/assets/images/publications/xxiv-certamen-nacional-de-pintura-ciudad-de-calahorra-1.jpg', 'XXIV Certamen Nacional de Pintura «Ciudad de Calahorra»', 1, TRUE),
((SELECT id FROM publication WHERE slug = 'xxiv-certamen-nacional-de-pintura-ciudad-de-calahorra'), '/assets/images/publications/xxiv-certamen-nacional-de-pintura-ciudad-de-calahorra-2.jpg', 'XXIV Certamen Nacional de Pintura «Ciudad de Calahorra» · detalle', 2, FALSE);
