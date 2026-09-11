-- ============================================================
-- HOME HERO
-- Configuración inicial del carrusel de la Home
-- ============================================================

INSERT INTO site_content (
    id,
    key,
    title,
    subtitle,
    content,
    type,
    image_url,
    alt_text,
    button_label,
    button_url,
    sort_order,
    is_active
)
VALUES
    (
        gen_random_uuid(),
        'home.hero.01',
        'Retrato y paisaje urbano',
        'Artista plástico · Zaragoza',
        'Una pintura que alterna el retrato con escenarios urbanos, deteniéndose en esos rincones que suelen pasar desapercibidos.',
        'HERO',
        'assets/images/hero/hero-1.jpg',
        'Vista de una exposición de Vicente Ruiz, 2022',
        'Ver obra',
        '/obra',
        1,
        true
    ),
    (
        gen_random_uuid(),
        'home.hero.02',
        'Retrato y paisaje urbano',
        'Artista plástico · Zaragoza',
        'Una pintura que alterna el retrato con escenarios urbanos, deteniéndose en esos rincones que suelen pasar desapercibidos.',
        'HERO',
        'assets/images/hero/hero-2.jpg',
        'Vista de una exposición de Vicente Ruiz, 2024',
        'Ver obra',
        '/obra',
        2,
        true
    ),
    (
        gen_random_uuid(),
        'home.hero.03',
        'Retrato y paisaje urbano',
        'Artista plástico · Zaragoza',
        'Una pintura que alterna el retrato con escenarios urbanos, deteniéndose en esos rincones que suelen pasar desapercibidos.',
        'HERO',
        'assets/images/hero/hero-3.jpg',
        'Vicente Ruiz junto a una de sus obras en exposición, 2024',
        'Ver obra',
        '/obra',
        3,
        true
    ),
    (
        gen_random_uuid(),
        'home.hero.04',
        'Retrato y paisaje urbano',
        'Artista plástico · Zaragoza',
        'Una pintura que alterna el retrato con escenarios urbanos, deteniéndose en esos rincones que suelen pasar desapercibidos.',
        'HERO',
        'assets/images/hero/hero-4.jpg',
        'Vista de una exposición de Vicente Ruiz, 2024',
        'Ver obra',
        '/obra',
        4,
        true
    ),
    (
        gen_random_uuid(),
        'home.hero.05',
        'Retrato y paisaje urbano',
        'Artista plástico · Zaragoza',
        'Una pintura que alterna el retrato con escenarios urbanos, deteniéndose en esos rincones que suelen pasar desapercibidos.',
        'HERO',
        'assets/images/hero/hero-5.jpg',
        'Vista de una exposición de Vicente Ruiz, 2020',
        'Ver obra',
        '/obra',
        5,
        true
    )
    ON CONFLICT (key)
DO UPDATE SET
    title        = EXCLUDED.title,
           subtitle     = EXCLUDED.subtitle,
           content      = EXCLUDED.content,
           type         = EXCLUDED.type,
           image_url    = EXCLUDED.image_url,
           alt_text     = EXCLUDED.alt_text,
           button_label = EXCLUDED.button_label,
           button_url   = EXCLUDED.button_url,
           sort_order   = EXCLUDED.sort_order,
           is_active    = EXCLUDED.is_active;