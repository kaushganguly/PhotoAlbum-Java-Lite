# Configuration & Externalized Settings Inventory

Configuration is defined by three Spring property files (default, docker, test), an environment template, Docker Compose, a Dockerfile, Maven, and four Oracle startup/verification scripts. Runtime credentials are environment-supplied; all password values, including examples and test fixtures, are masked below.

## Configuration Sources

| Source | Type | Path/Location | Notes |
|---|---|---|---|
| Base application settings | Spring properties | `src/main/resources/application.properties` | Loaded for all profiles; database credentials reference environment variables. |
| Docker settings | Spring profile properties | `src/main/resources/application-docker.properties` | Overrides/additions when `docker` is active. |
| Test settings | Spring profile properties | `src/test/resources/application-test.properties` | Test-classpath overrides when `test` is active. |
| Environment template | Compose interpolation inputs | `.env.example` | Five entries: `ORACLE_PASSWORD`, `APP_USER`, `APP_USER_PASSWORD`, `APP_ADMIN_USERNAME`, `APP_ADMIN_PASSWORD`. Copy to `.env` and supply private values. |
| Local environment | Untracked external configuration | `.env` / invoking shell | `.gitignore` excludes `.env` and `.env.*`, except `.env.example`. Actual private files were not read. Spring does not automatically load Compose `.env` files for standalone runs. |
| Container services | Compose YAML | `docker-compose.yml` | Environment bindings, database health dependency, ports, mounts, restart policy, bridge network. |
| Container startup/build | Dockerfile | `Dockerfile` | Multi-stage build, runtime image, heap defaults, executable entrypoint. |
| Build/dependency settings | Maven XML | `pom.xml` | Parent-managed dependencies, Java/compiler settings, executable JAR plugin; no Maven profiles. |
| Code-level defaults/consumers | Spring `@Value` configuration | `src/main/java/com/photoalbum/config/SecurityConfig.java:34-42`; `src/main/java/com/photoalbum/service/impl/PhotoServiceImpl.java:40-43` | Admin username fallback; required admin password; upload size and MIME settings. |
| Test profile activation | Spring test annotation | `src/test/java/com/photoalbum/PhotoAlbumApplicationTests.java:7-8` | `@SpringBootTest`, `@ActiveProfiles("test")`. |
| Primary schema initialization | Shell/SQL | `oracle-init/01-create-user.sh` | Requires credential environment variables, normalizes username to uppercase, creates user if absent, applies schema-scoped grants. |
| Schema verification | SQL | `oracle-init/02-verify-user.sql` | Checks literal `PHOTOALBUM`, not configurable `APP_USER`; diagnostic only. |
| Additional schema initialization | Shell/SQL | `oracle-init/create-user.sh` | Requires the same environment inputs; waits 30 seconds, creates missing user and initial grants. |
| Standalone database check | SQL | `oracle-init/healthcheck.sql` | Simple SQL query; Compose uses its own inline query instead. |
| Operator instructions | Documentation | `README.md`, `WORKSHOP_PREPARATION.md`, `WORKSHOP_SETUP_GUIDE.md` | Setup examples and prerequisites, not authoritative runtime overrides. Any credential examples are treated as `[MASKED]`. |

No application `bootstrap.*`, external configuration repository URI, Spring Cloud Config, Azure App Configuration, Vault/Key Vault/Secrets Manager binding, Kubernetes configuration, or deployment secret-store integration was found in the application/deployment sources examined.

## Build Profiles

| Profile | Activation | Purpose | Key Dependencies/Plugins |
|---|---|---|---|
| Standard Maven build (not a named profile) | Normal Maven invocation | Compile Java 21, package `com.photoalbum:photo-album:1.0.0` as JAR | Spring Boot parent `3.5.0`; `spring-boot-maven-plugin`; web, Thymeleaf, JPA, validation, security, JSON starters; runtime `ojdbc8`; Commons IO; optional DevTools. |
| Docker build path (not a Maven profile) | Dockerfile build stage | Resolve dependencies with `mvn dependency:go-offline -B`, then package with `mvn clean package -DskipTests` | Same POM dependencies/plugins; build-time `skipTests` property skips test execution, not a runtime property. |
| Test dependency scope (not a named profile) | Maven test classpath | Include test libraries | `spring-boot-starter-test`, H2; no conditional dependency profile. |

