# Configuration & Externalized Settings Inventory

Configuration is supplied by three Spring properties files, Maven and Docker build definitions, Docker Compose, an example environment file, and Oracle initialization scripts. Two explicit runtime profiles (`docker` and `test`) complement the base configuration; production secrets are supplied through environment variables rather than a configured secret manager.

## Configuration Sources

| Source | Type | Path/Location | Notes |
|---|---|---|---|
| Base Spring settings | Properties | `src/main/resources/application.properties` | Default runtime configuration; required datasource password placeholder. |
| Docker profile | Properties | `src/main/resources/application-docker.properties` | Overrides database host and logging; repeats other base settings. |
| Test profile | Properties | `src/test/resources/application-test.properties` | Test-classpath H2 configuration and literal test administrator credential, masked below. |
| Build definition | Maven XML | `pom.xml` | Single module, dependency management, Java compilation and executable JAR plugin. |
| Image build/startup | Dockerfile | `Dockerfile` | Build/runtime images, exposed port and JVM heap options. |
| Local orchestration | Compose YAML | `docker-compose.yml` | Environment bindings, required secret interpolation, networking, storage and database health dependency. |
| Environment template | Dotenv | `.env.example` | Three literal placeholder passwords exist; all values are `[MASKED]`. `.env` is the documented local copy, not a Spring-loaded configuration file. |
| Secret-file exclusion | Git ignore rules | `.gitignore` | Ignores `.env` and `.env.*`, except `.env.example`. |
| Security bean settings | Java property injection | `src/main/java/com/photoalbum/config/SecurityConfig.java:34–42` | Administrator username fallback and mandatory password; BCrypt encoder. |
| Upload settings | Java property injection | `src/main/java/com/photoalbum/service/impl/PhotoServiceImpl.java:42–43` | Binds file-size and MIME-type properties. |
| Database startup | Shell/SQL | `oracle-init/01-create-user.sh`, `oracle-init/create-user.sh`, `oracle-init/02-verify-user.sql`, `oracle-init/healthcheck.sql` | Mounted into Oracle startup directory; credentials taken from environment. Verification SQL hard-codes the default schema name. |
| Setup guidance | Documentation | `README.md`, `WORKSHOP_SETUP_GUIDE.md` | JDK/Maven prerequisites; future Azure migration guidance is not active runtime configuration. |

No application bootstrap files, external configuration repository URI, Spring Cloud Config, Azure App Configuration, Vault, Key Vault, AWS secret/config service integration, Kubernetes manifests, or application deployment workflow were found in the inspected application configuration. Assessment tooling is not treated as runtime configuration; `.github/agents` was not read.

## Build Profiles

| Profile | Activation | Purpose | Key Dependencies/Plugins |
|---|---|---|---|
| Default build (not a named profile) | Ordinary Maven invocation | Java 21 executable JAR, artifact `com.photoalbum:photo-album:1.0.0` | Spring Boot Maven plugin; web, Thymeleaf, JPA, validation, security and JSON starters; runtime Oracle JDBC; Commons IO; optional DevTools; test starter and H2. |
| Container build (not a Maven profile) | Docker build / Compose build | Multi-stage image packaging | `mvn dependency:go-offline -B`, then `mvn clean package -DskipTests`. |

No `<profiles>` section or profile-specific dependencies/plugins are declared. `-DskipTests` is a build system property, not runtime-profile activation.

Build properties: `java.version=21`, `maven.compiler.source=21`, `maven.compiler.target=21`, and `project.build.sourceEncoding=UTF-8` (`pom.xml:23–28`).

## Runtime Profiles

| Profile | Activation Method | Config Files | Key Overrides |
|---|---|---|---|
| Base/default | No explicitly active profile | `application.properties` | Oracle localhost URL fallback, port 8080, DEBUG application/web logging. |
| `docker` | Compose sets `SPRING_PROFILES_ACTIVE=docker` | Base plus `application-docker.properties` | Oracle Compose service hostname; application INFO, Spring web WARN, Hibernate SQL DEBUG. |
| `test` | `@ActiveProfiles("test")` in `PhotoAlbumApplicationTests.java:8` | Base plus test-classpath `application-test.properties` | H2 datasource/dialect, create-drop, SQL logging off, test administrator credential. |

