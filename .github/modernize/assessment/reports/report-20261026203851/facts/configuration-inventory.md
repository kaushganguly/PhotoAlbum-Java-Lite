# Configuration & Externalized Settings Inventory

Configuration comprises three Spring properties files, a Maven build, a Dockerfile, Docker Compose, and an environment template, supplemented by Java configuration and four database initialization/check scripts. Two named runtime profiles are present; credentials are supplied through environment/property bindings, with no external secret-store integration discovered.

Assessment workspace: `/home/runner/work/PhotoAlbum-Java-Lite/PhotoAlbum-Java-Lite`.

Scope: static inspection of application, test configuration, deployment files, and root documentation. Agent definitions were not accessed. No source changes, builds, tests, commits, or live infrastructure checks were performed. All credential values, including usernames, defaults, test fixtures, and examples, are intentionally omitted; sensitive entries are described by name only.

## Configuration Sources

| Source | Type | Path/Location | Notes |
|---|---|---|---|
| Base runtime settings | Spring properties | `src/main/resources/application.properties` | Default configuration; datasource environment placeholders, server, JPA, multipart, logging, and custom properties. |
| Docker runtime overrides | Spring profile properties | `src/main/resources/application-docker.properties` | Overrides base properties when `docker` is active. |
| Test runtime overrides | Spring profile properties | `src/test/resources/application-test.properties` | H2 configuration and test-only credential properties; only on the test classpath. |
| Build configuration | Maven XML | `pom.xml` | One module; parent-managed dependencies and plugin defaults. |
| Container build/startup | Dockerfile | `Dockerfile` | Two stages, runtime image, JVM options, exposed port, entrypoint. |
| Local deployment | Compose YAML | `docker-compose.yml` | Database and application environment bindings, health dependency, network, persistent database volume. |
| Environment template | Environment file | `.env.example` | Names `ORACLE_PASSWORD`, `APP_USER`, `APP_USER_PASSWORD`, `APP_ADMIN_USERNAME`, `APP_ADMIN_PASSWORD`; no values reproduced. |
| Local environment source | Deployment convention | `.env` | Template instructs copying to `.env`; no actual `.env` was found. `.gitignore:201–204` excludes environment files except the example. |
| Application security settings | Java configuration | `src/main/java/com/photoalbum/config/SecurityConfig.java` | Injects `app.admin.username` and `app.admin.password`; configures in-memory identity and BCrypt encoding. |
| Custom property consumers | Java property injection | `src/main/java/com/photoalbum/service/impl/PhotoServiceImpl.java:40–46` | Injects file-size and MIME-type settings. |
| Profile activation in tests | Java annotation | `src/test/java/com/photoalbum/PhotoAlbumApplicationTests.java:7–8` | `@SpringBootTest` with `@ActiveProfiles("test")`. |
| Schema startup initialization | Shell | `oracle-init/01-create-user.sh` | Required environment checks, account creation and grants through SQL*Plus. |
| Additional schema initialization | Shell | `oracle-init/create-user.sh` | Additional account-creation script with a fixed 30-second delay. |
| Startup verification | SQL | `oracle-init/02-verify-user.sql` | Account and privilege inspection; contains a literal account selector, omitted here. |
| Standalone database check | SQL | `oracle-init/healthcheck.sql` | Simple SQL readiness statement; Compose instead embeds its own SQL*Plus check. |
| Operational guidance | Markdown | `README.md`, `WORKSHOP_SETUP_GUIDE.md`, `WORKSHOP_PREPARATION.md` | Supporting setup/deployment guidance, not executable runtime property sources. |

No bootstrap configuration, external configuration repository, Spring Cloud Config, Vault, Key Vault, AWS secret/config store, Kubernetes manifests, or CI deployment workflow was discovered in the inspected application/deployment scope. Workshop discussion of future Azure migration is not evidence of an implemented Azure configuration source.

## Build Profiles

