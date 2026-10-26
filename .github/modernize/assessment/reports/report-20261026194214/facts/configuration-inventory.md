# Configuration & Externalized Settings Inventory

The inspected project has three application property files, a Compose definition and an environment-variable example, plus build/container and schema-initialization configuration. Default, docker and test settings are distinct; secret values are omitted throughout.

Evidence paths resolve against `/home/runner/work/PhotoAlbum-Java-Lite/PhotoAlbum-Java-Lite/`. This is a static inventory; no environment secret file was read and no deployment was executed.

## Configuration Sources

| Source | Type | Path/Location | Notes |
|---|---|---|---|
| Default settings | Spring properties | src/main/resources/application.properties | Base configuration |
| Docker overrides | Spring profile properties | src/main/resources/application-docker.properties | Selected by Compose |
| Test overrides | Test classpath properties | src/test/resources/application-test.properties | Selected by test annotation |
| Container composition | YAML | docker-compose.yml | Database/app environments, ports, volume, network and startup dependency |
| Environment template | dotenv example | .env.example | Placeholder-only secret provisioning instructions; actual values masked here |
| Build | Maven XML | pom.xml | Parent, Java target, dependencies and packaging plugin |
| Container startup | Dockerfile | Dockerfile | Build/runtime images and JVM options |
| Schema initialization | Shell / SQL | oracle-init/01-create-user.sh; oracle-init/create-user.sh | Environment-based schema account setup; both mounted as startup scripts |
| Security bean inputs | Spring Value injection | src/main/java/com/photoalbum/config/SecurityConfig.java:33-42 | Admin username/password resolved from properties/environment |
| Upload bean inputs | Spring Value injection | src/main/java/com/photoalbum/service/impl/PhotoServiceImpl.java:40-46 | Two validation settings consumed |

No bootstrap configuration, external configuration repository, Spring Cloud Config, Vault, Key Vault, remote feature provider or Kubernetes/Helm configuration was found among the inspected application/deployment files. Assessment artifacts are not runtime configuration.

## Build Profiles

| Profile | Activation | Purpose | Key Dependencies/Plugins |
|---|---|---|---|
| No Maven profiles declared | Default Maven build | Java 21 executable JAR | Spring Boot parent 3.5.0 and spring-boot-maven-plugin |
| Docker image stages, not Maven profiles | Docker build | Maven dependency prefetch then package with tests skipped | Build image Maven 3.9.9 / Temurin 21; runtime Temurin 21 JRE |

Evidence: `pom.xml:8-28,103-110`; `Dockerfile:1-22`. No Maven wrapper/version pin is declared by the tracked build files inspected.

## Runtime Profiles

| Profile | Activation Method | Config Files | Key Overrides |
|---|---|---|---|
| Default/base | No active profile specified for direct launch | application.properties | Localhost Oracle; DEBUG app/web logging |
| docker | Compose `SPRING_PROFILES_ACTIVE=docker` | Base plus application-docker.properties | Oracle hostname, INFO/WARN logging, Hibernate SQL DEBUG |
| test | `@ActiveProfiles("test")` in context test | Base plus application-test.properties on test classpath | H2, create-drop, SQL logging off, test admin settings |

Multiple Spring profiles can be selected by the framework, but no combined-profile configuration or `@Profile` bean split is implemented here. Evidence: `docker-compose.yml:32-38`; `src/test/java/com/photoalbum/PhotoAlbumApplicationTests.java:5-11`.

## Properties Inventory

### Photo Album application properties

