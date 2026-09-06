INSERT INTO artist_profile (
    name,
    subtitle,
    bio,
    statement,
    quote,
    profile_image_url,
    signature_image_url,
    instagram,
    facebook,
    youtube,
    email
)
SELECT
    'Vicente Ruiz',
    'Artista plástico - Zaragoza',
    'Artista plástico aragonés afincado en Zaragoza. Alterna el retrato y el paisaje urbano con una mirada atenta a lo cotidiano y a esos rincones que suelen pasar desapercibidos. Actualmente desarrolla Un cuadro, una historia, un proyecto de temática social.',
    NULL,
    'Considero arte toda aquella expresión capaz de conmover al que la percibe.',
    'assets/images/profile/vicente-studio.jpg',
    NULL,
    'https://www.instagram.com/vicenteruizdeza/',
    NULL,
    NULL,
    'vruiz77@gmail.com'
    WHERE NOT EXISTS (
    SELECT 1 FROM artist_profile
);