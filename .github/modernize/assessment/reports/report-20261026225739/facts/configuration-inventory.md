# Configuration & Externalized Settings Inventory

Configuration is defined by three Spring properties files, Maven settings, a two-stage Dockerfile, Compose environment bindings, and Oracle startup scripts. Two named runtime profiles are evidenced; deployment secrets are supplied through environment variables rather than a configured remote secret store.

## Configuration Sources

Paths and line references below are relative to the repository root. Generated `target/` copies are not treated as independent configuration sources.

| Source | Type | Path/Location | Notes |
|---|---|---|---|
| Base application settings | Spring properties | `src/main/resources/application.properties:1-34` | Default configuration; required datasource password placeholder. |
| Docker overrides | Spring profile properties | `src/main/resources/application-docker.properties:1-32` | Overrides database host and logging; repeats several base settings. |
| Test overrides | Spring profile properties | `src/test/resources/application-test.properties:1-23` | H2 settings and masked test-only admin credential. |
| Build configuration | Maven XML | `pom.xml:8-110` | Parent/BOM, compiler properties, dependencies, packaging plugin; no Maven profiles. |
| Container build/startup | Dockerfile | `Dockerfile:1-31` | Build/runtime images, exposed port, JVM options and entrypoint. |
| Service configuration | Compose YAML | `docker-compose.yml:1-53` | Environment injection, network, volume, ports, database health check and startup dependency. |
| Local secret template | Environment template | `.env.example:1-17` | Documents required password inputs; all password samples are masked in this inventory. Compose reads local `.env`; a standalone JVM is not shown loading it. |
| Oracle initialization | Shell | `oracle-init/01-create-user.sh:11-50`; `oracle-init/create-user.sh:9-45` | Both read required environment credentials and default the schema username; mounted into Oracle startup directory. |
| Oracle verification | SQL | `oracle-init/02-verify-user.sql:1-14`; `oracle-init/healthcheck.sql:1-3` | Verification uses fixed `PHOTOALBUM`, not configurable `APP_USER`; Compose uses its own inline health-check SQL rather than this SQL file. |
| Security bean settings | Java `@Value` | `src/main/java/com/photoalbum/config/SecurityConfig.java:28-42` | Admin username fallback and required password. |
| Upload settings consumers | Java `@Value` | `src/main/java/com/photoalbum/service/impl/PhotoServiceImpl.java` | Injects maximum file size as `long` and MIME types as `String[]`. |
| Secret exclusion policy | Git ignore | `.gitignore:201-204` | Ignores `.env` and `.env.*`, except `.env.example`. |
| Operator guidance | Markdown, not active runtime config | `README.md:48-54,274-295`; `WORKSHOP_SETUP_GUIDE.md`, Step 11 | README describes prospective Azure resources; setup guide supplies an optional external Maven settings mirror configuration. |

No application/bootstrap YAML, bootstrap properties, Spring Cloud Config repository, Kubernetes manifests, ConfigMaps, or remote configuration/secret-store integration was found in the application configuration. Azure Key Vault and managed identity in the README describe a future deployment option, not current bindings.

## Build Profiles

| Profile | Activation | Purpose | Key Dependencies/Plugins |
|---|---|---|---|
| Default Maven build (not a named profile) | Normal Maven invocation | Java 21 JAR build | Spring Boot Maven plugin; Web, Thymeleaf, Data JPA, Validation, Security and JSON starters; runtime Oracle JDBC; Commons IO; optional DevTools; test-scoped Boot test starter and H2. |
| Docker build procedure (not a Maven profile) | Compose build or Dockerfile build | Package application inside build image | `mvn dependency:go-offline -B`, then `mvn clean package -DskipTests`. |

`pom.xml` contains no `<profiles>` or profile activation conditions. H2/test dependencies are scoped to Maven tests, not activated by a build profile. Evidence: `pom.xml:23-110`; `Dockerfile:6-14`.

Build properties: `java.version=21`, `maven.compiler.source=21`, `maven.compiler.target=21`, `project.build.sourceEncoding=UTF-8` (`pom.xml:23-28`). Artifact coordinates are `com.photoalbum:photo-album:1.0.0`, packaging `jar` (`pom.xml:15-18`).

## Runtime Profiles

