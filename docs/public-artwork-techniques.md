# Contrato público de obras y técnicas

## Arquitectura verificada y decisiones

El backend usa Spring Boot 3.5, Java 17, Spring Data JPA, PostgreSQL y Flyway.
No se encontraron instrucciones AGENTS.md ni pruebas previas en el repositorio.
`PublicPortfolioController` delega en `PublicPortfolioService` y `ArtworkRepository`.
`SpringDataWebConfig` serializa `Page` mediante `VIA_DTO`, con `content` y `page`.
La documentación automática existente es springdoc; este documento complementa su contrato.

La técnica **ya existe**: entidad `Technique`, tabla `technique`, UUID interno y nombre
único no nulo; `Artwork.technique` es una relación opcional ManyToOne mediante
`artwork.technique_id`. Todo ello está definido en V1; V2 incorpora nombres iniciales.
`ArtworkResponse.technique` ya devuelve el nombre, sin UUID. Se reutilizan esa entidad,
relación y nombre. No se cambia el esquema, las migraciones ni el DTO. Los IDs siguen
siendo internos: el contrato para frontend usa nombres y `string[]`.

El catálogo existente pagina IDs en SQL y luego carga únicamente sus detalles con
EntityGraph (`collection`, `technique`, `images`), restaurando el orden de los IDs.
El predicado de técnica se incorpora a las dos consultas existentes de IDs; Spring
Data deriva el count con los mismos predicados. Los joins de esos filtros son
ManyToOne y no duplican obras. Las imágenes no intervienen en la paginación/count.
Las opciones se obtienen con una proyección DISTINCT en base de datos, sin cargar
el catálogo completo.

Diferencias respecto a posibles suposiciones del frontend:

- La colección del DTO son los campos `collectionName` y `collectionSlug`.
- El ámbito público de obras es exclusivamente `artwork.is_visible = true`.
  No depende de `status` ni de `collection.is_active`. Una obra visible en una
  colección inactiva sigue siendo pública, igual que antes. Una obra sin colección
  o sin técnica también puede aparecer en el catálogo sin esos filtros.
- Orden existente: catálogo por `collection.sortOrder`, `artwork.sortOrder`, UUID;
  colección por `artwork.sortOrder`, UUID. Se conserva el tratamiento PostgreSQL de
  nulls. Los parámetros `sort` existentes de Pageable siguen disponibles.
- `GET /artworks?featured=true` figuraba en README, pero el controlador real no
  consumía ese parámetro; lo ignora. La ruta real es `/artworks/featured`.
- Se corrige la pérdida de totales al solicitar una página fuera de rango:
  ahora devuelve contenido vacío conservando el total de coincidencias.

## Endpoints definitivos

### GET /api/public/artworks

Parámetros:

| Parámetro | Comportamiento |
| --- | --- |
| `collection` | Slug exacto, opcional. Omitido, vacío o solo blancos elimina ese filtro. Un slug no vacío se conserva literalmente, sin recortarlo. Desconocido devuelve cero resultados, no 404. |
| `technique` | Nombre, opcional. Omitido, vacío o solo blancos elimina exclusivamente el filtro de técnica. Se recortan blancos exteriores del nombre en consulta y entrada; comparación exacta, sensible a mayúsculas y acentos. No se colapsan espacios internos ni se agrupan técnicas distintas por semejanza. Desconocido o incompatible con colección devuelve cero resultados. |
| `page` | Base cero, por defecto 0. Se conserva el resolver de Spring Data: negativo o no numérico usa 0. |
| `size` | Por defecto 12. Cero, negativo o no numérico usa 12. Valores mayores de 2000 se limitan a 2000. |

Los filtros de colección y técnica se combinan mediante AND antes de paginar y
contar. Sin coincidencias: HTTP 200, `content: []`, `totalElements: 0`, `totalPages: 0`.
Una página fuera de rango mantiene los totales reales y el número solicitado.

Ejemplo de respuesta completa reproducible con las fixtures públicas sintéticas
de `PublicArtworksIntegrationTest` (no corresponde a datos privados ni afirma el
estado de una base desplegada):

```http
GET /api/public/artworks?collection=retratos&technique=Pastel%20sobre%20papel&page=1&size=12
```

```json
{
  "content": [{
    "title": "obra-25",
    "slug": "obra-25",
    "year": null,
    "description": null,
    "widthCm": null,
    "heightCm": null,
    "price": null,
    "status": "AVAILABLE",
    "featured": false,
    "collectionName": "retratos",
    "collectionSlug": "retratos",
    "technique": "Pastel sobre papel",
    "mainImageUrl": null,
    "images": []
  }],
  "page": {"size": 12, "number": 1, "totalElements": 13, "totalPages": 2}
}
```