| Profile | Activation | Purpose | Key Dependencies/Plugins |
|---|---|---|---|
| Default build (not a named profile) | Normal Maven invocation | Package a Java 21 executable JAR | Spring Boot Maven plugin; web, Thymeleaf, JPA, validation, security, JSON starters; Oracle JDBC; Commons IO; optional DevTools; test starter and H2 in test scope. |

`pom.xml` contains no `<profiles>` declarations. The Docker build runs `mvn dependency:go-offline -B`, then `mvn clean package -DskipTests`; skipping tests is a build flag, not a Maven or Spring profile. Optional DevTools is not gated by a named build profile.

Build properties: `java.version=21`, `maven.compiler.source=21`, `maven.compiler.target=21`, `project.build.sourceEncoding=UTF-8`. Artifact coordinates are `com.photoalbum:photo-album:1.0.0`, packaging `jar`.

## Runtime Profiles

| Profile | Activation Method | Config Files | Key Overrides |
|---|---|---|---|
| Base/default | No explicit active profile | `application.properties` | Local Oracle JDBC URL default, DEBUG application/web logging. No explicit `spring.profiles.active` in the file. |
| `docker` | Compose supplies `SPRING_PROFILES_ACTIVE=docker` | Base plus `application-docker.properties` | Database host becomes `oracle-db`; application logging INFO, web logging WARN, Hibernate SQL logging DEBUG. Compose environment also explicitly supplies the database URL. |
| `test` | `@ActiveProfiles("test")` in the existing application test | Base plus `src/test/resources/application-test.properties` | H2 URL/driver/dialect, `create-drop`, SQL display disabled, test upload path and credential properties. |

No `@Profile` bean selection, profile groups, profile includes, or repository-defined combined-profile activation was found. Spring supports externally selecting multiple profiles, but no combination is prescribed here. The Docker build's test-skipping flag does not activate `test`.

## Properties Inventory

### Application module: `photo-album`

Values below are declared configuration, not verified effective settings. “Same” means explicitly repeated in the profile file; “inherited” means no override is declared there. Credential rows intentionally contain names only.

| Property Key | Default | Profiles | Source |
|---|---|---|---|
| `server.port` | `8080` (integer TCP port) | Docker: same; test: inherited | Base and Docker properties |
| `server.servlet.encoding.charset` | `UTF-8` (charset name) | Docker: same; test: inherited | Base and Docker properties |
| `server.servlet.encoding.enabled` | `true` (boolean) | Docker: same; test: inherited | Base and Docker properties |
| `server.servlet.encoding.force` | `true` (boolean) | Docker: same; test: inherited | Base and Docker properties |
| `spring.datasource.url` | `${SPRING_DATASOURCE_URL:jdbc:oracle:thin:@localhost:1521:XE}` (JDBC string) | Docker placeholder default: `jdbc:oracle:thin:@oracle-db:1521:XE`; test: `jdbc:h2:mem:testdb` | All three properties files; Compose overrides via `SPRING_DATASOURCE_URL` |
| `spring.datasource.username` | Credential value omitted | Base/Docker binding name: `SPRING_DATASOURCE_USERNAME`; test declares a credential | All three properties files |
| `spring.datasource.password` | Credential value omitted | Base/Docker binding name: `SPRING_DATASOURCE_PASSWORD`; test declares a credential | All three properties files |
| `spring.datasource.driver-class-name` | `oracle.jdbc.OracleDriver` (class name) | Docker: same; test: `org.h2.Driver` | All three properties files |
| `spring.jpa.database-platform` | `org.hibernate.dialect.OracleDialect` (class name) | Docker: same; test: `org.hibernate.dialect.H2Dialect` | All three properties files |
| `spring.jpa.hibernate.ddl-auto` | `create` (framework enum-like string) | Docker: same; test: `create-drop` | All three properties files |
| `spring.jpa.show-sql` | `true` (boolean) | Docker: same; test: `false` | All three properties files |
| `spring.jpa.properties.hibernate.format_sql` | `true` (boolean) | Docker: same; test: inherited | Base and Docker properties |
| `spring.servlet.multipart.max-file-size` | `10MB` (data size) | Docker: same; test: inherited | Base and Docker properties |
| `spring.servlet.multipart.max-request-size` | `50MB` (data size) | Docker: same; test: inherited | Base and Docker properties |
| `app.file-upload.max-file-size-bytes` | `10485760` (long, bytes) | Docker/test: same | All three properties files; injected by `PhotoServiceImpl` |
| `app.file-upload.allowed-mime-types` | `image/jpeg,image/png,image/gif,image/webp` (comma-separated string array) | Docker/test: same | All three properties files; injected by `PhotoServiceImpl` |
| `app.file-upload.max-files-per-upload` | `10` (integer-shaped setting) | Docker/test: same | All three properties files; no corresponding property injection found |
| `app.file-upload.upload-path` | Not declared in base | Test: `target/test-uploads` (path string) | Test properties only; no consumer of this key found |
| `logging.level.com.photoalbum` | `DEBUG` (logging level) | Docker: `INFO`; test: `DEBUG` | All three properties files |
| `logging.level.org.springframework.web` | `DEBUG` (logging level) | Docker: `WARN`; test: inherited | Base and Docker properties |
| `logging.level.org.hibernate.SQL` | Not explicitly declared | Docker: `DEBUG`; test: not declared | Docker properties |
| `app.admin.username` | Credential value omitted | Java fallback exists; test declares a credential; Compose supplies `APP_ADMIN_USERNAME` | `SecurityConfig.java:36`, test properties, Compose |
| `app.admin.password` | Credential value omitted | Required Java property without fallback; test declares a credential; Compose supplies `APP_ADMIN_PASSWORD` | `SecurityConfig.java:37`, test properties, Compose |

