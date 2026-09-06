# VRuizArt Portfolio Backend

Backend base del portfolio artístico, construido con Java 17, Spring Boot, Spring Data JPA, PostgreSQL y Flyway.

## Estado incluido

- Flyway con `V1__create_schema.sql` como fuente oficial del esquema.
- Entidades JPA para todo el modelo actual.
- Repositorios Spring Data.
- API pública de lectura para perfil, obras, colecciones, exposiciones y publicaciones.
- Endpoint público para guardar mensajes de contacto.
- Spring Security preparado: solo `/api/public/**` y `/actuator/health` están abiertos.
- CORS preparado para Angular en `http://localhost:4200`.
- `ddl-auto=validate`: Hibernate nunca crea/modifica el esquema; Flyway manda.

## Base de datos

Antes del primer arranque, la base `vruizart_portfolio` debe existir y el esquema `public` debe estar vacío. Flyway ejecutará automáticamente:

`src/main/resources/db/migration/V1__create_schema.sql`

Después aparecerá también la tabla `flyway_schema_history`.

## Variables de entorno

```text
DB_URL=jdbc:postgresql://localhost:5433/vruizart_portfolio
DB_USERNAME=vruizart_user
DB_PASSWORD=tu_password
CORS_ALLOWED_ORIGINS=http://localhost:4200
```

En IntelliJ puedes ponerlas en la Run Configuration.

## Arranque local

Con Maven instalado:

```bash
mvn spring-boot:run
```

En Windows, si generas/añades Maven Wrapper:

```powershell
.\mvnw.cmd spring-boot:run
```

## Docker

Hasta que añadas Maven Wrapper, usa el Dockerfile que ya incluye Maven:

```bash
docker build -f Dockerfile.maven -t vruizart-portfolio-backend .
```

Cuando exista `mvnw`, `mvnw.cmd` y `.mvn/wrapper`, puedes usar `Dockerfile`.

## Endpoints públicos iniciales

- `GET /api/public/profile`
- `GET /api/public/collections`
- `GET /api/public/artworks`
- `GET /api/public/artworks?featured=true`
- `GET /api/public/artworks/{slug}`
- `GET /api/public/exhibitions`
- `GET /api/public/publications`
- `GET /api/public/publications/{slug}`
- `POST /api/public/contact`
- `GET /actuator/health`

## Próximo paso recomendado

Añadir endpoints de administración autenticados para gestionar el contenido y, después, conectar Angular a esta API.