| Profile | Activation Method | Config Files | Key Overrides |
|---|---|---|---|
| Default/base | No explicit active profile in base file | `src/main/resources/application.properties` | Localhost Oracle URL, DEBUG application/web logging. |
| `docker` | Compose sets `SPRING_PROFILES_ACTIVE=docker` | Base plus `application-docker.properties` | Oracle service hostname; application INFO, web WARN, Hibernate SQL DEBUG. |
| `test` | `@ActiveProfiles("test")` in `src/test/java/com/photoalbum/PhotoAlbumApplicationTests.java` | Base plus test-classpath `application-test.properties` | H2 URL/driver/dialect; schema mode `create-drop`; SQL logging false; test admin settings. |

No `@Profile` beans, combined profile activation, profile groups, or dev/prod-specific files were found in `src`. The test file does not replace the base file wholesale: settings it does not override remain inherited.

## Properties Inventory

### Application module

Values below are declared file values or Java injection defaults, not observations of a running environment. `base`, `docker`, and `test` refer to the files listed above. Password values, including test samples, are always `[MASKED]`.

| Property Key | Default | Profiles | Source |
|---|---|---|---|
| `server.port` | `8080` (integer TCP port) | Base; repeated docker | Base:2; docker:25 |
| `server.servlet.encoding.charset` | `UTF-8` (string) | Base; repeated docker | Base:5; docker:9 |
| `server.servlet.encoding.enabled` | `true` (boolean) | Base; repeated docker | Base:6; docker:10 |
| `server.servlet.encoding.force` | `true` (boolean) | Base; repeated docker | Base:7; docker:11 |
| `spring.datasource.url` | `${SPRING_DATASOURCE_URL:jdbc:oracle:thin:@localhost:1521:XE}` | Docker fallback: `jdbc:oracle:thin:@oracle-db:1521:XE`; test literal: `jdbc:h2:mem:testdb` | Base:12; docker:3; test:2 |
| `spring.datasource.username` | `${SPRING_DATASOURCE_USERNAME:photoalbum}` (string) | Repeated docker; test: `sa` | Base:13; docker:4; test:4 |
| `spring.datasource.password` | Required `${SPRING_DATASOURCE_PASSWORD}`; value `[MASKED]` | Base/docker; test explicit empty setting, value masked | Base:14; docker:5; test:5 |
| `spring.datasource.driver-class-name` | `oracle.jdbc.OracleDriver` | Repeated docker; test: `org.h2.Driver` | Base:15; docker:6; test:3 |
| `spring.jpa.database-platform` | `org.hibernate.dialect.OracleDialect` | Repeated docker; test: `org.hibernate.dialect.H2Dialect` | Base:18; docker:14; test:8 |
| `spring.jpa.hibernate.ddl-auto` | `create` (enum string) | Repeated docker; test: `create-drop` | Base:19; docker:15; test:9 |
| `spring.jpa.show-sql` | `true` (boolean) | Repeated docker; test: `false` | Base:20; docker:16; test:10 |
| `spring.jpa.properties.hibernate.format_sql` | `true` (boolean) | Base; repeated docker; inherited test | Base:21; docker:17 |
| `spring.servlet.multipart.max-file-size` | `10MB` (data size) | Base; repeated docker | Base:24; docker:26 |
| `spring.servlet.multipart.max-request-size` | `50MB` (data size) | Base; repeated docker | Base:25; docker:27 |
| `app.file-upload.max-file-size-bytes` | `10485760` (`long`, bytes) | Same in base/docker/test | Base:28; docker:20; test:14 |
| `app.file-upload.allowed-mime-types` | `image/jpeg,image/png,image/gif,image/webp` (`String[]` on injection) | Same in base/docker/test | Base:29; docker:21; test:15 |
| `app.file-upload.max-files-per-upload` | `10` (integer-like configuration) | Same in base/docker/test | Base:30; docker:22; test:16 |
| `app.file-upload.upload-path` | No base declaration; test: `target/test-uploads` (path string) | Test only; no Java property consumer found | Test:13 |
| `logging.level.com.photoalbum` | `DEBUG` (log-level string) | Docker: `INFO`; test: `DEBUG` | Base:33; docker:30; test:19 |
| `logging.level.org.springframework.web` | `DEBUG` (log-level string) | Docker: `WARN`; inherited test | Base:34; docker:31 |
| `logging.level.org.hibernate.SQL` | Not explicitly set in base | Docker: `DEBUG` | Docker:32 |
| `app.admin.username` | `admin` (Java injection fallback) | Compose: `${APP_ADMIN_USERNAME:-admin}` via environment; test: `admin` | `SecurityConfig.java:36`; Compose:37; test:22 |
| `app.admin.password` | Required; no Java fallback; value `[MASKED]` | Compose supplies `APP_ADMIN_PASSWORD`; test literal `[MASKED]` | `SecurityConfig.java:37`; Compose:38; test:23 |