| Property Key | Default | Profiles | Source |
|---|---|---|---|
| server.port | 8080 (integer) | Base, docker repeats | application.properties:2; application-docker.properties:25 |
| server.servlet.encoding.charset | UTF-8 (string) | Base, docker repeats | application.properties:5; application-docker.properties:9 |
| server.servlet.encoding.enabled | true (Boolean) | Base, docker repeats | application.properties:6; application-docker.properties:10 |
| server.servlet.encoding.force | true (Boolean) | Base, docker repeats | application.properties:7; application-docker.properties:11 |
| spring.datasource.url | `${SPRING_DATASOURCE_URL:jdbc:oracle:thin:@localhost:1521:XE}` | docker fallback hostname oracle-db; test jdbc:h2:mem:testdb | application.properties:12; application-docker.properties:3; application-test.properties:2 |
| spring.datasource.username | `${SPRING_DATASOURCE_USERNAME:photoalbum}` | docker same; test username masked as credential metadata | application.properties:13; application-docker.properties:4; application-test.properties:4 |
| spring.datasource.password | `[MASKED]`; required SPRING_DATASOURCE_PASSWORD reference | Base/docker environment reference; test value masked | application.properties:14; application-docker.properties:5; application-test.properties:5 |
| spring.datasource.driver-class-name | oracle.jdbc.OracleDriver | docker same; test org.h2.Driver | application.properties:15; application-docker.properties:6; application-test.properties:3 |
| spring.jpa.database-platform | org.hibernate.dialect.OracleDialect | docker same; test org.hibernate.dialect.H2Dialect | application.properties:18; application-docker.properties:14; application-test.properties:8 |
| spring.jpa.hibernate.ddl-auto | create (enum) | docker create; test create-drop | application.properties:19; application-docker.properties:15; application-test.properties:9 |
| spring.jpa.show-sql | true (Boolean) | docker true; test false | application.properties:20; application-docker.properties:16; application-test.properties:10 |
| spring.jpa.properties.hibernate.format_sql | true (Boolean) | Base, docker repeats; inherited by test | application.properties:21; application-docker.properties:17 |
| spring.servlet.multipart.max-file-size | 10MB (data size) | Base, docker repeats | application.properties:24; application-docker.properties:26 |
| spring.servlet.multipart.max-request-size | 50MB (data size) | Base, docker repeats | application.properties:25; application-docker.properties:27 |
| app.file-upload.max-file-size-bytes | 10485760 (long) | Base/docker/test | application.properties:28; application-docker.properties:20; application-test.properties:14 |
| app.file-upload.allowed-mime-types | image/jpeg,image/png,image/gif,image/webp (list) | Base/docker/test | application.properties:29; application-docker.properties:21; application-test.properties:15 |
| app.file-upload.max-files-per-upload | 10 (integer) | Base/docker/test; no consumer found | application.properties:30; application-docker.properties:22; application-test.properties:16 |
| app.file-upload.upload-path | No base/docker value | Test: target/test-uploads; legacy, no consumer found | application-test.properties:13 |
| logging.level.com.photoalbum | DEBUG | docker INFO; test DEBUG | application.properties:33; application-docker.properties:30; application-test.properties:19 |
| logging.level.org.springframework.web | DEBUG | docker WARN; test inherits base | application.properties:34; application-docker.properties:31 |
| logging.level.org.hibernate.SQL | Framework default, not explicitly set in base | docker DEBUG | application-docker.properties:32 |
| app.admin.username | admin (String, bean default) | Compose APP_ADMIN_USERNAME default; test explicit | SecurityConfig.java:36; docker-compose.yml:37; application-test.properties:22 |
| app.admin.password | `[MASKED]`; required, no bean default | APP_ADMIN_PASSWORD environment binding; test value masked | SecurityConfig.java:37; docker-compose.yml:38; application-test.properties:23 |

Property-file references above are under `src/main/resources/` except `application-test.properties` under `src/test/resources/`; Java short names refer to the configuration/service files identified in Configuration Sources. Environment properties override packaged application settings through Spring resolution; active profile files override base settings. Direct launch must provide both database and admin password properties. Compose `.env` substitution and Spring environment resolution are separate stages.

`app.file-upload.upload-path` is a leftover test setting, not a filesystem persistence contract. The current service constructor consumes only max size and MIME types, then reads multipart bytes and saves them to the database (`src/main/java/com/photoalbum/service/impl/PhotoServiceImpl.java:40-46,116-166`). The max-files property is declared but not enforced by the inspected controller/service.

### Container and build settings

| Property Key | Default | Profiles | Source |
|---|---|---|---|
| ORACLE_CHARACTERSET | AL32UTF8 | Oracle container | docker-compose.yml:8 |
| ORACLE_PWD | `[MASKED]`, from required ORACLE_PASSWORD | Oracle container | docker-compose.yml:7 |
| APP_USER | photoalbum | Compose and initialization scripts | docker-compose.yml:9; oracle-init/01-create-user.sh:14 |
| APP_USER_PASSWORD | `[MASKED]`, required | Database container and app datasource binding | docker-compose.yml:10,36 |
| SPRING_DATASOURCE_URL | jdbc:oracle:thin:@oracle-db:1521:XE | App container | docker-compose.yml:34 |
| SPRING_DATASOURCE_USERNAME | APP_USER or photoalbum | App container | docker-compose.yml:35 |
| APP_ADMIN_USERNAME | admin | App container | docker-compose.yml:37 |
| APP_ADMIN_PASSWORD | `[MASKED]`, required | App container | docker-compose.yml:38 |
| java.version / maven.compiler.source / maven.compiler.target | 21 | Build | pom.xml:24-26 |
| project.build.sourceEncoding | UTF-8 | Build | pom.xml:27 |

## Startup Parameters & Resource Requirements