No `@Profile` beans, explicit profile groups/includes, or multi-profile composition were found. Environment overrides have precedence over packaged properties; the profile-specific file overrides corresponding base-file entries. `.env` provides Compose interpolation values and is not automatically loaded by the standalone JAR.

## Properties Inventory

### Photo Album Spring settings

Values below are declared defaults/overrides, not observed deployment values. `B` = base, `D` = docker, `T` = test; unspecified profile entries inherit the base value. Sensitive values are masked even when examples or test-only.

| Property Key | Default | Profiles | Source |
|---|---|---|---|
| `server.port` | `8080` (integer TCP port) | B, D | Base and Docker properties |
| `server.servlet.encoding.charset` | `UTF-8` (charset string) | B, D | Base and Docker properties |
| `server.servlet.encoding.enabled` | `true` (boolean) | B, D | Base and Docker properties |
| `server.servlet.encoding.force` | `true` (boolean) | B, D | Base and Docker properties |
| `spring.datasource.url` | `${SPRING_DATASOURCE_URL:jdbc:oracle:thin:@localhost:1521:XE}` | D fallback: `jdbc:oracle:thin:@oracle-db:1521:XE`; T: `jdbc:h2:mem:testdb` | All three properties files; Compose supplies Docker URL directly |
| `spring.datasource.username` | `${SPRING_DATASOURCE_USERNAME:photoalbum}` | D identical; T: `sa` | All three properties files; Compose maps `APP_USER` |
| `spring.datasource.password` | Required `${SPRING_DATASOURCE_PASSWORD}`; no base fallback | D identical; T declares an empty password, `[MASKED]` | All three properties files; Compose maps required `APP_USER_PASSWORD` |
| `spring.datasource.driver-class-name` | `oracle.jdbc.OracleDriver` | B, D; T: `org.h2.Driver` | All three properties files |
| `spring.jpa.database-platform` | `org.hibernate.dialect.OracleDialect` | B, D; T: `org.hibernate.dialect.H2Dialect` | All three properties files |
| `spring.jpa.hibernate.ddl-auto` | `create` (enum string) | B, D; T: `create-drop` | All three properties files |
| `spring.jpa.show-sql` | `true` (boolean) | B, D; T: `false` | All three properties files |
| `spring.jpa.properties.hibernate.format_sql` | `true` (boolean) | B, D; T inherits | Base and Docker properties |
| `spring.servlet.multipart.max-file-size` | `10MB` (data size) | B, D | Base and Docker properties |
| `spring.servlet.multipart.max-request-size` | `50MB` (data size) | B, D | Base and Docker properties |
| `app.file-upload.max-file-size-bytes` | `10485760` (long, bytes) | B, D, T | All three properties files; service constructor binding |
| `app.file-upload.allowed-mime-types` | `image/jpeg,image/png,image/gif,image/webp` (string array) | B, D, T | All three properties files; service constructor binding |
| `app.file-upload.max-files-per-upload` | `10` (integer) | B, D, T | All three properties files; no consuming property binding found |
| `app.file-upload.upload-path` | No base declaration | T: `target/test-uploads` (path string) | Test properties only; no consuming property binding found |
| `logging.level.com.photoalbum` | `DEBUG` (log level) | D: `INFO`; T: `DEBUG` | All three properties files |
| `logging.level.org.springframework.web` | `DEBUG` (log level) | D: `WARN`; T inherits base | Base and Docker properties |
| `logging.level.org.hibernate.SQL` | No base declaration | D: `DEBUG` | Docker properties |
| `app.admin.username` | `admin` (string fallback in `@Value`) | All; T explicitly `admin` | `SecurityConfig.java:36`, test properties; relaxed environment binding `APP_ADMIN_USERNAME` |
| `app.admin.password` | Required `${app.admin.password}`; no fallback | T literal credential `[MASKED]` | `SecurityConfig.java:37`, test properties; relaxed environment binding `APP_ADMIN_PASSWORD` |

No declared numeric configuration ranges were found beyond types/units. Non-property constants and entity validation rules are outside this inventory.

### Compose and Oracle configuration bindings