Only the maximum-byte-size and MIME-type custom upload keys have Java `@Value` consumers in the inspected source; no consumer was found for `max-files-per-upload`. Numeric application-specific bounds are not declared in the property files.

### Compose and Oracle environment inputs

| Property Key | Default | Profiles | Source |
|---|---|---|---|
| `ORACLE_PASSWORD` → Oracle `ORACLE_PWD` | Required nonempty; `[MASKED]` | Compose | `.env.example:5-6`; Compose:7 |
| `ORACLE_CHARACTERSET` | `AL32UTF8` | Oracle container | Compose:8 |
| `APP_USER` | `photoalbum` | Oracle and application datasource username | Compose:9,35; Oracle scripts default the same value and uppercase it for SQL |
| `APP_USER_PASSWORD` | Required nonempty; `[MASKED]` | Oracle user creation and app datasource password | Compose:10,36 |
| `APP_ADMIN_USERNAME` | `admin` | Application container | Compose:37 |
| `APP_ADMIN_PASSWORD` | Required nonempty; `[MASKED]` | Application container | Compose:38 |

Resolution chain: operator shell/local `.env` → Compose interpolation (`:-` fallback or `:?` required-nonempty check) → container environment → Spring environment/property resolution. Spring loads base properties plus active-profile overrides; environment variables can override file properties, and datasource placeholders explicitly reference the corresponding environment names. Admin environment variables resolve to `app.admin.*` through Spring environment naming conventions. Standard command-line/external configuration remains framework-supported but no repository-specific external location is configured. Do not assume a standalone JVM imports `.env`.

## Startup Parameters & Resource Requirements

| Service | JVM/Runtime Options | Memory | Instance Count |
|---|---|---|---|
| `photoalbum-java-app` | `sh -c "java $JAVA_OPTS -jar app.jar"`; `JAVA_OPTS="-Xmx512m -Xms256m"`; `SPRING_PROFILES_ACTIVE=docker`; datasource and admin environment variables from Compose | Heap initial 256 MiB / maximum 512 MiB; container memory and CPU requests/limits not declared | One service/container definition; no replicas or autoscaling declared |
| `oracle-db` | Oracle XE image; environment inputs above; ports `1521:1521`, `5500:5500` | No explicit memory/CPU allocation in Compose | One service/container definition; no scaling declared |

Application image exposes port 8080 and Compose publishes `8080:8080`. No runtime `-D` system properties are specified. The Dockerfile's `-DskipTests` is a build option, not a JVM runtime option. Heap maximum is not a total container-memory limit. Evidence: `Dockerfile:14,25-31`; `docker-compose.yml:3-46`.

Oracle persistence is the named `oracle_data` volume mounted at `/opt/oracle/oradata`; startup scripts mount at `/opt/oracle/scripts/startup`. Both services join the bridge `photoalbum-network` (`docker-compose.yml:14-18,44-53`).

## Startup Dependency Chain

1. Compose resolves required secret inputs before starting containers; missing/empty required values fail interpolation (`docker-compose.yml:7,10,36,38`).
2. `oracle-db` → Oracle initialization and mounted startup scripts. Both shell scripts require `ORACLE_PWD` and `APP_USER_PASSWORD`; `create-user.sh:15-17` additionally sleeps 30 seconds. Scripts create the configured application user if absent; the numbered script also applies grants to an existing user.
3. `photoalbum-java-app` → waits for → `oracle-db`, using Compose `depends_on: condition: service_healthy` (`docker-compose.yml:41-43`). The check invokes SQL*Plus with the application credentials against local Oracle XE and issues a simple query; interval 30 seconds, timeout 10 seconds, retries 15, start period 180 seconds (`docker-compose.yml:19-24`).
4. Application startup requires the datasource configuration and `app.admin.password` resolution. Application restart policy is `on-failure`; no application container health check, custom startup timeout, readiness probe, config-server retry, or discovery dependency is declared.

The Oracle shell scripts do not explicitly enable SQL*Plus `WHENEVER SQLERROR EXIT`, and the Compose check relies on the SQL*Plus process exit status. These configured checks therefore should not be represented as proof that all SQL failures reliably block readiness. No running-service readiness was verified.

## Secrets & Sensitive Configuration

