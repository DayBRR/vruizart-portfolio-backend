INSERT INTO publication (
    title,
    slug,
    publication_type,
    publisher_name,
    publication_year,
    description,
    cover_image_url,
    file_url,
    reference,
    is_featured,
    is_visible,
    sort_order
)
VALUES
('Artist Portfolio Magazine', 'artist-portfolio-magazine', 'MAGAZINE'::publication_type, '10 Year Anniversary Issue · Volume 1', 2020, 'En el número especial del décimo aniversario, Imagine apareció en páginas interiores y fue seleccionada también para la contraportada de la publicación.', '/assets/images/publications/artist-portfolio-magazine-1.jpg', '/assets/documents/publications/artist-portfolio-magazine-2020.pdf#page=40', 'El PDF completo contiene 60 páginas. La página dedicada a Vicente Ruiz es la 40; la contraportada reproduce también la obra Imagine.', TRUE, TRUE, 90),
('Guía internacional Leonardo 2026', 'guia-internacional-leonardo-2026', 'BOOK'::publication_type, 'Guía internacional de arte y artistas', 2026, 'Tercera participación consecutiva en la guía internacional Leonardo. La imagen de esta edición todavía no se ha incorporado al archivo gráfico de la web.', '/assets/images/publications/guia-internacional-leonardo-2026-1.jpg', NULL, 'Presencia en las páginas 162-163', FALSE, TRUE, 1),
('Guía internacional Leonardo 2025', 'guia-internacional-leonardo-2025', 'BOOK'::publication_type, 'Guía internacional de arte y artistas', 2025, 'Edición 2025 de la guía internacional Leonardo, publicación dedicada a artistas y creación contemporánea.', '/assets/images/publications/guia-internacional-leonardo-2025-1.jpg', NULL, 'Páginas 162-163', FALSE, TRUE, 2),
('Guía internacional Leonardo 2024', 'guia-internacional-leonardo-2024', 'BOOK'::publication_type, 'Guía internacional de arte y artistas', 2024, 'Primera de tres apariciones consecutivas en la guía Leonardo. La documentación conservada permite mostrar tanto la portada como las páginas interiores.', '/assets/images/publications/guia-internacional-leonardo-2024-1.jpg', NULL, 'Páginas 162-163', FALSE, TRUE, 3),
('Artículo sobre «Inquietudes»', 'articulo-sobre-inquietudes', 'PRESS'::publication_type, 'Prensa · Cinco Villas', 2022, 'Artículo publicado con motivo de la exposición «Inquietudes» en la Casa de la Cámara de Tauste, con imágenes de la inauguración y de la muestra.', '/assets/images/publications/articulo-sobre-inquietudes-1.jpg', NULL, 'Exposición individual Inquietudes · Tauste', FALSE, TRUE, 4),
('VI Salón de Primavera de Pintura Realista', 'vi-salon-de-primavera-de-pintura-realista', 'CATALOG'::publication_type, 'Catálogo de exposición · Sala Maruja Mallo, Madrid', 2022, 'Catálogo del VI Salón de Primavera de Pintura Realista. La publicación incluye la obra presentada por Vicente Ruiz junto a la ficha del artista.', '/assets/images/publications/vi-salon-de-primavera-de-pintura-realista-1.jpg', NULL, 'Obra publicada: «Joven melómano»', FALSE, TRUE, 5),
('XXXIII Premio Santa Isabel de Aragón, Reina de Portugal', 'xxxiii-premio-santa-isabel-de-aragon-reina-de-portugal', 'CATALOG'::publication_type, 'Catálogo · Palacio de Sástago · Zaragoza', 2022, 'Catálogo de la exposición organizada por la Diputación Provincial de Zaragoza en el Palacio de Sástago.', '/assets/images/publications/xxxiii-premio-santa-isabel-de-aragon-reina-de-portugal-1.jpg', NULL, 'Obra publicada: «Vigilando el abandono»', FALSE, TRUE, 6),
('The MEAM Hall', 'the-meam-hall', 'BOOK'::publication_type, 'Libro-catálogo · Museu Europeu d''Art Modern · Barcelona', 2022, 'Libro-catálogo de The MEAM Hall 2022. La documentación disponible muestra la portada y las páginas interiores dedicadas a las obras participantes.', '/assets/images/publications/the-meam-hall-1.jpg', NULL, 'Obras publicadas: «Nostalgia» y «La partida»', FALSE, TRUE, 7),
('XXIV Certamen Nacional de Pintura «Ciudad de Calahorra»', 'xxiv-certamen-nacional-de-pintura-ciudad-de-calahorra', 'CATALOG'::publication_type, 'Catálogo de certamen', 2020, 'Catálogo oficial del XXIV Certamen Nacional de Pintura Ciudad de Calahorra, en el que aparece la obra seleccionada.', '/assets/images/publications/xxiv-certamen-nacional-de-pintura-ciudad-de-calahorra-1.jpg', NULL, 'Obra publicada: «Cara oculta de Piazza San Marco»', FALSE, TRUE, 8)
ON CONFLICT (slug) DO UPDATE SET
    title = EXCLUDED.title,
    publication_type = EXCLUDED.publication_type,
    publisher_name = EXCLUDED.publisher_name,
    publication_year = EXCLUDED.publication_year,
    description = EXCLUDED.description,
    cover_image_url = EXCLUDED.cover_image_url,
    file_url = EXCLUDED.file_url,
    reference = EXCLUDED.reference,
    is_featured = EXCLUDED.is_featured,
    is_visible = EXCLUDED.is_visible,
    sort_order = EXCLUDED.sort_order;
