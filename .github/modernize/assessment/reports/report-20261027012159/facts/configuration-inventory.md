# Configuration & Externalized Settings Inventory

Configuration is supplied by three Spring properties files, Maven and Docker definitions, an environment template, and Oracle startup scripts. Two named runtime profiles are present; deployment secrets are supplied through environment variables rather than an integrated secret store.

## Configuration Sources

| Source | Type | Path/Location | Notes |
|---|---|---|---|
| Base application settings | Spring properties | `src/main/resources/application.properties` | Shared settings and local Oracle URL fallback; database password must be supplied externally. |
| Docker settings | Spring profile properties | `src/main/resources/application-docker.properties` | Overrides base settings for `docker`; repeats most base properties. |
| Test settings | Spring profile properties | `src/test/resources/application-test.properties` | Test-classpath configuration for `test`; H2 and test-only credentials, all credential values redacted below. |
| Administrator settings | Java property injection | `src/main/java/com/photoalbum/config/SecurityConfig.java:34–42` | Injects `app.admin.username` and required `app.admin.password`; username fallback is redacted. |
| Upload settings consumers | Java property injection | `src/main/java/com/photoalbum/service/impl/PhotoServiceImpl.java:42–43` | Reads size and MIME-type properties. |
| Build configuration | Maven XML | `pom.xml` | Java/compiler settings, dependency management and executable JAR plugin. |
| Image/runtime configuration | Dockerfile | `Dockerfile` | Build/runtime images, exposed port, JVM heap options and entrypoint. |
| Service configuration | Docker Compose YAML | `docker-compose.yml` | Environment bindings, ports, network, volume, database health check and dependency ordering. |
| Environment template | dotenv example | `.env.example` | Lists `ORACLE_PASSWORD`, `APP_USER`, `APP_USER_PASSWORD`, `APP_ADMIN_USERNAME`, `APP_ADMIN_PASSWORD`; credential examples/defaults are `[REDACTED]`. |
| Local secret-file exclusions | Git ignore rules | `.gitignore:202–204,252` | Ignores `.env` and `.env.*`, explicitly retaining `.env.example`. |
| Database initialization | Shell/SQL | `oracle-init/01-create-user.sh`, `oracle-init/02-verify-user.sql`, `oracle-init/create-user.sh` | Entire directory mounted into Oracle startup scripts; contains account creation, grants and verification. |
| Additional database check | SQL | `oracle-init/healthcheck.sql` | Contains a connection and `SELECT 1 FROM DUAL`; credential material is redacted. Compose defines its own inline check. |
| Client-side constant | JavaScript | `src/main/resources/static/js/upload.js:69` | Hard-coded 10 MiB size constant; not externalized through Spring properties. |
| Optional developer build settings | Setup documentation | `WORKSHOP_SETUP_GUIDE.md:195–233` | Describes user-local Maven `settings.xml` mirrors at `https://maven.aliyun.com/repository/public` and `https://maven.aliyun.com/repository/spring`; not a committed settings file. |

No `bootstrap.*`, Spring Cloud Config connection, external configuration repository, remote secret-store integration, Kubernetes manifests, or deployed Azure resource configuration was found in the application/deployment sources. Workshop references to future Azure migration are not current runtime configuration.

## Build Profiles

| Profile | Activation | Purpose | Key Dependencies/Plugins |
|---|---|---|---|
| Default Maven build; no named `<profiles>` | Normal Maven execution | Package `com.photoalbum:photo-album:1.0.0` as a JAR using Java 21 and UTF-8 | Spring Boot Maven plugin; web, Thymeleaf, Data JPA, validation, security and JSON starters; runtime Oracle JDBC; optional DevTools; test starter and H2. |
| Container build invocation; not a Maven profile | Docker build | Pre-fetch dependencies, then package without running tests | `mvn dependency:go-offline -B`, then `mvn clean package -DskipTests`. |

Build properties in `pom.xml:23–28`: `java.version=21`, `maven.compiler.source=21`, `maven.compiler.target=21`, `project.build.sourceEncoding=UTF-8`. No profile-specific dependency additions/removals or Maven wrapper was found.

## Runtime Profiles

| Profile | Activation Method | Config Files | Key Overrides |
|---|---|---|---|
| Default/base | No explicit active profile | `src/main/resources/application.properties` | Local Oracle URL fallback; application and web logging at `DEBUG`. No explicit `spring.profiles.active` or custom default profile. |
| `docker` | Compose sets `SPRING_PROFILES_ACTIVE=docker` | Base plus `src/main/resources/application-docker.properties` | Oracle service hostname; application logging `INFO`, web logging `WARN`, Hibernate SQL logging `DEBUG`. |
| `test` | `@ActiveProfiles("test")` in `PhotoAlbumApplicationTests.java:8` | Base plus `src/test/resources/application-test.properties` | H2 driver/URL/dialect; `create-drop`; SQL display disabled; test upload path and administrator credentials. |