No `<profiles>` or profile activation blocks are declared. Build properties are `java.version=21`, `maven.compiler.source=21`, `maven.compiler.target=21`, and `project.build.sourceEncoding=UTF-8`.

## Runtime Profiles

| Profile | Activation Method | Config Files | Key Overrides |
|---|---|---|---|
| Default | No explicit active profile | `src/main/resources/application.properties` | Local Oracle URL fallback, DEBUG application/web logging, required datasource password. |
| `docker` | Compose supplies `SPRING_PROFILES_ACTIVE=docker`; may also be selected explicitly outside Compose | Base file + `src/main/resources/application-docker.properties` | Oracle host fallback `oracle-db`, INFO application logging, WARN web logging, DEBUG Hibernate SQL logging. Compose also binds datasource/admin environment inputs. |
| `test` | `@ActiveProfiles("test")` on the context test; file available on test classpath | Base file + `src/test/resources/application-test.properties` | H2 connection/driver/dialect, `create-drop`, SQL logging off, test upload-path property, test-only admin credentials. |

No application `spring.profiles.active` default or `@Profile`-conditional beans were found. Spring supports comma-separated profile activation, but no combined profile list or profile group is configured here; simultaneous profiles would follow Spring's normal override ordering.

## Properties Inventory

### Application module: `photo-album`

`base` = `application.properties`; `docker` = `application-docker.properties`; `test` = `application-test.properties`. “Inherited” means the base setting remains unless externally overridden; it is not a duplicate declaration in the profile file.

| Property Key | Default | Profiles | Source |
|---|---|---|---|
| `server.port` | `8080` (integer port) | docker: `8080`; test: inherited | base, docker |
| `server.servlet.encoding.charset` | `UTF-8` (charset string) | docker: same; test: inherited | base, docker |
| `server.servlet.encoding.enabled` | `true` (boolean) | docker: same; test: inherited | base, docker |
| `server.servlet.encoding.force` | `true` (boolean) | docker: same; test: inherited | base, docker |
| `spring.datasource.url` | `${SPRING_DATASOURCE_URL:jdbc:oracle:thin:@localhost:1521:XE}` (JDBC URL string) | docker fallback: `jdbc:oracle:thin:@oracle-db:1521:XE`; test: `jdbc:h2:mem:testdb` | base, docker, test; Compose supplies `SPRING_DATASOURCE_URL` |
| `spring.datasource.username` | `${SPRING_DATASOURCE_USERNAME:photoalbum}` (string) | docker: same; test: `sa` | base, docker, test; Compose maps `APP_USER` |
| `spring.datasource.password` | `${SPRING_DATASOURCE_PASSWORD}`; no fallback | docker: same required ENV reference; test: `[MASKED]` (empty fixture) | base, docker, test |
| `spring.datasource.driver-class-name` | `oracle.jdbc.OracleDriver` (class name) | docker: same; test: `org.h2.Driver` | base, docker, test |
| `spring.jpa.database-platform` | `org.hibernate.dialect.OracleDialect` (class name) | docker: same; test: `org.hibernate.dialect.H2Dialect` | base, docker, test |
| `spring.jpa.hibernate.ddl-auto` | `create` (enum string) | docker: `create`; test: `create-drop` | base, docker, test |
| `spring.jpa.show-sql` | `true` (boolean) | docker: `true`; test: `false` | base, docker, test |
| `spring.jpa.properties.hibernate.format_sql` | `true` (boolean) | docker: same; test: inherited | base, docker |
| `spring.servlet.multipart.max-file-size` | `10MB` (data size) | docker: same; test: inherited | base, docker |
| `spring.servlet.multipart.max-request-size` | `50MB` (data size) | docker: same; test: inherited | base, docker |
| `app.file-upload.max-file-size-bytes` | `10485760` (long, bytes) | docker/test: same | base, docker, test; injected into `PhotoServiceImpl` |
| `app.file-upload.allowed-mime-types` | `image/jpeg,image/png,image/gif,image/webp` (comma-separated string array) | docker/test: same | base, docker, test; injected into `PhotoServiceImpl` |
| `app.file-upload.max-files-per-upload` | `10` (integer-like setting) | docker/test: same | base, docker, test; no Java property consumer found |
| `app.file-upload.upload-path` | Not declared in base | test: `target/test-uploads` (path string); not declared in docker | test only; no Java property consumer found |
| `logging.level.com.photoalbum` | `DEBUG` (log level) | docker: `INFO`; test: `DEBUG` | base, docker, test |
| `logging.level.org.springframework.web` | `DEBUG` (log level) | docker: `WARN`; test: inherited | base, docker |
| `logging.level.org.hibernate.SQL` | Not explicitly set in base | docker: `DEBUG`; test: no explicit override | docker |
| `app.admin.username` | `admin` (string fallback in `@Value`) | docker: `${APP_ADMIN_USERNAME:-admin}` via Compose; test: `admin` | `SecurityConfig.java:36`, Compose, test |
| `app.admin.password` | Required `${app.admin.password}`; no code fallback | docker: ENV `APP_ADMIN_PASSWORD`; test: `[MASKED]` | `SecurityConfig.java:37`, Compose, test |

