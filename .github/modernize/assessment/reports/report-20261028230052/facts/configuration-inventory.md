# Configuration & Externalized Settings Inventory

Configuration spans three Spring property files, a Maven build, Docker image/Compose definitions, an environment template, and four Oracle startup/verification scripts. There are two named runtime profiles and no Maven build profiles; credentials flow through environment variables, with literal test credentials and username defaults masked below.

## Configuration Sources

| Source | Type | Path/Location | Notes |
|---|---|---|---|
| Base application settings | Spring properties | `src/main/resources/application.properties` | Always loaded; environment placeholders for Oracle connection settings. |
| Docker overrides | Spring profile properties | `src/main/resources/application-docker.properties` | Loaded with `docker`; overlays the base file. |
| Test overrides | Spring profile properties | `src/test/resources/application-test.properties` | Loaded with `test`; test classpath only. |
| Build definition | Maven XML | `pom.xml` | Java/compiler settings, dependencies, packaging and plugin. |
| Container image | Dockerfile | `Dockerfile` | Build/runtime images, JVM options and entrypoint. |
| Service deployment | Compose YAML | `docker-compose.yml` | Environment bindings, ports, network, volume, dependency health gate. |
| Environment template | dotenv example | `.env.example` | Instructions to copy to `.env`; credential examples are not suitable for deployment. No `.env` file discovered. |
| Local secret exclusion | Git ignore rules | `.gitignore:201–204` | Ignores `.env` and `.env.*`, except `.env.example`. |
| Database initialization | Shell | `oracle-init/01-create-user.sh`, `oracle-init/create-user.sh` | Environment-driven schema setup; latter script also sleeps 30 seconds. |
| Database verification | SQL | `oracle-init/02-verify-user.sql` | Checks a fixed schema username `[MASKED]`, not an environment-derived username. |
| Database probe script | SQL | `oracle-init/healthcheck.sql` | `SELECT 1 FROM DUAL`; Compose instead embeds its own SQL probe. |
| Setup instructions | Documentation | `README.md`, `WORKSHOP_SETUP_GUIDE.md`, `WORKSHOP_PREPARATION.md` | Local startup/tool prerequisites and prospective Azure workshop steps; not deployed Azure configuration. |

No application `bootstrap.*`, external configuration repository, Spring Cloud Config, Consul, remote secret store, Kubernetes manifest, or application CI/CD workflow was discovered. Assessment/skill metadata is not an application runtime configuration source; `.github/agents` was excluded.

## Build Profiles

| Profile | Activation | Purpose | Key Dependencies/Plugins |
|---|---|---|---|
| No named profiles | Ordinary Maven invocation; no `<profiles>` in `pom.xml` | Packages `com.photoalbum:photo-album:1.0.0` as a JAR | Spring Boot Maven plugin; web, Thymeleaf, Data JPA, validation, security and JSON starters; runtime Oracle JDBC; Commons IO; optional DevTools; test starter and H2 in test scope. |
| Docker build mode, not a Maven profile | Docker build invokes `mvn clean package -DskipTests` | Packages without executing tests | Same dependencies/plugins; preceding `mvn dependency:go-offline -B` resolves dependencies. |

Build properties: `java.version=21`, `maven.compiler.source=21`, `maven.compiler.target=21`, `project.build.sourceEncoding=UTF-8` (`pom.xml:23–28`). `-DskipTests` is a build-time system property, not a runtime profile.

## Runtime Profiles

| Profile | Activation Method | Config Files | Key Overrides |
|---|---|---|---|
| Default/base | No explicit active profile | `application.properties` | Local Oracle URL; debug application/web logging. No `spring.profiles.active` setting in this file. |
| `docker` | Compose sets `SPRING_PROFILES_ACTIVE=docker` | Base plus `application-docker.properties` | Oracle hostname `oracle-db`; application logging `INFO`, web logging `WARN`, Hibernate SQL logging `DEBUG`. |
| `test` | `@ActiveProfiles("test")` in `src/test/java/com/photoalbum/PhotoAlbumApplicationTests.java:8` | Base plus test-classpath `application-test.properties` | H2 URL/driver/dialect, `create-drop`, SQL logging disabled, test-only admin credentials and upload path. |

No `@Profile` beans or combined active-profile configuration was found. Spring supports multiple profiles, but the repository configures only the single-profile activations above.

## Properties Inventory

### Single application module

Types and units are included with defaults where inferable. `base`, `docker`, and `test` below refer to the three property files listed above. `[MASKED]` covers credential literals, including usernames and defaults.