```http
GET /api/public/artworks?collection=paisaje-urbano&technique=Pastel%20sobre%20papel&page=0&size=12
```

```json
{"content": [], "page": {"size": 12, "number": 0, "totalElements": 0, "totalPages": 0}}
```

### GET /api/public/artworks/techniques

Devuelve HTTP 200 con `string[]`: nombres de técnicas usadas por al menos una obra
visible, opcionalmente de la colección indicada. `collection` sigue exactamente las
reglas del catálogo. Una colección desconocida o sin obras/técnicas devuelve `[]`.
No acepta filtros de técnica ni paginación: esos parámetros se ignoran.

Excluye relación nula y nombres vacíos o blancos. Recorta blancos exteriores,
deduplica con esa misma normalización y ordena alfabéticamente con la colación de
PostgreSQL; no fuerza una colación española ni unifica mayúsculas o acentos. La
normalización de nombres en SQL usa `regexp_replace` de PostgreSQL para reconocer
también tabulaciones y saltos de línea. El campo del DTO conserva el nombre
persistido original por compatibilidad; usar las opciones como valores del selector.
No se incluyen técnicas sin obras ni técnicas usadas exclusivamente por obras ocultas.

Ejemplos reproducibles con las mismas fixtures:

```http
GET /api/public/artworks/techniques
```

```json
["Óleo sobre lienzo", "Pastel sobre papel"]
```

```http
GET /api/public/artworks/techniques?collection=paisaje-urbano
```

```json
["Óleo sobre lienzo"]
```

Otras peticiones compatibles (nombres/slugs presentes también en los seeds del repositorio;
la disponibilidad desplegada se consulta mediante las opciones):

```http
GET /api/public/artworks?technique=%C3%93leo%20sobre%20lienzo&page=0&size=12
GET /api/public/artworks?collection=retratos&page=0&size=12
GET /api/public/artworks/techniques?collection=retratos
```

## Rutas existentes y colisiones

`/artworks/techniques`, `/artworks/hero` y `/artworks/featured` son rutas estáticas
con prioridad sobre `/artworks/{slug}`. La nueva ruta reserva el slug `techniques`;
una obra con ese slug no se podrá obtener por la ruta de detalle. No se ha consultado
una base desplegada para afirmar que no exista ese slug: comprobarlo al desplegar.
Detalle inexistente u oculto sigue devolviendo 404. Hero y featured mantienen listas
sin paginar y el filtro de visibilidad y orden existentes.

## Integración frontend pendiente

1. Obtener las opciones globales o por colección desde `/artworks/techniques`.
2. Enviar el nombre seleccionado como `technique` usando HttpParams (codificación URL).
3. Reiniciar `page` a 0 al cambiar colección o técnica, conservando `size=12`.
4. Al borrar técnica, omitirla o enviar vacío; mantener el filtro de colección.
5. Recargar opciones al cambiar colección, no al cambiar página ni técnica activa;
   limpiar una selección que ya no pertenezca a las opciones de esa colección.
6. Renderizar los totales devueltos y el estado vacío; no filtrar páginas en memoria.

## Pruebas

`mvn test` con JDK 17. La dependencia embedded-postgres es exclusivamente de test:
arranca PostgreSQL en un puerto libre y directorio temporal, sin Docker ni acceso a
la base de aplicación. Flyway ejecuta las migraciones reales y Hibernate valida el
esquema. Se necesitan las dependencias Maven/binarios de la plataforma disponibles
y permiso para iniciar procesos locales. Las fixtures se aíslan de la aplicación.

Las pruebas unitarias comprueban composición y parámetros opcionales; las de
integración atraviesan HTTP, servicio, JPA y PostgreSQL: múltiples páginas, resultados
fuera de la primera página original, count, última página y fuera de rango, orden y
desempate por UUID, imágenes múltiples, filtros desconocidos/incompatibles, opciones
completas y deduplicadas, obras ocultas, colección inactiva, conjunto vacío, DTO,
detalle, rutas estáticas y valores inválidos de Pageable.

Verificación ejecutada el 18/10/2026: Maven 3.9.6, JDK 17.0.18 y PostgreSQL
temporal 14.15, con las 11 migraciones aplicadas y validación Hibernate correcta.
Resultado final de `mvn -B test`: **BUILD SUCCESS**, 9 pruebas (3 unitarias y 6 de
integración), 0 fallos, 0 errores y 0 omitidas. Incluye regresión para evitar
normalizaciones diferentes entre Java y SQL: tanto el valor recibido como el
nombre persistido se normalizan mediante la misma expresión SQL.
No se verificó el contenido de ninguna base desplegada.
