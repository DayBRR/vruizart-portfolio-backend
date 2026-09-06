UPDATE artwork
SET is_featured = FALSE;

UPDATE artwork
SET is_featured = TRUE
WHERE slug IN (
               'vigilando-el-abandono',
               'cara-oculta-en-plaza-san-marcos',
               'la-bruja-de-cadaques',
               'imagine',
               'cooper',
               'amy',
               'aprendiz-de-payaso',
               'ione',
               'guerreras-del-agua',
               'guerra-y-escuela',
               'isabelle-2019',
               'boxer'
    );