The table covers all 23 distinct application property keys, including code-level admin settings. Custom numeric settings have the declared types/units above; no separate configuration-binding range constraints were found. MIME entries are configuration strings; business validation rules are outside this inventory.

### Environment and Compose bindings

| Property Key | Default | Profiles | Source |
|---|---|---|---|
| `ORACLE_PASSWORD` → database `ORACLE_PWD` | Required/nonempty; `[MASKED]` | Compose | Shell or `.env`; `${ORACLE_PASSWORD:?...}` rejects missing/empty input |
| `APP_USER` → database `APP_USER`, application `SPRING_DATASOURCE_USERNAME` | `photoalbum` (string) | Compose | `${APP_USER:-photoalbum}`; shell scripts also default to `photoalbum` |
| `APP_USER_PASSWORD` → database `APP_USER_PASSWORD`, application `SPRING_DATASOURCE_PASSWORD` | Required/nonempty; `[MASKED]` | Compose | Shell or `.env`; `${APP_USER_PASSWORD:?...}` |
| `APP_ADMIN_USERNAME` → application `APP_ADMIN_USERNAME` | `admin` (string) | Compose | `${APP_ADMIN_USERNAME:-admin}` |
| `APP_ADMIN_PASSWORD` → application `APP_ADMIN_PASSWORD` | Required/nonempty; `[MASKED]` | Compose | Shell or `.env`; `${APP_ADMIN_PASSWORD:?...}` |
| Database `ORACLE_CHARACTERSET` | `AL32UTF8` (string) | Compose | Literal environment entry |
| Application `SPRING_DATASOURCE_URL` | `jdbc:oracle:thin:@oracle-db:1521:XE` | Compose | Literal environment entry; overrides profile-file fallback |

Resolution chain: invoking-shell values take precedence over Compose `.env` interpolation inputs → Compose explicitly binds container variables → Spring environment relaxed binding supplies datasource/admin properties → active-profile files override base files → explicit `${ENV_VAR:fallback}` expressions and `@Value` defaults supply their fallbacks. A standalone Java launch must export variables or otherwise supply Spring configuration; merely copying `.env.example` is insufficient. Command-line Spring arguments and JVM system properties can also override file configuration, but none are supplied by the checked-in entrypoint.

## Startup Parameters & Resource Requirements

| Service | JVM/Runtime Options | Memory | Instance Count |
|---|---|---|---|
| `photoalbum-java-app` | `sh -c "java $JAVA_OPTS -jar app.jar"` from `/app`; image `JAVA_OPTS="-Xmx512m -Xms256m"`; Compose `SPRING_PROFILES_ACTIVE=docker`; no checked-in JVM `-D` options | Initial heap 256 MiB; maximum heap 512 MiB. No container memory request/reservation/limit; JVM nonheap/native memory is additional. | One service container by default; explicit `container_name`; no replicas/autoscaling settings |
| `oracle-db` | Image-managed Oracle startup; charset `AL32UTF8`; environment credential inputs and mounted startup scripts | No Compose memory limit/reservation or Oracle SGA/PGA size override; image defaults apply and are not specified in this repository | One service container by default; explicit `container_name`; no scaling settings |
| Standalone/default application | No separate startup script or checked-in standalone JVM options | JVM/host defaults unless the operator passes options; Docker heap defaults do not automatically apply | Operator-managed |
| Test runtime | Spring test profile selected by annotation; no Surefire `argLine`, heap, or fork-count override | Maven/JVM defaults; not pinned | Test-runner defaults; not configured |