| Secret Reference | Type | Storage (masked) |
|---|---|---|
| `ORACLE_PASSWORD` → `ORACLE_PWD` | Oracle administrator password | Operator shell/local ignored `.env`; template value `[MASKED]`; injected into Oracle container |
| `APP_USER_PASSWORD` | Application database user password | Operator shell/local `.env`; template `[MASKED]`; injected into Oracle and application containers |
| `SPRING_DATASOURCE_PASSWORD` → `spring.datasource.password` | JDBC password | Required environment placeholder; `[MASKED]`; test file has an explicit empty setting |
| `APP_ADMIN_PASSWORD` → `app.admin.password` | Application admin password | Operator shell/local `.env`; template `[MASKED]`; checked-in test-only sample `[MASKED]` |
| SQL*Plus connection arguments | Credential-bearing connection strings | Password references expanded from environment at execution; actual values not reproduced |

Usernames are configuration identifiers, not password values. No API keys, encrypted property syntax, Vault paths, Key Vault URI bindings, Jasypt configuration, sealed secrets, or managed-identity/RBAC configuration was found in current application/deployment sources.

### Secrets Provisioning Workflow

1. Operator copies `.env.example` to ignored `.env` and supplies unique passwords, or exports equivalent shell variables (`.env.example:1-17`; `.gitignore:201-204`). All sample passwords are deliberately omitted here.
2. Compose checks required values and maps the Oracle administrator password to `ORACLE_PWD`; the schema password is shared between Oracle startup scripts and Spring datasource configuration.
3. Oracle scripts authenticate as `SYSTEM`, create the configured schema user when absent, and grant database privileges. This is password-based database administration, not cloud identity or secret-vault provisioning (`oracle-init/01-create-user.sh:19-43`).
4. Application receives the schema credential and independent admin credential. `SecurityConfig.java:28-42` BCrypt-encodes the configured admin password into an in-memory user store; this is not encryption of the source `.env` or container environment.
5. Test resources supply separate test-only settings with masked credentials. No automated rotation or secret retrieval pipeline is evidenced. README Azure Key Vault/managed identity examples are prospective instructions, not implemented secret flows.

## Feature Flags

| Flag Name | Default | Controlled By |
|---|---|---|
| No dedicated business feature flags found | Not applicable | No feature-management dependency, `@ConditionalOnProperty`, or `@ConditionalOnExpression` found in the inspected POM and Java source |
| Operational switches, not business feature flags | Encoding enabled/forced `true`; SQL logging `true` (`false` in test); SQL formatting `true` | Properties inventory above and normal Spring environment overrides |

Security configuration is an unconditional `@Configuration` class; no profile- or property-driven security enable/disable flag is declared.

## Framework & Runtime Versions

| Component | Version | Source |
|---|---|---|
| Application artifact | `1.0.0` | `pom.xml:15-18` |
| Spring Boot parent | `3.5.0` | `pom.xml:8-13` |
| Java source/target | `21` | `pom.xml:23-26` |
| Container build image / Maven | `maven:3.9.9-eclipse-temurin-21` / Maven `3.9.9` | `Dockerfile:2` |
| Container runtime image | `eclipse-temurin:21-jre` | `Dockerfile:17`; patch release/digest not pinned |
| Oracle container | `container-registry.oracle.com/database/express:21.3.0-xe` | `docker-compose.yml:4` |
| Commons IO | `2.14.0` | `pom.xml:68-73` |
| Spring Framework, Spring Security, Thymeleaf, Hibernate, embedded servlet container | Inherited from Spring Boot dependency management; exact resolved versions not explicitly declared locally | Boot starters in `pom.xml:30-85` |
| Oracle JDBC `ojdbc8`, H2, DevTools, Boot Maven plugin | Version inherited from Spring Boot parent; not explicitly pinned locally | `pom.xml:49-54,88-108` |
| Developer tool requirements | JDK 21 or higher; Maven 3.8.0 or higher; setup guide uses Maven 3.9.x | `README.md:48-54`; `WORKSHOP_SETUP_GUIDE.md`, Step 3 |
| Optional operator Maven mirrors | `https://maven.aliyun.com/repository/public`; `https://maven.aliyun.com/repository/spring` | `WORKSHOP_SETUP_GUIDE.md`, Step 11; instructions for external Maven settings, not repository-enforced settings |

No Maven wrapper or local dependency lock was found. Resolved dependency versions and installed tool versions were not inferred or executed. This is a static, evidence-based inventory; no builds, tests, or deployment validation were run.