| Property Key | Default | Profiles | Source |
|---|---|---|---|
| `server.port` | `8080` (integer TCP port, 1–65535) | Base; docker repeats | Base:2; docker:25 |
| `server.servlet.encoding.charset` | `UTF-8` (charset) | Base; docker repeats | Base:5; docker:9 |
| `server.servlet.encoding.enabled` | `true` (boolean) | Base; docker repeats | Base:6; docker:10 |
| `server.servlet.encoding.force` | `true` (boolean) | Base; docker repeats | Base:7; docker:11 |
| `spring.datasource.url` | `${SPRING_DATASOURCE_URL:jdbc:oracle:thin:@localhost:1521:XE}` (JDBC string) | Docker fallback: `jdbc:oracle:thin:@oracle-db:1521:XE`; test: `jdbc:h2:mem:testdb` | Base:12; docker:3; test:2 |
| `spring.datasource.username` | `${SPRING_DATASOURCE_USERNAME:[MASKED]}` (string) | Docker repeats reference/default; test literal `[MASKED]` | Base:13; docker:4; test:4 |
| `spring.datasource.password` | `${SPRING_DATASOURCE_PASSWORD}`; required, no fallback | Docker repeats; test empty string `[MASKED]` | Base:14; docker:5; test:5 |
| `spring.datasource.driver-class-name` | `oracle.jdbc.OracleDriver` (class name) | Docker repeats; test `org.h2.Driver` | Base:15; docker:6; test:3 |
| `spring.jpa.database-platform` | `org.hibernate.dialect.OracleDialect` (class name) | Docker repeats; test `org.hibernate.dialect.H2Dialect` | Base:18; docker:14; test:8 |
| `spring.jpa.hibernate.ddl-auto` | `create` (enum string) | Docker repeats; test `create-drop` | Base:19; docker:15; test:9 |
| `spring.jpa.show-sql` | `true` (boolean) | Docker repeats; test `false` | Base:20; docker:16; test:10 |
| `spring.jpa.properties.hibernate.format_sql` | `true` (boolean) | Docker repeats; test inherits base | Base:21; docker:17 |
| `spring.servlet.multipart.max-file-size` | `10MB` (data size) | Docker repeats; test inherits base | Base:24; docker:26 |
| `spring.servlet.multipart.max-request-size` | `50MB` (data size) | Docker repeats; test inherits base | Base:25; docker:27 |
| `app.file-upload.max-file-size-bytes` | `10485760` (long, bytes) | Same in all three | Base:28; docker:20; test:14; `PhotoServiceImpl.java:42` |
| `app.file-upload.allowed-mime-types` | `image/jpeg,image/png,image/gif,image/webp` (comma-separated string array) | Same in all three | Base:29; docker:21; test:15; `PhotoServiceImpl.java:43` |
| `app.file-upload.max-files-per-upload` | `10` (integer) | Same in all three | Base:30; docker:22; test:16 |
| `app.file-upload.upload-path` | Not configured in base | Test `target/test-uploads` (path string) | Test:13; no Java configuration binding found |
| `logging.level.com.photoalbum` | `DEBUG` (logging level) | Docker `INFO`; test `DEBUG` | Base:33; docker:30; test:19 |
| `logging.level.org.springframework.web` | `DEBUG` (logging level) | Docker `WARN`; test inherits base | Base:34; docker:31 |
| `logging.level.org.hibernate.SQL` | Not explicitly configured in base | Docker `DEBUG` | Docker:32 |
| `app.admin.username` | `[MASKED]` (string fallback in `@Value`) | Compose supplies `APP_ADMIN_USERNAME`; test literal `[MASKED]` | `SecurityConfig.java:36`; Compose:37; test:22 |
| `app.admin.password` | Required; no fallback | Compose supplies `APP_ADMIN_PASSWORD`; test literal `[MASKED]` | `SecurityConfig.java:37`; Compose:38; test:23 |

The inventory contains 23 distinct runtime property keys. No additional application `System.getenv`, `System.getProperty`, or `@ConfigurationProperties` bindings were found. No explicit numeric configuration ranges are declared beyond inferable types/units.

### Compose and Oracle environment settings