No CPU quota, CPU request, `cpus`, `mem_limit`, `deploy.resources`, Kubernetes resource allocation, or cloud instance sizing is declared. The 512 MiB maximum heap is **not** a 512 MiB container memory limit. `JAVA_OPTS` can be overridden when launching the container, but is not exposed as a Compose `.env` interpolation setting.

Other startup/deployment defaults:

- Application exposes/publishes `8080:8080`; Oracle publishes `1521:1521` and `5500:5500`.
- Oracle data persists in named volume `oracle_data` at `/opt/oracle/oradata`; `./oracle-init` is mounted at `/opt/oracle/scripts/startup`. No read-only qualifier is declared.
- Both services join `photoalbum-network`, configured with bridge driver.
- Application restart policy is `on-failure`; database restart policy is not specified.
- Neither an application container health check nor a deployment replica/scaling policy is configured.

## Startup Dependency Chain

1. **Compose launch → required environment inputs:** Compose interpolates `ORACLE_PASSWORD`, `APP_USER_PASSWORD`, and `APP_ADMIN_PASSWORD` with required/nonempty checks before starting services.
2. **`oracle-db` → Oracle image initialization/startup:** the image receives `ORACLE_PWD`, `APP_USER`, `APP_USER_PASSWORD`, and `ORACLE_CHARACTERSET`; the startup directory mount supplies `01-create-user.sh`, `02-verify-user.sql`, `create-user.sh`, and `healthcheck.sql`. Script discovery/execution is image-managed, not explicitly orchestrated by Compose.
3. **Schema scripts → Oracle SQL listener:** both shell scripts use SQL*Plus as `SYSTEM` with ENV `ORACLE_PWD` against `//localhost:1521/XE`. `01-create-user.sh` has no explicit wait loop; `create-user.sh` sleeps 30 seconds. Both use `set -euo pipefail` and shell required-variable checks. The verification SQL checks fixed username `PHOTOALBUM`, so its diagnostic target does not track an overridden `APP_USER`.
4. **Database healthy → successful application-user SQL query:** Compose pipes `SELECT 1 FROM DUAL;` to SQL*Plus using container ENV `APP_USER` / `APP_USER_PASSWORD`. `$${...}` escaping defers expansion to the container shell. Timing is `interval: 30s`, `timeout: 10s`, `retries: 15`, `start_period: 180s`; the grace period and retry timing are not an application startup timeout. The checked-in command relies on SQL*Plus exit status and has no `WHENEVER SQLERROR EXIT` directive.
5. **`photoalbum-java-app` → waits for → `oracle-db`:** Compose `depends_on` uses `condition: service_healthy`, then launches the Java entrypoint. There is no dockerize wait, custom database retry configuration, separate config/discovery service, or application readiness probe. This dependency gates initial startup; it is not ongoing database-availability enforcement.

## Secrets & Sensitive Configuration

| Secret Reference | Type | Storage (masked) |
|---|---|---|
| `ORACLE_PASSWORD` → `ORACLE_PWD` | Database administrative credential | Operator environment / ignored `.env`; `[MASKED]`; `.env.example` placeholder also `[MASKED]` |
| `APP_USER_PASSWORD` | Application schema credential | Operator environment / ignored `.env`; `[MASKED]`; passed to database and application |
| `SPRING_DATASOURCE_PASSWORD` → `spring.datasource.password` | Spring datasource credential | Runtime environment; `${SPRING_DATASOURCE_PASSWORD}`; test fixture `[MASKED]` |
| `APP_ADMIN_PASSWORD` → `app.admin.password` | Application administrator credential | Runtime environment; `[MASKED]`; test-only value in test properties `[MASKED]` |
| SQL*Plus connection credential segments | Script/health-check credentials | ENV references `ORACLE_PWD` / `APP_USER_PASSWORD`, never literal values in this report |

Usernames (`APP_USER`, `APP_ADMIN_USERNAME`, `sa`, `SYSTEM`) and credential-free JDBC URLs are identifiers rather than passwords. No encrypted property syntax, Jasypt integration, sealed secret, external vault URI, service-principal credential binding, managed identity, or cloud RBAC provisioning was found.