No `@Profile` beans or explicit profile groups/includes/composition were found. Spring supports multiple active profiles, but the repository does not configure a combined profile selection.

## Properties Inventory

### Application module: `photo-album`

In the following table, **base**, **docker**, and **test** refer to the three properties files listed above. `[REDACTED]` masks both actual credentials and credential defaults, including test/example values.

| Property Key | Default / Profile Values | Profiles | Source |
|---|---|---|---|
| `server.port` | Integer `8080`; docker repeats `8080` | Base, docker; inherited by test | Base/docker properties |
| `server.servlet.encoding.charset` | String `UTF-8` | Base, docker; inherited by test | Base/docker properties |
| `server.servlet.encoding.enabled` | Boolean `true` | Base, docker; inherited by test | Base/docker properties |
| `server.servlet.encoding.force` | Boolean `true` | Base, docker; inherited by test | Base/docker properties |
| `spring.datasource.url` | Base `${SPRING_DATASOURCE_URL:jdbc:oracle:thin:@localhost:1521:XE}`; docker `${SPRING_DATASOURCE_URL:jdbc:oracle:thin:@oracle-db:1521:XE}`; test `jdbc:h2:mem:testdb` | Base, docker, test | Corresponding properties files; environment override |
| `spring.datasource.username` | Base/docker reference `SPRING_DATASOURCE_USERNAME`, with fallback `[REDACTED]`; test `[REDACTED]` | Base, docker, test | Properties files; environment |
| `spring.datasource.password` | Base/docker `${SPRING_DATASOURCE_PASSWORD}` without fallback; test `[REDACTED]` | Base, docker, test | Properties files; environment |
| `spring.datasource.driver-class-name` | Base/docker `oracle.jdbc.OracleDriver`; test `org.h2.Driver` | Base, docker, test | Properties files |
| `spring.jpa.database-platform` | Base/docker `org.hibernate.dialect.OracleDialect`; test `org.hibernate.dialect.H2Dialect` | Base, docker, test | Properties files |
| `spring.jpa.hibernate.ddl-auto` | Base/docker `create`; test `create-drop` | Base, docker, test | Properties files |
| `spring.jpa.show-sql` | Boolean base/docker `true`; test `false` | Base, docker, test | Properties files |
| `spring.jpa.properties.hibernate.format_sql` | Boolean `true` | Base, docker; inherited by test | Base/docker properties |
| `spring.servlet.multipart.max-file-size` | Data-size value `10MB` | Base, docker; inherited by test | Base/docker properties |
| `spring.servlet.multipart.max-request-size` | Data-size value `50MB` | Base, docker; inherited by test | Base/docker properties |
| `app.file-upload.max-file-size-bytes` | Long integer `10485760` | Base, docker, test | All properties files; injected into `PhotoServiceImpl` |
| `app.file-upload.allowed-mime-types` | Comma-separated string array `image/jpeg,image/png,image/gif,image/webp` | Base, docker, test | All properties files; injected into `PhotoServiceImpl` |
| `app.file-upload.max-files-per-upload` | Integer `10` | Base, docker, test | All properties files; no property consumer found in Java source |
| `app.file-upload.upload-path` | No base/docker declaration; test string `target/test-uploads` | Test only | Test properties; no property consumer found in Java source |
| `logging.level.com.photoalbum` | Base/test `DEBUG`; docker `INFO` | Base, docker, test | Properties files |
| `logging.level.org.springframework.web` | Base `DEBUG`; docker `WARN`; test inherits base | Base, docker | Base/docker properties |
| `logging.level.org.hibernate.SQL` | Docker `DEBUG`; no explicit base/test value | Docker | Docker properties |
| `app.admin.username` | String fallback `[REDACTED]`; test `[REDACTED]`; environment binding `APP_ADMIN_USERNAME` | All; explicit test override | `SecurityConfig.java:36`; test properties; Compose |
| `app.admin.password` | Required `${app.admin.password}`; no Java fallback; test `[REDACTED]`; environment binding `APP_ADMIN_PASSWORD` | All; explicit test override | `SecurityConfig.java:37`; test properties; Compose |

No custom range validation for these configuration properties was found; byte limits/counts are numeric and MIME types are comma-separated strings. The browser's independent size constant is `10 * 1024 * 1024` bytes and is not dynamically bound to server settings.

### Container/environment settings