| Property Key | Default | Profiles | Source |
|---|---|---|---|
| `ORACLE_PWD` | Required from `${ORACLE_PASSWORD:?...}`; value `[MASKED]` | Compose Oracle container | `docker-compose.yml:7`; `.env.example`; initialization scripts |
| `ORACLE_CHARACTERSET` | `AL32UTF8` (charset string) | Compose Oracle container | `docker-compose.yml:8` |
| `APP_USER` | `[MASKED]` (username fallback) | Compose Oracle container; both initialization scripts also have a fallback | `docker-compose.yml:9`; `.env.example`; shell scripts |
| `APP_USER_PASSWORD` | Required; value `[MASKED]` | Oracle initialization and application datasource binding | `docker-compose.yml:10,36`; `.env.example`; shell scripts |
| `SPRING_DATASOURCE_URL` | `jdbc:oracle:thin:@oracle-db:1521:XE` | Compose application container | `docker-compose.yml:34` |
| `SPRING_DATASOURCE_USERNAME` | `${APP_USER:-[MASKED]}` | Compose application container | `docker-compose.yml:35` |
| `SPRING_DATASOURCE_PASSWORD` | Required from `APP_USER_PASSWORD`; value `[MASKED]` | Compose application container | `docker-compose.yml:36` |
| `APP_ADMIN_USERNAME` | `[MASKED]` (username fallback) | Compose application container | `docker-compose.yml:37`; `.env.example` |
| `APP_ADMIN_PASSWORD` | Required; value `[MASKED]` | Compose application container | `docker-compose.yml:38`; `.env.example` |

Resolution chain: operator shell/Compose `.env` interpolation → explicit container environment → Spring environment/property resolution → active-profile property file → base file. Java `@Value` defaults apply only where declared. Compose `.env` does not automatically configure a directly launched Java process. Test profile properties replace the matching base keys during tests; higher-precedence environment/command-line settings can still override Spring properties.

## Startup Parameters & Resource Requirements

| Service | JVM/Runtime Options | Memory | Instance Count |
|---|---|---|---|
| `photoalbum-java-app` | `java $JAVA_OPTS -jar app.jar`; Docker default `JAVA_OPTS="-Xmx512m -Xms256m"`; Compose `SPRING_PROFILES_ACTIVE=docker` plus environment bindings above | Initial heap 256 MiB; maximum heap 512 MiB. No container memory or CPU request/limit declared; heap is not total JVM/container memory. | No replicas/scaling setting; Compose starts one container per service by default. |
| `oracle-db` | Oracle Express image entrypoint; environment settings above; mounted startup scripts | No memory or CPU allocation declared | No replicas/scaling setting; Compose default one container. |
| Local/test JVM | No repository-pinned JVM heap or startup `-D` options | Not specified | Not specified |

Docker exposes application port `8080`; Compose publishes `8080:8080`, Oracle `1521:1521` and `5500:5500`. The bridge network is `photoalbum-network`; `oracle_data` persists `/opt/oracle/oradata`. No application health check, cloud instance sizing, autoscaling configuration, or JVM-to-container memory budget is provided. Workshop setup documents Java 21 and Maven 3.9.x; `JAVA_HOME` is a developer tool setting, not a Compose variable.

## Startup Dependency Chain

1. Operator-provided environment → Compose interpolation: required Oracle/application/admin passwords must be present before service creation.
2. `oracle-db` → Oracle startup and schema initialization: `./oracle-init` mounts at `/opt/oracle/scripts/startup`. Both shell scripts use `set -euo pipefail`, require password variables, and create the schema if missing. `create-user.sh` adds a fixed 30-second delay. `02-verify-user.sql` checks a fixed masked username, which may not match an overridden `APP_USER`.
3. Oracle readiness → application-schema SQL connection: Compose pipes `SELECT 1 FROM DUAL;` to `sqlplus -s` using `APP_USER`/`APP_USER_PASSWORD` against local Oracle port 1521/service XE. Interval `30s`, timeout `10s`, retries `15`, start period `180s`; these are configured probe timings, not a guaranteed startup deadline. The standalone `healthcheck.sql` is not referenced by this probe.
4. `photoalbum-java-app` → waits for → healthy `oracle-db`: Compose `depends_on.oracle-db.condition=service_healthy`; app restart policy `on-failure`. The database credentials/schema and required admin password are startup dependencies.

No config/discovery server, application readiness probe, additional wait utility, Spring Cloud Config retry, or explicit application startup timeout was found. The Oracle health gate is startup ordering, not continuous application dependency supervision.

## Secrets & Sensitive Configuration