### Secrets Provisioning Workflow

1. Operator copies `.env.example` to ignored `.env` and replaces placeholders with unique private values, or supplies equivalent shell variables. Any illustrative password assignment is represented only as `APP_ADMIN_PASSWORD=[MASKED]`, `APP_USER_PASSWORD=[MASKED]`, or `ORACLE_PASSWORD=[MASKED]`.
2. Compose validates required secret inputs and injects them as plain container environment variables. `.env` is an interpolation source, not an automatic blanket export to all containers.
3. Oracle receives its administrative credential through `ORACLE_PWD`. Initialization connects as `SYSTEM`, creates the configured application user when absent, and applies schema-scoped grants; the primary script does not grant DBA. The scripts do not update an existing user's password, so changing environment values alone does not rotate persisted database credentials.
4. The application receives the same schema credential through `SPRING_DATASOURCE_PASSWORD`, plus `APP_ADMIN_PASSWORD`. Spring resolves these into the datasource and admin configuration. The administrator is constructed in memory with a BCrypt password encoder; this does not encrypt environment-variable storage.
5. The test profile instead supplies its own test credential fixture and H2 password setting, both `[MASKED]` here. No deployment pipeline secret retrieval or automatic secret rotation workflow is configured in the examined deployment sources.

## Feature Flags

| Flag Name | Default | Controlled By |
|---|---|---|
| Dedicated feature flags | None found | No LaunchDarkly, Unleash, feature-management dependency, `@ConditionalOnProperty`, or `@ConditionalOnExpression` in application sources |
| `server.servlet.encoding.enabled` | `true` | Base/docker properties; standard framework boolean, not a business feature flag |
| `server.servlet.encoding.force` | `true` | Base/docker properties; standard framework boolean |
| `spring.jpa.show-sql` | `true`; test `false` | Runtime profile configuration; diagnostic toggle |
| `spring.jpa.properties.hibernate.format_sql` | `true` | Base/docker properties; diagnostic toggle |

Runtime profile selection and logging levels are environment/diagnostic configuration, not gradual-rollout or A/B-testing flags. Security behavior is code-defined rather than controlled by a discovered feature toggle.

## Framework & Runtime Versions

| Component | Version | Source |
|---|---|---|
| Application artifact | `com.photoalbum:photo-album:1.0.0`, JAR | `pom.xml:15-18` |
| Spring Boot parent | `3.5.0` | `pom.xml:8-12` |
| Java compile target/source | `21` | `pom.xml:23-27` |
| Build image / Maven | `maven:3.9.9-eclipse-temurin-21`; Maven `3.9.9`, JDK 21 | `Dockerfile:2` |
| Runtime image / Java runtime | `eclipse-temurin:21-jre`; Java 21 JRE | `Dockerfile:17`; no patch version or digest pinned |
| Oracle database image | `container-registry.oracle.com/database/express:21.3.0-xe` | `docker-compose.yml:4` |
| Commons IO | `2.14.0` | `pom.xml:68-73` |
| Spring web, Thymeleaf, Data JPA, validation, security, JSON starters; DevTools | Managed by Spring Boot parent `3.5.0`; individual versions not explicitly declared | `pom.xml:30-100` |
| Spring Framework / Spring Security / Hibernate / embedded Tomcat / Thymeleaf | Transitive/parent-managed; exact resolved versions not established by this static inventory | Boot starter dependencies in `pom.xml` |
| Oracle JDBC | `com.oracle.database.jdbc:ojdbc8`; version parent-managed, not explicitly declared; runtime scope | `pom.xml:49-54` |
| H2 and test framework | H2, Spring Boot starter test / JUnit Jupiter; versions parent-managed, not explicitly declared | `pom.xml:81-93`; test imports |
| Spring Boot Maven plugin | Parent-managed; no explicit plugin version | `pom.xml:103-109` |
| Local Maven / Docker / Compose | Local installed versions not established; setup guide requests Java 21 and Maven 3.9.x, README requests latest Docker Desktop | `WORKSHOP_SETUP_GUIDE.md:241-242`; `README.md:108`; no Maven wrapper found |

> Note: Exact transitive dependency versions, private environment values, image-internal resource defaults, and installed tool versions were not resolved. This is a static inventory; no build, test, container launch, or secret-file inspection was performed.
