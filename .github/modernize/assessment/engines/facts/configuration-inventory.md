# Configuration & Externalized Settings Inventory

Configuration is distributed across Maven, Spring properties, Docker Compose, and environment variables. Runtime has a default Oracle profile and an explicit Docker profile; the actual `.env` file is a local secret source and is not included in the repository.

## Configuration Sources

| Source | Type | Path/Location | Notes |
|---|---|---|---|
| Maven project | Build configuration | `pom.xml` | Java 21, Spring Boot parent 3.5.0, dependencies, and packaging |
| Default Spring settings | Runtime properties | `src/main/resources/application.properties` | Port, Oracle, JPA, multipart, upload validation, and logging |
| Docker Spring settings | Profile-specific runtime properties | `src/main/resources/application-docker.properties` | Oracle Compose host and Docker-specific logging |
| Test Spring settings | Test runtime properties | `src/test/resources/application-test.properties` | H2 in-memory DB and test-only settings |
| Docker Compose | Container configuration | `docker-compose.yml` | Oracle and application services, environment injection, health check, and startup dependency |
| Docker image | Container build and startup | `Dockerfile` | Maven build stage, Java 21 runtime, JVM options, and port |
| Environment template | Secret setup example | `.env.example` | Required variable names with placeholder values only |
| Local environment | Secret input | `.env` (git-ignored; not present) | Compose reads database and admin credentials from developer-provided values |

No external configuration server, Key Vault, Vault, or cloud secret-store integration was found.

## Build Profiles

| Profile | Activation | Purpose | Key Dependencies/Plugins |
|---|---|---|---|
| Maven default | Automatic | Compiles and packages the application | Spring Boot Maven plugin |

No custom Maven build profiles were declared.

## Runtime Profiles

| Profile | Activation Method | Config Files | Key Overrides |
|---|---|---|---|
| Default | Spring default when no profile is active | `application.properties` | Local Oracle URL default, DEBUG application/web logging |
| docker | Compose sets `SPRING_PROFILES_ACTIVE=docker` | `application.properties`, `application-docker.properties` | Oracle Compose service URL, INFO app logging, WARN web logging, DEBUG Hibernate SQL |
| test | `@ActiveProfiles("test")` in the context test | `src/test/resources/application-test.properties` | H2 in-memory DB, create-drop schema, quiet SQL output |

## Properties Inventory

### photoalbum-java-app

| Property Key | Default | Profiles | Source |
|---|---|---|---|
| `server.port` | `8080` | default, docker | Spring properties |
| `server.servlet.encoding.charset` | `UTF-8` | default, docker | Spring properties |
| `server.servlet.encoding.enabled` / `force` | `true` | default, docker | Spring properties |
| `spring.datasource.url` | Environment variable; local Oracle URL fallback | default; Docker overrides host through environment | `SPRING_DATASOURCE_URL` |
| `spring.datasource.username` | Environment variable; `photoalbum` fallback | default, docker | `SPRING_DATASOURCE_USERNAME` |
| `spring.datasource.password` | Required environment variable; value masked | default, docker | `SPRING_DATASOURCE_PASSWORD` |
| `spring.datasource.driver-class-name` | `oracle.jdbc.OracleDriver` | default, docker | Spring properties |
| `spring.jpa.database-platform` | Oracle dialect | default, docker | Spring properties |
| `spring.jpa.hibernate.ddl-auto` | `create` | default, docker | Spring properties |
| `spring.jpa.show-sql` / `spring.jpa.properties.hibernate.format_sql` | `true` | default, docker | Spring properties |
| `spring.servlet.multipart.max-file-size` | `10MB` | default, docker | Spring properties |
| `spring.servlet.multipart.max-request-size` | `50MB` | default, docker | Spring properties |
| `app.file-upload.max-file-size-bytes` | `10485760` | default, docker, test | Spring properties |
| `app.file-upload.allowed-mime-types` | JPEG, PNG, GIF, WebP | default, docker, test | Spring properties |
| `app.file-upload.max-files-per-upload` | `10` | default, docker, test | Present in configuration; not enforced in the controller |
| `app.admin.username` | `admin` if not set | docker environment; test profile | `APP_ADMIN_USERNAME` |
| `app.admin.password` | Required; value masked | docker environment; test-only config | `APP_ADMIN_PASSWORD` |
| `logging.level.com.photoalbum` | `DEBUG` | default, test; `INFO` in docker | Spring properties |
| `logging.level.org.springframework.web` | `DEBUG` | default; `WARN` in docker | Spring properties |
| `logging.level.org.hibernate.SQL` | Not explicitly set by default | docker | `DEBUG` in Docker profile |

No feature-flag framework or application toggle was detected.

## Startup Parameters & Resource Requirements

| Service | JVM/Runtime Options | Memory | Instance Count |
|---|---|---|---|
| photoalbum-java-app | `-Xms256m -Xmx512m` via `JAVA_OPTS` | Heap capped at 512 MB; Compose resource limit not specified | One Compose service instance |
| oracle-db | Oracle XE image defaults | No Compose memory limit specified | One Compose service instance |

No CPU quota, replica scaling, or Kubernetes resource allocation was found.

## Startup Dependency Chain

1. `oracle-db` starts and runs its SQL health check against Oracle XE.
2. Docker Compose waits until the database health check succeeds (`depends_on.condition: service_healthy`; 30-second interval, 10-second timeout, 15 retries, and 180-second start period).
3. `photoalbum-java-app` starts with the `docker` Spring profile and the Oracle connection environment variables.

## Secrets & Sensitive Configuration

| Secret Reference | Type | Storage (masked) |
|---|---|---|
| `ORACLE_PASSWORD` | Oracle administrator password | Supplied through local `.env`; placeholder only in `.env.example` |
| `APP_USER_PASSWORD` / `SPRING_DATASOURCE_PASSWORD` | Application database password | Supplied through local `.env` and Compose environment; value not included |
| `APP_ADMIN_PASSWORD` / `app.admin.password` | Application administrator password | Supplied through environment variables; test-only value is masked |

### Secrets Provisioning Workflow

Developers copy `.env.example` to the ignored `.env` file and supply strong local values. Docker Compose passes database and administrator credentials into the relevant containers as environment variables. No managed identity, cloud secret store, encryption wrapper, or deployment identity workflow is configured in the repository.

## Feature Flags

| Flag Name | Default | Controlled By |
|---|---|---|
| None detected | N/A | No feature-flag framework or conditional feature property found |

## Framework & Runtime Versions

| Component | Version | Source |
|---|---|---|
| Java | 21 | `pom.xml` |
| Spring Boot | 3.5.0 | Maven parent |
| Spring Framework | 6.2.7 | Resolved Maven dependency tree |
| Spring Security | 6.5.0 | Resolved Maven dependency tree |
| Hibernate ORM | 6.6.15.Final | Resolved Maven dependency tree |
| Oracle JDBC | 23.7.0.25.01 | Resolved Maven dependency tree |
| Oracle XE | 21.3.0-xe | `docker-compose.yml` |
| Maven build image | 3.9.9 with Eclipse Temurin 21 | `Dockerfile` |
| Java runtime image | Eclipse Temurin 21 JRE | `Dockerfile` |
| H2 test database | 2.3.232 | Resolved Maven dependency tree |
