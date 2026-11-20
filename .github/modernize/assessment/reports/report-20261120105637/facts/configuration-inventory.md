# Configuration & Externalized Settings Inventory

The project has Spring properties for default, Docker, and test environments, plus Compose and environment-file inputs. Passwords are referenced through environment variables rather than committed values.

## Configuration Sources

| Source | Type | Path/Location | Notes |
|---|---|---|---|
| Spring default settings | Properties | `src/main/resources/application.properties` | Default active configuration |
| Docker settings | Spring profile properties | `src/main/resources/application-docker.properties` | Selected by `SPRING_PROFILES_ACTIVE=docker` in Compose |
| Test settings | Spring profile properties | `src/test/resources/application-test.properties` | Selected by `@ActiveProfiles("test")` |
| Container services | Compose YAML | `docker-compose.yml` | Oracle and application environment, health check, persistent Oracle volume |
| Secret template | Environment template | `.env.example` | Placeholder values only; local `.env` is intended to hold deployment secrets |
| Container build | Dockerfile | `Dockerfile` | Java image/build configuration |

## Build Profiles

| Profile | Activation | Purpose | Key Dependencies/Plugins |
|---|---|---|---|
| None declared | N/A | Maven POM defines no Maven build profiles | Spring Boot parent and Spring Boot Maven plugin |

## Runtime Profiles

| Profile | Activation Method | Config Files | Key Overrides |
|---|---|---|---|
| Default | Spring default when no profile is selected | `application.properties` | Oracle localhost connection; DEBUG application and web logging |
| `docker` | `SPRING_PROFILES_ACTIVE=docker` | `application-docker.properties` | Oracle Compose hostname; INFO application logging and WARN web logging |
| `test` | `@ActiveProfiles("test")` | `src/test/resources/application-test.properties` | H2 in-memory database and test upload path |

## Properties Inventory

### Photo Album application

| Property Key | Default | Profiles | Source |
|---|---|---|---|
| `server.port` | `8080` | Default, docker | Properties files |
| `server.servlet.encoding.charset` | `UTF-8` | Default, docker | Properties files |
| `server.servlet.encoding.enabled` / `server.servlet.encoding.force` | `true` | Default, docker | Properties files |
| `spring.datasource.url` | `jdbc:oracle:thin:@localhost:1521:XE`; Docker default `jdbc:oracle:thin:@oracle-db:1521:XE` | Default, docker | `SPRING_DATASOURCE_URL` may override |
| `spring.datasource.username` | `photoalbum` | Default, docker | `SPRING_DATASOURCE_USERNAME` may override |
| `spring.datasource.password` | No committed default | Default, docker | Required `SPRING_DATASOURCE_PASSWORD` |
| `spring.datasource.driver-class-name` | `oracle.jdbc.OracleDriver` | Default, docker | Properties files |
| `spring.jpa.database-platform` | Oracle dialect | Default, docker | H2 dialect in test |
| `spring.jpa.hibernate.ddl-auto` | `create` | Default, docker | `create-drop` in test |
| `spring.jpa.show-sql` | `true` | Default, docker | `false` in test |
| `spring.jpa.properties.hibernate.format_sql` | `true` | Default, docker | Default and docker |
| `spring.servlet.multipart.max-file-size` | `10MB` | Default, docker | Properties files |
| `spring.servlet.multipart.max-request-size` | `50MB` | Default, docker | Properties files |
| `app.file-upload.max-file-size-bytes` | `10485760` | Default, docker, test | Properties files |
| `app.file-upload.allowed-mime-types` | `image/jpeg,image/png,image/gif,image/webp` | Default, docker, test | Properties files |
| `app.file-upload.max-files-per-upload` | `10` | Default, docker, test | Declared, but not referenced by upload controller/service |
| `app.admin.username` | `admin` | Docker default; test profile also supplies a test account | `APP_ADMIN_USERNAME` in Compose |
| `app.admin.password` | Required | Default and docker | `APP_ADMIN_PASSWORD` in Compose; secret is not hard-coded |
| `logging.level.com.photoalbum` | `DEBUG` | Default, test; `INFO` in docker | Properties files |
| `logging.level.org.springframework.web` | `DEBUG` | Default; `WARN` in docker | Properties files |
| `logging.level.org.hibernate.SQL` | `DEBUG` | Docker | Properties file |

## Startup Parameters & Resource Requirements

| Service | JVM/Runtime Options | Memory | Instance Count |
|---|---|---|---|
| Photo Album application | No JVM heap options or explicit runtime flags detected | Not specified | One Compose service; no scaling configuration detected |
| Oracle Database XE | Oracle image defaults | Not specified | One Compose service |

## Startup Dependency Chain

1. `oracle-db` starts and initializes with the configured environment inputs.
2. Docker Compose waits for the Oracle health check (`SELECT 1 FROM DUAL`) to pass.
3. `photoalbum-java-app` starts after `oracle-db` is healthy via `depends_on: condition: service_healthy`.

## Secrets & Sensitive Configuration

| Secret Reference | Type | Storage (masked) |
|---|---|---|
| `ORACLE_PASSWORD` | Oracle administrator password | `.env` environment input; template contains placeholder only |
| `APP_USER_PASSWORD` / `SPRING_DATASOURCE_PASSWORD` | Application database password | `.env` environment input, passed to Compose/application; value not included |
| `APP_ADMIN_PASSWORD` | Admin password | `.env` environment input, passed to application; value not included |

### Secrets Provisioning Workflow

The operator copies `.env.example` to a local `.env` and provides unique passwords. Docker Compose passes database administrator and application schema credentials to Oracle, then passes the schema password and application administrator password to the Java container. No Key Vault, Vault, managed identity, or encrypted configuration provider was detected.

## Feature Flags

| Flag Name | Default | Controlled By |
|---|---|---|
| No feature flags detected | N/A | N/A |

## Framework & Runtime Versions

| Component | Version | Source |
|---|---|---|
| Java | 21 | `pom.xml` |
| Spring Boot | 3.5.0 | `pom.xml` parent |
| Hibernate ORM | 6.6.15.Final | Maven resolved dependency tree |
| Oracle JDBC driver | 23.7.0.25.01 | Maven resolved dependency tree |
| Maven | Wrapper not present; version not pinned | Build files |
| Oracle Database XE container | 21.3.0-xe | `docker-compose.yml` |