| Service | JVM/Runtime Options | Memory | Instance Count |
|---|---|---|---|
| photoalbum-java-app | `java $JAVA_OPTS -jar app.jar`; JAVA_OPTS defaults `-Xmx512m -Xms256m`; SPRING_PROFILES_ACTIVE=docker | Heap bounds only; no container memory/CPU request or limit | One declared container; no replicas/autoscaling policy |
| oracle-db | Vendor image startup; schema scripts mounted in startup directory | No memory/CPU allocation declared | One declared container |

No `-D` startup arguments are configured. App port mapping is 8080:8080; Oracle exposes 1521:1521 and 5500:5500. Named `oracle_data` mounts `/opt/oracle/oradata`; `./oracle-init` mounts `/opt/oracle/scripts/startup`. Network is a Compose bridge. The application restarts on failure; no readiness probe is declared for it.

Evidence: `Dockerfile:24-31`; `docker-compose.yml:11-24,32-53`.

## Startup Dependency Chain

1. Compose first validates required ORACLE_PASSWORD, APP_USER_PASSWORD and APP_ADMIN_PASSWORD substitutions.
2. Oracle container starts and runs mounted schema scripts using supplied credentials. One script includes a fixed 30-second sleep; both check whether the schema user exists (`oracle-init/create-user.sh:15-39`; `oracle-init/01-create-user.sh:22-43`).
3. Database health is checked with SQL `SELECT 1 FROM DUAL` via SQLPlus using the application schema account: 30-second interval, 10-second timeout, 15 retries, 180-second start period (`docker-compose.yml:19-24`). These are configured checks, not proof of actual readiness.
4. App waits on Compose `service_healthy` for Oracle, then starts with docker profile (`docker-compose.yml:41-46`). Outside Compose no explicit wait mechanism is configured; database/admin properties must be available at context creation.

No config-server/discovery chain, dockerize wrapper, application startup retry policy, Kubernetes readiness dependency or separately configured app startup timeout is present. Management route inventory belongs in [api-service-contracts.md](api-service-contracts.md).

## Secrets & Sensitive Configuration

| Secret Reference | Type | Storage (masked) |
|---|---|---|
| ORACLE_PASSWORD → ORACLE_PWD | Database administrator password | `[MASKED]`; external Compose environment / local ignored .env |
| APP_USER_PASSWORD → SPRING_DATASOURCE_PASSWORD | Schema/database password | `[MASKED]`; external environment |
| APP_ADMIN_PASSWORD → app.admin.password | HTTP admin password | `[MASKED]`; external environment, BCrypt encoding at bean creation |
| Test datasource/admin credential properties | Test-only credentials | `[MASKED]`; test resource file |

### Secrets Provisioning Workflow

Operator supplies values through the local environment or copies `.env.example` to ignored `.env` and replaces placeholders; Compose passes the database admin/schema credentials into Oracle and binds the schema password into the application datasource environment. Initialization connects as SYSTEM to create/check the schema user and applies schema-scoped grants; the app then connects as that user. Admin credentials feed the application's in-memory user service. No managed identity, service principal, cloud secret-store role, encryption wrapper, sealed secret or CI secret-fetch workflow is implemented in these files.

Evidence: `.env.example:1-17`; `.gitignore:202-204,252`; `docker-compose.yml:7-10,34-38`; `oracle-init/01-create-user.sh:19-43`; `src/main/java/com/photoalbum/config/SecurityConfig.java:28-42`. Environment variables are a delivery mechanism, not evidence of encryption at rest.

## Feature Flags

| Flag Name | Default | Controlled By |
|---|---|---|
| No business feature flags detected | N/A | No feature-management framework or conditional-property beans in inspected source |
| spring.jpa.show-sql and logging levels | As listed above | Profile properties; operational switches, not rollout flags |

## Framework & Runtime Versions

| Component | Version | Source |
|---|---|---|
| Application | 1.0.0 | pom.xml:17 |
| Spring Boot parent / plugin management | 3.5.0 | pom.xml:8-12,103-108 |
| Java compile target | 21 | pom.xml:24-26 |
| Container build tool and JDK | maven:3.9.9-eclipse-temurin-21 | Dockerfile:2 |
| Container runtime | eclipse-temurin:21-jre; patch not pinned | Dockerfile:17 |
| Oracle image | container-registry.oracle.com/database/express:21.3.0-xe | docker-compose.yml:4 |
| Commons IO | 2.14.0 | pom.xml:69-73 |
| Hibernate, Spring libraries, Oracle JDBC, H2 | Boot-managed; exact third-party versions not locally declared | pom.xml:30-100 |
| Bootstrap browser assets | 5.3.0 | src/main/resources/templates/index.html:7,124 |

Image tags are not immutable digest pins. Installed runtime versions were not interrogated; README migration targets are not treated as implemented configuration.