| Secret Reference | Type | Storage (masked) |
|---|---|---|
| `ORACLE_PASSWORD` → `ORACLE_PWD` | Oracle administrative password | Operator shell or local `.env`; example value `[MASKED]`; injected into Oracle container. |
| `APP_USER` → `SPRING_DATASOURCE_USERNAME` | Application database username | Template, Compose/script/property defaults `[MASKED]`; environment override supported. |
| `APP_USER_PASSWORD` → `SPRING_DATASOURCE_PASSWORD` | Application database password | Required Compose interpolation and shell variables; template `[MASKED]`; no production fallback. |
| `APP_ADMIN_USERNAME` → `app.admin.username` | Application administrator username | Environment/template and Java/Compose defaults `[MASKED]`. |
| `APP_ADMIN_PASSWORD` → `app.admin.password` | Application administrator password | Required environment/property binding; template `[MASKED]`. |
| Test datasource/admin properties | Test credentials | Literal username/password settings in `application-test.properties` are `[MASKED]`, including the empty datasource password. |
| Fixed username in `02-verify-user.sql` | Schema identifier | Literal `[MASKED]`; not dynamically substituted. |

### Secrets Provisioning Workflow

Operator copies `.env.example` to ignored `.env`, replaces placeholders, and supplies required values → Compose passes the database administrator password and schema credentials into Oracle → startup shell scripts authenticate as Oracle's administrative account and create/configure the application schema → Compose binds the same schema password to Spring datasource settings and injects separate admin credentials into the application.

`01-create-user.sh` grants schema-creation/session privileges, including table, sequence, view, procedure, trigger, type and synonym creation, and tablespace quota; it deliberately avoids DBA/system-wide ANY grants. The other shell script creates a missing user with session/table/sequence privileges. Neither script updates an existing user's password, so changing environment values alone does not rotate credentials already persisted in `oracle_data`.

The SQL health probe uses application schema credentials. `SecurityConfig` BCrypt-encodes the injected application admin password when constructing its in-memory user. This is password hashing, not encryption of `.env`, configuration files, or container environment values. No managed identity, service principal, RBAC-based external secret access, Key Vault/Vault integration, encrypted properties, sealed secrets, or implemented CI secret-provisioning workflow was found.

## Feature Flags

| Flag Name | Default | Controlled By |
|---|---|---|
| No dedicated application feature flags discovered | Not applicable | No feature-flag SDK, `@ConditionalOnProperty`, or `@ConditionalOnExpression` found. |
| `server.servlet.encoding.enabled` / `.force` | `true` / `true` | Base/docker properties; framework configuration switches, not business feature flags. |
| `spring.jpa.show-sql` / `spring.jpa.properties.hibernate.format_sql` | `true` / `true`; test show-sql `false` | Spring profile properties; diagnostic switches. |

No A/B testing or gradual-rollout configuration was found. Runtime profiles select environment configuration, not feature rollout cohorts.

## Framework & Runtime Versions

| Component | Version | Source |
|---|---|---|
| Application artifact | `1.0.0` | `pom.xml:15–18` |
| Java target/compiler source/compiler target | `21` | `pom.xml:23–28` |
| Spring Boot parent and managed starter family | `3.5.0` | `pom.xml:8–13` |
| Spring Boot Maven plugin | Parent-managed; no local override | `pom.xml:103–110` |
| Spring Framework, Spring Security, Thymeleaf, Hibernate ORM, embedded servlet container | Spring Boot `3.5.0` dependency management; individual versions not locally pinned/verified | Starter dependencies in `pom.xml` |
| Oracle JDBC `ojdbc8` | Parent-managed; no explicit local version | `pom.xml:49–54` |
| Commons IO | `2.14.0` | `pom.xml:68–73` |
| H2, Spring Boot test starter, DevTools | Parent-managed; no explicit local overrides | `pom.xml:81–100` |
| Docker build image | `maven:3.9.9-eclipse-temurin-21` | `Dockerfile:2` |
| Docker runtime image | `eclipse-temurin:21-jre` | `Dockerfile:17`; no digest or Java patch pin |
| Oracle Express image | `container-registry.oracle.com/database/express:21.3.0-xe` | `docker-compose.yml:4` |
| Maven | Container `3.9.9`; workstation guide `3.9.x` | Dockerfile and `WORKSHOP_SETUP_GUIDE.md`; no Maven wrapper found |
| Docker Engine / Compose | Not pinned | Compose file has no version field; no engine version declaration found |

> Note: Some configuration sources or properties could not be fully identified. This is a static repository inventory: operator environments, external Maven settings, resolved transitive dependency versions, actual image contents, and deployed resources were not inspected.
