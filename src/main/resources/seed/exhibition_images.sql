-- =========================================================
-- Updates: imágenes de exposiciones individuales
-- Assets esperados en Angular:
--   src/assets/images/exhibitions/<archivo>
-- BBDD:
--   assets/images/exhibitions/<archivo>
-- =========================================================

UPDATE exhibition
SET image_url = 'assets/images/exhibitions/pinceladas-de-vida.jpg'
WHERE slug = 'pinceladas-de-vida';

UPDATE exhibition
SET image_url = 'assets/images/exhibitions/retratos-que-dan-la-nota.jpg'
WHERE slug = 'retratos-que-dan-la-nota';

UPDATE exhibition
SET image_url = 'assets/images/exhibitions/inquietudes.jpg'
WHERE slug = 'inquietudes';

UPDATE exhibition
SET image_url = 'assets/images/exhibitions/miradas-y-visiones.jpg'
WHERE slug = 'miradas-y-visiones';

UPDATE exhibition
SET image_url = 'assets/images/exhibitions/leyendas-de-la-musica.png'
WHERE slug = 'leyendas-de-la-musica';

UPDATE exhibition
SET image_url = 'assets/images/exhibitions/ventanas-del-alma.jpg'
WHERE slug = 'ventanas-del-alma';