| Property Key | Default | Profiles | Source |
|---|---|---|---|
| `ORACLE_PASSWORD` → database `ORACLE_PWD` | Required, no fallback; `[MASKED]` | Compose | `.env`/shell → `docker-compose.yml:7` |
| `ORACLE_CHARACTERSET` | `AL32UTF8` | Compose database | `docker-compose.yml:8` |
| `APP_USER` | `photoalbum` | Compose database and app mapping | `.env.example`, Compose `:-` fallback; shell scripts also default this variable |
| `APP_USER_PASSWORD` | Required, no fallback; `[MASKED]` | Compose database; app datasource binding | `.env`/shell → Compose → database and `SPRING_DATASOURCE_PASSWORD` |
| `APP_ADMIN_USERNAME` | `admin` | Compose app | `.env.example`, Compose `:-` fallback |
| `APP_ADMIN_PASSWORD` | Required, no fallback; `[MASKED]` | Compose app | `.env`/shell → Compose → Spring administrator password |
| `SPRING_DATASOURCE_URL` | `jdbc:oracle:thin:@oracle-db:1521:XE` | Compose app | Literal Compose environment value |
| `SPRING_DATASOURCE_USERNAME` | Value of `APP_USER`, fallback `photoalbum` | Compose app | Compose environment |

Compose requires nonempty values using `${VARIABLE:?…}` for each of its three passwords. The Oracle scripts separately require `ORACLE_PWD` and `APP_USER_PASSWORD`; `.env.example` alone does not supply process environment to a standalone Java invocation.

## Startup Parameters & Resource Requirements

| Service | JVM/Runtime Options | Memory | Instance Count |
|---|---|---|---|
| `photoalbum-java-app` | `java $JAVA_OPTS -jar app.jar`; Docker `JAVA_OPTS="-Xmx512m -Xms256m"`; Compose `SPRING_PROFILES_ACTIVE=docker` | JVM initial heap 256 MiB, maximum heap 512 MiB; no container memory limit/request | Not explicitly configured; one service container in the supplied Compose setup |
| `oracle-db` | Oracle Express image; `ORACLE_CHARACTERSET=AL32UTF8`; required environment credentials | No explicit memory allocation | Not explicitly configured; one service container in the supplied Compose setup |

No CPU limits, autoscaling rules, runtime `-D` properties, or container-to-heap sizing policy are declared. `JAVA_OPTS` can be replaced through the container environment, but Compose does not expose a dedicated override entry. The app publishes `8080:8080`; Oracle publishes `1521:1521` and `5500:5500`. Both use bridge network `photoalbum-network`. Oracle persists data through `oracle_data:/opt/oracle/oradata`; `./oracle-init` is mounted at `/opt/oracle/scripts/startup`. App restart policy is `on-failure`; no explicit restart policy is set for Oracle.

## Startup Dependency Chain

1. Compose interpolation → requires all three supplied password variables before service creation.
2. `oracle-db` → Oracle startup/init scripts → application schema credentials and grants. `01-create-user.sh` creates the user if absent and applies schema-oriented grants without DBA; `create-user.sh` additionally has a fixed `sleep 30`, not a readiness polling loop.
3. Oracle health check → authenticated SQL*Plus invocation using `APP_USER` and `APP_USER_PASSWORD`, with inline `SELECT 1 FROM DUAL;` piped to SQL*Plus and shell `|| exit 1`. Interval **30s**, timeout **10s**, retries **15**, start period **180s**. Compose escapes variable expansion with `$$` so references resolve inside the container. No explicit SQL error-exit directive is configured, so the supplied check should not be assumed to validate every SQL error through its process status. The separate `healthcheck.sql` contains a similar query but is not referenced by the Compose health command.
4. `photoalbum-java-app` → waits for `oracle-db` via Compose `depends_on: condition: service_healthy`; then starts Java with the Docker profile. There is no explicit application health check, readiness probe, config-server retry, or application startup timeout setting.

`02-verify-user.sql` checks the literal default schema identifier rather than deriving it from `APP_USER`, which matters when that variable is changed. Mounted startup scripts are image-managed; no additional explicit inter-script orchestration is declared in Compose.

## Secrets & Sensitive Configuration