| Property Key | Default / Value | Profiles | Source |
|---|---|---|---|
| `ORACLE_PASSWORD` → `ORACLE_PWD` | Required nonempty value; `[REDACTED]` | Compose database | Shell or local `.env`; Compose `${ORACLE_PASSWORD:?...}` |
| `APP_USER` | Credential fallback `[REDACTED]` | Compose database and app | Shell or `.env`; Compose `${APP_USER:-...}`; startup scripts also have a masked fallback |
| `APP_USER_PASSWORD` | Required nonempty value; `[REDACTED]` | Compose database and app | Shell or `.env`; Compose required-value expression |
| `ORACLE_CHARACTERSET` | String `AL32UTF8` | Compose database | `docker-compose.yml:8` |
| `SPRING_DATASOURCE_URL` | `jdbc:oracle:thin:@oracle-db:1521:XE` | Compose app | `docker-compose.yml:34` |
| `SPRING_DATASOURCE_USERNAME` | From `APP_USER`; `[REDACTED]` | Compose app | `docker-compose.yml:35` |
| `SPRING_DATASOURCE_PASSWORD` | From required `APP_USER_PASSWORD`; `[REDACTED]` | Compose app | `docker-compose.yml:36` |
| `APP_ADMIN_USERNAME` | Credential fallback `[REDACTED]` | Compose app | Shell or `.env`; Compose fallback expression |
| `APP_ADMIN_PASSWORD` | Required nonempty value; `[REDACTED]` | Compose app | Shell or `.env`; Compose required-value expression |

**Resolution chain:** Compose substitutes host environment/`.env` values before creating containers; `:?` requires a nonempty value and `:-` selects a fallback when unset/empty. Spring loads base properties and active-profile overrides, resolves `${...}` placeholders, and permits higher-priority environment/command-line overrides; credential fallback values remain redacted. A root `.env` is a Compose input, not automatically a Spring property source when running the JAR directly.

## Startup Parameters & Resource Requirements

| Service | JVM/Runtime Options | Memory | Instance Count |
|---|---|---|---|
| `photoalbum-java-app` | `java $JAVA_OPTS -jar app.jar`; image defaults `JAVA_OPTS="-Xmx512m -Xms256m"`; Compose `SPRING_PROFILES_ACTIVE=docker`; port mapping `8080:8080`; restart `on-failure` | JVM heap initial 256 MiB / maximum 512 MiB; container memory and CPU limits unspecified | No replicas/scaling configured; one service container implied |
| `oracle-db` | Oracle XE image; environment entries above; port mappings `1521:1521`, `5500:5500`; container name `photoalbum-oracle` | No explicit memory/CPU requests or limits | No replicas/scaling configured; one service container implied |

No startup `-D` system properties, CPU allocations, autoscaling rules or total host-memory requirement are declared. JVM heap limits are not container-memory limits; no configured mapping between heap and container allocation exists. Both services join `photoalbum-network` using the bridge driver. Oracle persists data in `oracle_data:/opt/oracle/oradata`; startup scripts mount at `/opt/oracle/scripts/startup`. No application volume is configured. `JAVA_HOME` setup in the workshop guide is developer-machine preparation, not a container override.

## Startup Dependency Chain

1. **Compose interpolation → required secret inputs:** missing required Oracle/application/admin password inputs stop Compose configuration before containers start.
2. **`oracle-db` → Oracle initialization and account scripts:** the mounted startup directory includes `01-create-user.sh`, `02-verify-user.sql`, `create-user.sh`, and `healthcheck.sql`. Shell scripts require `ORACLE_PWD` and `APP_USER_PASSWORD`; `create-user.sh` includes a fixed `sleep 30`, not a readiness polling loop.
3. **Database health → application launch:** Compose uses an inline SQL*Plus check with application-account environment references. The health check runs every `30s`, times out after `10s`, allows `15` retries, and has a `180s` start period. These are check parameters, not a guaranteed overall database boot deadline.
4. **`photoalbum-java-app` → healthy `oracle-db`:** `depends_on.oracle-db.condition=service_healthy` gates container startup. Spring then requires resolvable database/admin settings and a usable database during context initialization. Application failures trigger the configured `on-failure` restart policy.

No application container health check, readiness probe, Spring Cloud Config retry, discovery-server dependency, or explicit application startup timeout was found. The test profile selects in-memory H2 and does not rely on Compose startup ordering.

## Secrets & Sensitive Configuration

