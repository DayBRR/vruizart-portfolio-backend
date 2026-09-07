-- About page editorial content.
-- Data is intentionally kept outside Flyway and can be executed manually.
-- Existing keys are updated, so the script is safe to run again.

INSERT INTO site_content (
    id,
    key,
    title,
    content,
    type,
    image_url,
    sort_order,
    is_active,
    created_at,
    updated_at
)
VALUES
(gen_random_uuid(), 'about.hero', 'Sobre mí', 'Retrato, paisaje urbano y una mirada atenta a las historias que suelen quedar fuera del primer plano.', 'TEXT_IMAGE', '/assets/images/about/vicente-ruiz-estudio.jpg', 10, TRUE, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(gen_random_uuid(), 'about.bio', 'Una obra entre la mirada y la memoria', 'Soy un artista plástico aragonés afincado en Zaragoza.

Mi trabajo se mueve principalmente entre el retrato y el paisaje urbano, dos territorios que me permiten acercarme tanto a la expresión humana como a esos espacios de la ciudad que suelen pasar desapercibidos.

En el retrato me interesa especialmente la mirada: esa parte del rostro capaz de revelar emociones que no siempre encuentran palabras. En el paisaje urbano, en cambio, busco rincones abandonados, huellas del tiempo y lugares que conservan la memoria de algo que ya no está.

Con el tiempo, esa forma de observar se ha extendido también hacia proyectos de contenido social en los que la pintura se convierte en una manera de dar visibilidad a historias de injusticia, vulnerabilidad o abandono.', 'TEXT', NULL, 20, TRUE, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(gen_random_uuid(), 'about.quote', 'Vicente Ruiz', 'Considero arte toda aquella expresión capaz de conmover al que la percibe.', 'QUOTE', NULL, 30, TRUE, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(gen_random_uuid(), 'about.axes.intro', 'Una forma de mirar', 'Tres líneas atraviesan buena parte de mi obra y, aunque en ocasiones aparezcan por separado, comparten una misma intención: detener la mirada donde normalmente pasamos de largo.', 'TEXT', NULL, 40, TRUE, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(gen_random_uuid(), 'about.axis.portrait', 'La mirada humana', 'Los ojos han sido desde mis primeros trabajos un punto de partida. Alegría, tristeza, soledad, desamparo o tensión pueden ocultarse en palabras, pero difícilmente desaparecen de una mirada.', 'TEXT_IMAGE', '/assets/images/about/eje-retrato.jpg', 41, TRUE, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(gen_random_uuid(), 'about.axis.urban', 'Lo que permanece', 'Me interesan los rincones olvidados de pequeñas y grandes urbes: espacios que estuvieron llenos de vida y hoy parecen quedar suspendidos, como imágenes fijas de lo efímero de la existencia.', 'TEXT_IMAGE', '/assets/images/about/eje-paisaje-urbano.jpg', 42, TRUE, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(gen_random_uuid(), 'about.axis.social', 'Historias que importan', 'En los proyectos de temática social la pintura deja de ser únicamente representación para convertirse también en una invitación a conocer realidades que con demasiada frecuencia permanecen fuera de nuestra atención.', 'TEXT_IMAGE', '/assets/images/about/eje-mirada-social.jpg', 43, TRUE, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(gen_random_uuid(), 'about.process.intro', 'Del impulso a la obra', 'No existe una fórmula única. Cada trabajo parte de una imagen, un espacio, un rostro o una historia que despierta una inquietud. En algunos proyectos, especialmente los de contenido social, la búsqueda y documentación previa forman parte esencial del proceso.', 'TEXT', NULL, 50, TRUE, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(gen_random_uuid(), 'about.process.01', 'Observar', 'Una mirada, un lugar o una historia que reclama atención.', 'TEXT', NULL, 51, TRUE, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(gen_random_uuid(), 'about.process.02', 'Documentar', 'Buscar referencias y comprender el contexto cuando la obra lo requiere.', 'TEXT', NULL, 52, TRUE, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(gen_random_uuid(), 'about.process.03', 'Seleccionar', 'Encontrar el encuadre y la imagen que contiene la intención del trabajo.', 'TEXT', NULL, 53, TRUE, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(gen_random_uuid(), 'about.process.04', 'Construir', 'Dibujo, composición y decisiones sobre soporte, técnica y escala.', 'TEXT', NULL, 54, TRUE, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(gen_random_uuid(), 'about.process.05', 'Pintar', 'Trasladar la imagen al lienzo sin perder aquello que originó la obra.', 'TEXT', NULL, 55, TRUE, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(gen_random_uuid(), 'about.social-project', 'Un cuadro, una historia', 'Es el proyecto en el que trabajo actualmente y nace de la voluntad de dar visibilidad a situaciones en las que, especialmente mujeres y niños, son víctimas de injusticias, abusos o penurias.

Pobreza, cambio climático, derechos de la mujer, educación, conflictos bélicos o matrimonios forzosos son algunos de los temas que aparecen en la colección.

Para construir estas obras he buscado material gráfico de periodistas y fotógrafos comprometidos con esas realidades. La generosidad de profesionales como Lynn Johnson, Paula Bronstein, Onur Dogman, Gregg Brekke, Solmaz Daryani, Daniel Etter, Diego Ibarra o Ana Palacios ha permitido trasladar algunas de esas historias al lienzo.', 'TEXT_IMAGE', '/assets/images/about/un-cuadro-una-historia.jpg', 60, TRUE, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(gen_random_uuid(), 'about.trajectory.intro', 'Trayectoria', 'Una selección de momentos que permiten seguir la evolución del trabajo desde las primeras exposiciones individuales hasta la participación en muestras internacionales.', 'TEXT', NULL, 70, TRUE, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(gen_random_uuid(), 'about.publications.intro', 'Publicaciones y proyección', 'La obra también ha formado parte de catálogos, publicaciones especializadas y guías internacionales, acompañando la trayectoria expositiva dentro y fuera de España.', 'TEXT', NULL, 80, TRUE, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)
ON CONFLICT (key) DO UPDATE
SET
    title = EXCLUDED.title,
    content = EXCLUDED.content,
    type = EXCLUDED.type,
    image_url = EXCLUDED.image_url,
    sort_order = EXCLUDED.sort_order,
    is_active = EXCLUDED.is_active,
    updated_at = CURRENT_TIMESTAMP;

INSERT INTO site_content (
    id,
    key,
    title,
    content,
    type,
    image_url,
    sort_order,
    is_active,
    created_at,
    updated_at
)
VALUES (
           gen_random_uuid(),
           'about.cta',
           'Conoce mi obra',
           'Descubre las colecciones, exposiciones y publicaciones que forman parte de mi trayectoria artística.',
           'TEXT',
           NULL,
           90,
           TRUE,
           CURRENT_TIMESTAMP,
           CURRENT_TIMESTAMP
       )
    ON CONFLICT (key) DO UPDATE
                             SET
                                 title = EXCLUDED.title,
                             content = EXCLUDED.content,
                             type = EXCLUDED.type,
                             image_url = EXCLUDED.image_url,
                             sort_order = EXCLUDED.sort_order,
                             is_active = EXCLUDED.is_active,
                             updated_at = CURRENT_TIMESTAMP;