| Secret Reference | Type | Storage (masked) |
|---|---|---|
| `ORACLE_PASSWORD` → `ORACLE_PWD` | Oracle administrator password | `.env`/shell and database container environment; `.env.example` contains a literal placeholder `[MASKED]` |
| `APP_USER_PASSWORD` → `SPRING_DATASOURCE_PASSWORD` | Application database password | `.env`/shell, both container environments; template literal `[MASKED]` |
| `APP_ADMIN_PASSWORD` → `app.admin.password` | Application administrator password | `.env`/shell and application container environment; template literal `[MASKED]` |
| `spring.datasource.password` in test properties | Test database password setting | Explicit empty assignment; `[MASKED]` |
| `app.admin.password` in test properties | Literal test administrator password | Committed test properties; `[MASKED]` |

Usernames `photoalbum`, `admin`, and `sa` are identifiers, not password values. No encrypted property syntax, Jasypt, sealed secret, managed secret-store reference, or encrypted-at-rest local configuration workflow is configured.

### Secrets Provisioning Workflow

1. Operator copies `.env.example` to ignored `.env`, replaces all three placeholder passwords with unique values, or supplies equivalent shell environment variables.
2. Compose checks required values and binds the Oracle administrator credential to the database container only; the application schema password is shared by the database initialization and application datasource. The administrator login password is supplied to the Java application.
3. Initialization scripts authenticate to Oracle as SYSDBA using the administrator credential and create/configure the schema account with scoped creation privileges and tablespace quota. No cloud identity/RBAC provisioning is present.
4. Spring resolves datasource and administrator password properties from the application environment. `SecurityConfig` BCrypt-encodes the administrator password into an in-memory user store.
5. Tests substitute test-classpath credentials. No automated secret retrieval, rotation, deployment identity workflow, Docker Secrets, or Kubernetes Secrets is supplied.

## Feature Flags

| Flag Name | Default | Controlled By |
|---|---|---|
| `spring.jpa.show-sql` | `true`; test `false` | Base/Docker/test property files; environment override possible |
| `spring.jpa.properties.hibernate.format_sql` | `true` | Base/Docker property files |
| `server.servlet.encoding.enabled` | `true` | Base/Docker property files |
| `server.servlet.encoding.force` | `true` | Base/Docker property files |

These are framework configuration switches, not business-feature rollout flags. No dedicated feature flag SDK, remote flag service, A/B configuration, `@ConditionalOnProperty`, or `@ConditionalOnExpression` was found in application source. Security behavior is configured directly in Java, not through custom feature toggles.

## Framework & Runtime Versions

| Component | Version | Source |
|---|---|---|
| Application artifact | `1.0.0` | `pom.xml:15–18` |
| Spring Boot parent | `3.5.0` | `pom.xml:8–13` |
| Java source/target | `21` | `pom.xml:23–28` |
| Build image / Maven | `maven:3.9.9-eclipse-temurin-21` / Maven `3.9.9` | `Dockerfile:2` |
| Runtime image / JRE | `eclipse-temurin:21-jre` / Java `21` | `Dockerfile:17`; patch version/digest not pinned |
| Oracle Database image | `container-registry.oracle.com/database/express:21.3.0-xe` | `docker-compose.yml:4` |
| Commons IO | `2.14.0` | `pom.xml:68–73` |
| Spring web, Thymeleaf, Data JPA, validation, security, JSON, test and DevTools starters | Managed by Spring Boot `3.5.0`; individual effective versions not explicitly declared | `pom.xml` dependencies |
| Hibernate ORM / embedded servlet container / Spring Security | Transitive, Boot-managed; exact resolved versions not inspected | JPA/web/security starters |
| Oracle JDBC | Artifact `ojdbc8`; Boot-managed version not explicitly declared | `pom.xml:49–54` |
| H2 | Boot-managed version not explicitly declared; test scope | `pom.xml:88–93` |
| Local Maven / Docker Engine / Compose | Not pinned in project; setup guide recommends Maven `3.9.x` | `WORKSHOP_SETUP_GUIDE.md`; no Maven wrapper found |

Inventory is based on static file inspection only. No source changes, tests, builds, dependency resolution, or commits were performed.