There are 23 distinct declared/injected runtime property keys. Application-specific numeric bounds are not centrally declared; JVM type conversion and framework parsing apply. This inventory does not infer business validation rules from configured values.

### Database container and deployment configuration

| Property Key | Default | Profiles | Source |
|---|---|---|---|
| `ORACLE_CHARACTERSET` | `AL32UTF8` (charset name) | Compose database container | `docker-compose.yml:8` |
| `ORACLE_PWD` | Credential value omitted | Container binding from `ORACLE_PASSWORD` | Compose and initialization scripts |
| `APP_USER` | Credential value omitted | Schema initialization and application datasource identity binding | Environment template, Compose, initialization scripts |
| `APP_USER_PASSWORD` | Credential value omitted | Schema initialization and application datasource password binding | Environment template, Compose, initialization scripts |
| `APP_ADMIN_USERNAME` | Credential value omitted | Application security identity binding | Environment template and Compose |
| `APP_ADMIN_PASSWORD` | Credential value omitted | Application security password binding | Environment template and Compose |

Resolution chain: Compose resolves `${…}` references from its invoking environment or `.env`, with required-value checks on password inputs. It maps values into container environment variables; Spring's environment/property resolution then applies environment overrides, active-profile properties, base properties, and declared placeholder fallbacks. Command-line arguments and JVM system properties can also override Spring settings under normal Spring Boot precedence, but no such runtime overrides are prescribed here. Profile-specific values override base-file values; environment values can override both, including test settings.

## Startup Parameters & Resource Requirements

| Service | JVM/Runtime Options | Memory | Instance Count |
|---|---|---|---|
| `photoalbum-java-app` | `java $JAVA_OPTS -jar app.jar`; Dockerfile `JAVA_OPTS="-Xmx512m -Xms256m"`; Compose activates `docker` and injects datasource/admin environment bindings | JVM initial heap 256 MiB, maximum heap 512 MiB; no container memory limit/request; native/non-heap overhead not budgeted | One service container under ordinary Compose startup; no explicit replica count or scaling policy |
| `oracle-db` | Oracle XE image startup; environment-provided initialization settings; SQL*Plus health check | No declared memory/CPU limit, request, or reservation | One service container under ordinary Compose startup; no scaling configuration |

