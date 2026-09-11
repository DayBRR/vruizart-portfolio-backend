-- Seed: contenido de la página de contacto
-- Tabla: site_content
-- Se omite "id" para que sea generado por la base de datos.

INSERT INTO site_content
(
    key,
    title,
    content,
    type,
    image_url,
    sort_order,
    is_active,
    created_at,
    updated_at,
    subtitle,
    button_label,
    button_url,
    alt_text
)
VALUES
    (
        'contact.hero',
        'Contacto',
        'Para exposiciones, proyectos, colaboraciones, prensa o cualquier consulta relacionada con mi obra.',
        'HERO',
        '/assets/images/contact/contact-hero.jpg',
        10,
        TRUE,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP,
        'Vicente Ruiz · Zaragoza',
        NULL,
        NULL,
        'Detalle de obra de Vicente Ruiz'
    ),
    (
        'contact.intro',
        'Hablemos de arte',
        'Si estás interesado en alguna obra, quieres proponer una exposición, desarrollar un proyecto conjunto o simplemente deseas conocer más sobre mi trabajo, puedes ponerte en contacto conmigo directamente.',
        'TEXT',
        NULL,
        20,
        TRUE,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP,
        NULL,
        NULL,
        NULL,
        NULL
    ),
    (
        'contact.collaborations',
        'Proyectos y colaboraciones',
        'Estoy abierto a propuestas relacionadas con exposiciones, proyectos artísticos, colaboraciones, prensa y otras iniciativas vinculadas al arte y la cultura.',
        'TEXT',
        NULL,
        30,
        TRUE,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP,
        'Contacto profesional',
        NULL,
        NULL,
        NULL
    ),
    (
        'contact.instagram',
        'Sígueme en Instagram',
        'En Instagram puedes seguir de cerca mi trabajo, descubrir nuevas obras, procesos creativos, exposiciones y otros momentos relacionados con mi actividad artística.',
        'TEXT_IMAGE',
        '/assets/images/contact/instagram-qr.png',
        40,
        TRUE,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP,
        'Instagram',
        'Visitar Instagram',
        'https://www.instagram.com/vicenteruizdeza/',
        'Código QR del perfil de Instagram de Vicente Ruiz'
    ),
    (
        'contact.email',
        'Email',
        'vruiz77@gmail.com',
        'TEXT',
        NULL,
        50,
        TRUE,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP,
        NULL,
        'Enviar email',
        'mailto:vruiz77@gmail.com',
        NULL
    ),
    (
        'contact.location',
        'Ubicación',
        'Zaragoza, España',
        'TEXT',
        NULL,
        60,
        TRUE,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP,
        NULL,
        NULL,
        NULL,
        NULL
    );
