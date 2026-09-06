INSERT INTO collection (
    name,
    slug,
    description,
    cover_image_url,
    sort_order,
    is_active
)
VALUES
    (
        'Paisaje urbano',
        'paisaje-urbano',
        NULL,
        NULL,
        1,
        TRUE
    ),
    (
        'Retratos',
        'retratos',
        NULL,
        NULL,
        2,
        TRUE
    ),
    (
        'Leyendas de la música',
        'leyendas-de-la-musica',
        NULL,
        NULL,
        3,
        TRUE
    ),
    (
        'Un cuadro, una historia',
        'un-cuadro-una-historia',
        NULL,
        NULL,
        4,
        TRUE
    ),
    (
        'Ventanas del alma',
        'ventanas-del-alma',
        NULL,
        NULL,
        5,
        TRUE
    ),
    (
        '20x20',
        '20x20',
        NULL,
        NULL,
        6,
        TRUE
    ),
    (
        'Otras obras',
        'otras-obras',
        NULL,
        NULL,
        7,
        TRUE
    )
    ON CONFLICT (slug) DO NOTHING;