No runtime `-D` system properties, CPU allocation, autoscaling, or application readiness probe is declared. `JAVA_OPTS` can be overridden by the container runtime; Compose does not override it. Docker publishes application port `8080` and database ports `1521` and `5500`. The named volume `oracle_data` mounts at `/opt/oracle/oradata`; `./oracle-init` mounts at `/opt/oracle/scripts/startup`. No application upload filesystem volume is declared. Both containers use `photoalbum-network` with the bridge driver; the application uses `restart: on-failure`.

## Startup Dependency Chain

1. **Compose configuration → required credential inputs.** Compose required-value interpolation checks `ORACLE_PASSWORD`, `APP_USER_PASSWORD`, and `APP_ADMIN_PASSWORD` before container startup.
2. **`oracle-db` → Oracle initialization → mounted startup scripts.** Initialization scripts require `ORACLE_PWD`, `APP_USER`, and `APP_USER_PASSWORD`. `01-create-user.sh` and `create-user.sh` perform overlapping schema-account initialization. The latter adds a fixed 30-second delay, not an active readiness loop. Actual image script execution behavior was not exercised.
3. **`oracle-db` health check → successful application-account SQL connection.** Compose pipes a simple SQL statement into SQL*Plus using `APP_USER` and `APP_USER_PASSWORD`, targeting the local database service `XE`. Interval: `30s`; timeout: `10s`; retries: `15`; start period: `180s`. This verifies a database connection rather than full application readiness.
4. **`photoalbum-java-app` → waits for healthy `oracle-db`.** Compose declares `depends_on: oracle-db: condition: service_healthy`, then launches the Java process. Required datasource/admin properties must also resolve for application startup.
5. **Application readiness → not explicitly modeled.** No application container health check, readiness probe, config-server retry, discovery dependency, or custom startup timeout was found. No health URL is listed because none is explicitly configured.

The standalone SQL health-check file is not referenced by the Compose health-check command. Compose startup ordering does not establish continuous dependency recovery after the application has started.

## Secrets & Sensitive Configuration

| Secret Reference | Type | Storage (masked) |
|---|---|---|
| `ORACLE_PASSWORD` → `ORACLE_PWD` | Database administrative password | Environment/optional ignored `.env` → database container environment; value omitted |
| `APP_USER` → `SPRING_DATASOURCE_USERNAME` → `spring.datasource.username` | Database account identity | Template, Compose, application property defaults, startup scripts; all values omitted |
| `APP_USER_PASSWORD` → `SPRING_DATASOURCE_PASSWORD` → `spring.datasource.password` | Database application password | Environment/optional ignored `.env` → both containers; value omitted |
| `APP_ADMIN_USERNAME` → `app.admin.username` | Application administrative identity | Environment/template, Compose, Java fallback; all values omitted |
| `APP_ADMIN_PASSWORD` → `app.admin.password` | Application administrative password | Environment/optional ignored `.env` → application container; value omitted |
| `spring.datasource.username`, `spring.datasource.password` | Test datasource credentials | Test properties; all values omitted, including empty values |
| `app.admin.username`, `app.admin.password` | Test administrative credentials | Test properties; all values omitted |
| Account selectors in `oracle-init/02-verify-user.sql` | Database identity references | Literal selectors in verification script; values omitted |

### Secrets Provisioning Workflow

1. Operator copies `.env.example` to the ignored `.env` or provides the named variables through the invoking shell. Example values are not reproduced or treated as approved credentials.
2. Compose validates required password inputs and passes database credentials into the database container. The same schema-account names bind to application datasource environment variables. Administrative application credentials bind separately to Spring security properties.
3. Database startup scripts authenticate through SQL*Plus and create the schema account if absent. The primary script grants `CREATE SESSION`, `CREATE TABLE`, `CREATE SEQUENCE`, `CREATE VIEW`, `CREATE PROCEDURE`, `CREATE TRIGGER`, `CREATE TYPE`, and `CREATE SYNONYM`; the additional script grants the first three. No DBA grant appears in these scripts.
4. Spring resolves datasource credentials and builds an in-memory administrative identity; `SecurityConfig` encodes the password using BCrypt. Runtime password hashing is not encryption of environment files or container environment values.
5. Existing-user branches do not rotate an existing schema password. Changing environment inputs alone is not an evidenced password-rotation workflow for a persisted database volume.