| Secret Reference | Type | Storage (masked) |
|---|---|---|
| `ORACLE_PASSWORD` / container `ORACLE_PWD` | Oracle administrative password | Host environment or ignored local `.env` → database container; `[REDACTED]` |
| `APP_USER` / `SPRING_DATASOURCE_USERNAME` | Database account identifier | Environment/template/fallback references; all values/defaults `[REDACTED]` |
| `APP_USER_PASSWORD` / `SPRING_DATASOURCE_PASSWORD` / `spring.datasource.password` | Application database password | Environment bindings → database initialization and app; `[REDACTED]` |
| `APP_ADMIN_USERNAME` / `app.admin.username` | Administrator account identifier | Environment, Java fallback and test properties; `[REDACTED]` |
| `APP_ADMIN_PASSWORD` / `app.admin.password` | Administrator password | Required external runtime value; explicit test credential `[REDACTED]` |
| Test datasource credentials | Test-only credentials | `src/test/resources/application-test.properties`; `[REDACTED]` |
| SQL account/connection literals | Account and connection information | `oracle-init/02-verify-user.sql`, `oracle-init/healthcheck.sql`; `[REDACTED]` |

### Secrets Provisioning Workflow

1. An operator supplies the named environment variables, optionally using an ignored local `.env` patterned after `.env.example`. No automated retrieval from a secret manager or CI provisioning workflow was found.
2. Compose requires the three password inputs and binds the Oracle administrative password to `ORACLE_PWD`. It passes application account settings into Oracle and maps the same application credentials to Spring datasource environment variables.
3. Oracle startup shell scripts use the administrative connection to create the application account if absent and apply grants. `01-create-user.sh` specifies a least-privilege intent without DBA/system-wide `ANY` grants; the separate legacy `create-user.sh` also runs from the mounted directory and has a different grant sequence. Existing-account password rotation is not established by the create-if-absent workflow.
4. Spring consumes datasource credentials and separately injects administrator credentials into an in-memory user-details configuration. `SecurityConfig` uses a password encoder; this application-side hashing does not encrypt environment variables or the local `.env` file.

No managed identity, service principal, RBAC-based secret retrieval, Vault/Key Vault path, Jasypt encryption, sealed secret, or Docker secret mount is configured. Secret values are passed as ordinary environment variables; the inventory does not reproduce credential defaults or literals.

## Feature Flags

| Flag Name | Default | Controlled By |
|---|---|---|
| No business-feature flag framework or custom conditional property found | Not applicable | No `@ConditionalOnProperty`, `@ConditionalOnExpression`, LaunchDarkly or Unleash configuration found |
| `spring.jpa.show-sql` | Base/docker `true`; test `false` | Spring properties; operational logging toggle, not a business feature flag |
| `spring.jpa.properties.hibernate.format_sql` | `true` | Base/docker properties; operational formatting toggle |
| `server.servlet.encoding.enabled`, `server.servlet.encoding.force` | Both `true` | Base/docker properties; framework configuration toggles |

No A/B testing, gradual rollout, or remote flag source is declared. Runtime profiles are environment selections, not independently implemented feature flags.

## Framework & Runtime Versions

| Component | Version | Source |
|---|---|---|
| Application artifact | `com.photoalbum:photo-album:1.0.0` | `pom.xml:15–18` |
| Java target/compiler source/compiler target | `21` | `pom.xml:24–26` |
| Spring Boot parent and starters | `3.5.0` parent; starters inherit management | `pom.xml:8–13,30–101` |
| Spring Framework, Spring Security, Spring Data JPA, Hibernate ORM, Thymeleaf and embedded servlet container | Not explicitly pinned individually; managed through Spring Boot parent/starters | `pom.xml`; resolved transitive versions not independently verified |
| Oracle JDBC `ojdbc8` | No explicit version; Spring Boot dependency management | `pom.xml:50–54` |
| Apache Commons IO | `2.14.0` | `pom.xml:69–73` |
| H2 and Spring Boot test dependencies | No explicit individual versions; parent-managed, test scope | `pom.xml:82–94` |
| Spring Boot DevTools | Parent-managed; optional dependency | `pom.xml:97–100` |
| Spring Boot Maven plugin | Parent-managed; no explicit plugin version | `pom.xml:103–110` |
| Maven container build image | `maven:3.9.9-eclipse-temurin-21` | `Dockerfile:2` |
| Java runtime image | `eclipse-temurin:21-jre` | `Dockerfile:17`; patch release/digest not pinned |
| Oracle database image | `container-registry.oracle.com/database/express:21.3.0-xe` | `docker-compose.yml:4` |
| Developer Maven requirement | README: `3.8.0` or higher; workshop: `3.9.x` | `README.md:53`, `WORKSHOP_SETUP_GUIDE.md:53–67,242` |
| Docker/Compose host versions | Not pinned | Compose file and workshop prerequisites |

> Note: Resolved transitive dependency versions, actual deployed resources and operator-supplied environment values could not be fully identified from committed source configuration. No builds or tests were run.