No managed identity, service principal, RBAC secret-store binding, encrypted property mechanism, Docker secret mount, or CI secret-retrieval workflow was found. Secrets are exposed to the application through environment values rather than a dedicated secret store. SQL*Plus invocation uses credentials at process invocation; values are intentionally not reproduced. Git ignore rules protect against ordinary accidental staging, not filesystem access or container inspection.

**Significant caveats:** database property files have no password fallback and Java security configuration requires `app.admin.password`; local startup outside Compose needs equivalent property provisioning. Several username fallbacks and test/example credential literals exist; none are reproduced. The verification SQL uses literal account selectors rather than the `APP_USER` binding, so customizing that identity may make its output misleading. The two schema initialization scripts overlap and only create accounts when absent.

## Feature Flags

| Flag Name | Default | Controlled By |
|---|---|---|
| Dedicated feature flags | None discovered | No flag framework, `@ConditionalOnProperty`, `@ConditionalOnExpression`, A/B configuration, or remote toggle source found |
| `server.servlet.encoding.enabled` / `server.servlet.encoding.force` | Both `true` | Spring property files/environment overrides; framework configuration switches, not product feature flags |
| `spring.jpa.show-sql` / `spring.jpa.properties.hibernate.format_sql` | Both `true`; `show-sql=false` in test | Spring profile/property resolution; diagnostic switches, not rollout controls |

Security policy is configured in Java rather than behind a property-driven feature toggle. Profiles select environment configuration, not a documented feature rollout mechanism.

## Framework & Runtime Versions

| Component | Version | Source |
|---|---|---|
| Application artifact | `1.0.0` | `pom.xml:15–18` |
| Spring Boot parent | `3.5.0` | `pom.xml:8–13` |
| Java source/target/runtime family | `21` | Maven properties and both Docker image tags |
| Maven container builder | `3.9.9` | `maven:3.9.9-eclipse-temurin-21`, `Dockerfile:2` |
| Maven workstation guidance | `3.9.x` | `WORKSHOP_SETUP_GUIDE.md:242`; no Maven wrapper/pinned host binary found |
| Runtime base image | `eclipse-temurin:21-jre` | `Dockerfile:17`; patch release and image digest not pinned |
| Oracle Database XE image | `21.3.0-xe` | `container-registry.oracle.com/database/express:21.3.0-xe`, Compose |
| Commons IO | `2.14.0` | Explicit dependency version in `pom.xml:68–73` |
| Spring Framework, Spring Security, Thymeleaf, Hibernate ORM, embedded servlet container, Jackson, validation libraries | Spring Boot parent-managed; exact resolved versions not inspected | Boot starters in `pom.xml`; no effective POM or resolved dependency report generated |
| Oracle JDBC `ojdbc8` | Parent-managed; exact resolved version not inspected | Runtime dependency in `pom.xml:49–54` |
| H2 and Spring Boot test libraries | Parent-managed; exact resolved versions not inspected | Test-scoped dependencies in `pom.xml:81–93` |
| Spring Boot DevTools | Parent-managed | Optional dependency in `pom.xml:95–100` |
| Spring Boot Maven plugin | Parent-managed | `pom.xml:103–110` |
| Docker Engine / Compose | Not pinned | Dockerfile and Compose syntax; installed/runtime versions not queried |
| SQL*Plus | Supplied by database image; exact client version not inspected | Compose health check and initialization scripts |

> Note: Some configuration sources or properties could not be fully identified. Effective values from external environments, image internals, and parent-managed dependency resolution were not inspected. This is a static inventory, not runtime validation or a security audit.
