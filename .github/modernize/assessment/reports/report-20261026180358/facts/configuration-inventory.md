# Configuration & Externalized Settings Inventory

Configuration comprises three Spring properties files, a Maven build, a Dockerfile, Docker Compose, an environment template, and two Oracle startup scripts. Two named runtime profiles (`docker`, `test`) supplement the default configuration; operational secrets are supplied externally rather than defaulted in runtime configuration.

Evidence references below are repository-relative paths and source line numbers. Secret values, including test values and template examples, are intentionally represented as `[MASKED]`.

## Configuration Sources

| Source | Type | Path/Location | Notes |
|---|---|---|---|
| Base application configuration | Spring properties | `src/main/resources/application.properties:1-34` | Default settings; datasource environment placeholders. |
| Docker profile | Spring properties | `src/main/resources/application-docker.properties:1-32` | Database host and logging overrides; several base values repeated. |
| Test profile | Spring test properties | `src/test/resources/application-test.properties:1-23` | H2, test administrator settings, upload and logging settings; test class activates profile. |
| Code-level configuration | Spring configuration and property injection | `src/main/java/com/photoalbum/config/SecurityConfig.java:25-59`; `src/main/java/com/photoalbum/service/impl/PhotoServiceImpl.java:37-43` | Administrator property injection, authentication settings, upload configuration consumers. |
| Build configuration | Maven XML | `pom.xml:8-110` | Parent dependency management, Java/compiler properties, dependencies and packaging plugin. |
| Container image configuration | Dockerfile | `Dockerfile:1-31` | Build/runtime images, exposed port, JVM options and startup command. |
| Service composition | Docker Compose | `docker-compose.yml:1-53` | Environment bindings, database readiness gate, ports, persistent volume and bridge network. |
| Operator environment template | Environment file template | `.env.example:1-17` | Documents copying to local `.env`; supplies variable names and non-production examples, with secret values omitted here. |
| Oracle startup configuration | Shell/SQL scripts | `oracle-init/01-create-user.sh:1-52`; `oracle-init/create-user.sh:1-47` | Require database credentials, default application username, create schema user and grants. Mounted by Compose. |
| Local secrets exclusion | Git ignore rules | `.gitignore:201-204` | Ignores `.env` and `.env.*`, except `.env.example`. |
| Optional workstation configuration | Setup guide | `WORKSHOP_SETUP_GUIDE.md:195-233` | Documents user-managed Maven `settings.xml` with Aliyun mirrors at `https://maven.aliyun.com/repository/public` and `https://maven.aliyun.com/repository/spring`; not a checked-in build setting. |

No application `bootstrap.*`, external configuration repository, Spring Cloud Config, Vault/Key Vault integration, Kubernetes configuration, or deployment resource manifest was found in the inspected application configuration. Workshop discussion of future Azure deployment is not active configuration (`README.md:3-6,248-252`). Assessment tooling configuration is outside the application configuration inventory; `.github/agents` was not accessed.

## Build Profiles

| Profile | Activation | Purpose | Key Dependencies/Plugins |
|---|---|---|---|
| Default Maven build; no named profiles declared | Normal Maven invocation; no `<profiles>` block | Package `com.photoalbum:photo-album:1.0.0` as a JAR with Java 21 | Spring Boot parent and Maven plugin; Web, Thymeleaf, JPA, Validation, Security, JSON; runtime Oracle JDBC; Commons IO; test starter and H2; optional DevTools (`pom.xml:8-110`). |
| Container build invocation, not a Maven profile | Docker build | Resolve dependencies, then package without executing tests | `mvn dependency:go-offline -B`; `mvn clean package -DskipTests` (`Dockerfile:6-14`). |

Build properties: `java.version=21`, `maven.compiler.source=21`, `maven.compiler.target=21`, `project.build.sourceEncoding=UTF-8` (`pom.xml:23-28`). Test-scoped dependencies and optional DevTools are dependency declarations, not separate profiles.

## Runtime Profiles

| Profile | Activation Method | Config Files | Key Overrides |
|---|---|---|---|
| Default / no named active profile | No active profile declared in base properties | `src/main/resources/application.properties` | Localhost Oracle URL; DEBUG application/web logging. |
| `docker` | Compose sets `SPRING_PROFILES_ACTIVE=docker` (`docker-compose.yml:33`) | Base properties plus `src/main/resources/application-docker.properties` | Oracle hostname `oracle-db`; application INFO, web WARN, Hibernate SQL DEBUG. |
| `test` | `@ActiveProfiles("test")` (`src/test/java/com/photoalbum/PhotoAlbumApplicationTests.java:7-8`) | Base properties plus test-classpath `src/test/resources/application-test.properties` | H2, `create-drop`, SQL logging false, administrator test credentials. |

No application `@Profile` annotations, explicit multi-profile composition, or additional profile-specific source files were found. Environment settings can override packaged Spring properties; profile-specific files override matching base entries. Test annotations activate `test` independently of Compose.

## Properties Inventory

### Application module

`base`, `docker`, and `test` below refer to the three properties files listed above. Where a profile does not override a key, it inherits the base value. Types are inferred from Spring property conventions or Java injection; no additional numeric ranges are declared.

| Property Key | Default | Profiles | Source |
|---|---|---|---|
| `server.port` | Integer `8080` | Base; repeated in docker | Base:2; docker:25 |
| `server.servlet.encoding.charset` | String `UTF-8` | Base; repeated in docker | Base:5; docker:9 |
| `server.servlet.encoding.enabled` | Boolean `true` | Base; repeated in docker | Base:6; docker:10 |
| `server.servlet.encoding.force` | Boolean `true` | Base; repeated in docker | Base:7; docker:11 |
| `spring.datasource.url` | `${SPRING_DATASOURCE_URL:jdbc:oracle:thin:@localhost:1521:XE}` | Docker fallback `jdbc:oracle:thin:@oracle-db:1521:XE`; test literal `jdbc:h2:mem:testdb` | Base:12; docker:3; test:2 |
| `spring.datasource.username` | `${SPRING_DATASOURCE_USERNAME:photoalbum}` | Docker same placeholder; test `sa` | Base:13; docker:4; test:4 |
| `spring.datasource.password` | `[MASKED]`; required `SPRING_DATASOURCE_PASSWORD`, no fallback | Docker same required reference; test value `[MASKED]` | Base:14; docker:5; test:5 |
| `spring.datasource.driver-class-name` | String `oracle.jdbc.OracleDriver` | Docker same; test `org.h2.Driver` | Base:15; docker:6; test:3 |
| `spring.jpa.database-platform` | String `org.hibernate.dialect.OracleDialect` | Docker same; test `org.hibernate.dialect.H2Dialect` | Base:18; docker:14; test:8 |
| `spring.jpa.hibernate.ddl-auto` | String `create` | Docker same; test `create-drop` | Base:19; docker:15; test:9 |
| `spring.jpa.show-sql` | Boolean `true` | Docker same; test `false` | Base:20; docker:16; test:10 |
| `spring.jpa.properties.hibernate.format_sql` | Boolean `true` | Base; repeated in docker; inherited in test | Base:21; docker:17 |
| `spring.servlet.multipart.max-file-size` | Data size `10MB` | Base; repeated in docker | Base:24; docker:26 |
| `spring.servlet.multipart.max-request-size` | Data size `50MB` | Base; repeated in docker | Base:25; docker:27 |
| `app.file-upload.max-file-size-bytes` | Long `10485760` | All three files | Base:28; docker:20; test:14; injection at `PhotoServiceImpl.java:42` |
| `app.file-upload.allowed-mime-types` | Comma-separated `image/jpeg,image/png,image/gif,image/webp` | All three files | Base:29; docker:21; test:15; string-array injection at `PhotoServiceImpl.java:43` |
| `app.file-upload.max-files-per-upload` | Integer `10` | All three files | Base:30; docker:22; test:16; no matching Java configuration consumer found |
| `app.file-upload.upload-path` | String `target/test-uploads`; no base value | Test only | Test:13; no matching Java configuration consumer found |
| `logging.level.com.photoalbum` | Enum-like level `DEBUG` | Docker `INFO`; test `DEBUG` | Base:33; docker:30; test:19 |
| `logging.level.org.springframework.web` | Enum-like level `DEBUG` | Docker `WARN`; test inherits base | Base:34; docker:31 |
| `logging.level.org.hibernate.SQL` | Not explicitly set in base | Docker `DEBUG` | Docker:32 |
| `app.admin.username` | String `admin` from injection fallback | Test explicitly `admin`; Docker supplies `APP_ADMIN_USERNAME` | `SecurityConfig.java:36`; test:22; `docker-compose.yml:37` |
| `app.admin.password` | `[MASKED]`; required, no injection fallback | Test explicitly configured `[MASKED]`; Docker supplies `APP_ADMIN_PASSWORD` | `SecurityConfig.java:37`; test:23; `docker-compose.yml:38` |

Java filename abbreviations refer to `src/main/java/com/photoalbum/config/SecurityConfig.java` and `src/main/java/com/photoalbum/service/impl/PhotoServiceImpl.java`.

### Compose and database settings

| Property Key | Default | Profiles | Source |
|---|---|---|---|
| `APP_USER` | String `photoalbum`; defaults independently in Compose and startup scripts | Compose/database startup | `docker-compose.yml:9,35`; `.env.example:9`; `oracle-init/01-create-user.sh:14`; `oracle-init/create-user.sh:12` |
| `ORACLE_PASSWORD` → `ORACLE_PWD` | `[MASKED]`; required Compose interpolation, no fallback | Compose/database startup | `docker-compose.yml:7`; `.env.example:6` |
| `APP_USER_PASSWORD` | `[MASKED]`; required Compose interpolation, no fallback | Passed to Oracle and mapped to application datasource password | `docker-compose.yml:10,36`; `.env.example:12` |
| `ORACLE_CHARACTERSET` | String `AL32UTF8` | Oracle container | `docker-compose.yml:8` |
| `APP_ADMIN_USERNAME` | String `admin` | Application container | `docker-compose.yml:37`; `.env.example:16` |
| `APP_ADMIN_PASSWORD` | `[MASKED]`; required Compose interpolation, no fallback | Application container | `docker-compose.yml:38`; `.env.example:17` |
| Oracle ports | Host/container `1521:1521`, `5500:5500` | Compose | `docker-compose.yml:11-13` |
| Application port mapping | Host/container `8080:8080` | Compose | `docker-compose.yml:39-40` |
| Persistent database volume | `oracle_data:/opt/oracle/oradata` | Compose | `docker-compose.yml:14-15,48-49` |
| Startup scripts mount | `./oracle-init:/opt/oracle/scripts/startup` | Compose | `docker-compose.yml:16` |
| Network | `photoalbum-network`, driver `bridge` | Both containers | `docker-compose.yml:17-18,44-45,51-53` |

Resolution chain: operator shell/local `.env` → Compose interpolation → container environment → Spring environment binding and `${SPRING_DATASOURCE_*}` placeholders → packaged profile/base configuration fallback. Compose maps `APP_USER` to `SPRING_DATASOURCE_USERNAME` and `APP_USER_PASSWORD` to `SPRING_DATASOURCE_PASSWORD`; administrator environment variables bind through Spring relaxed naming. `.env` is a Compose input, not a declared Spring dotenv loader. A direct Java invocation must provide datasource and administrator secrets independently.

## Startup Parameters & Resource Requirements

| Service | JVM/Runtime Options | Memory | Instance Count |
|---|---|---|---|
| `photoalbum-java-app` | Image default `JAVA_OPTS="-Xmx512m -Xms256m"`; `sh -c 'java $JAVA_OPTS -jar app.jar'`; `SPRING_PROFILES_ACTIVE=docker`; datasource URL/username/password and administrator environment overrides | Initial Java heap 256 MiB; maximum heap 512 MiB; no container memory limit/request or CPU allocation declared | No explicit replicas/scaling; one service container in ordinary Compose use |
| `oracle-db` | Oracle Express image; `ORACLE_PWD=[MASKED]`, `ORACLE_CHARACTERSET=AL32UTF8`, `APP_USER`, `APP_USER_PASSWORD=[MASKED]`; mounted startup scripts | No memory/CPU allocation declared; no JVM heap setting applicable in repository | No explicit replicas/scaling; one service container in ordinary Compose use |
| Local/test JVM | No checked-in explicit JVM heap or startup system properties | Not specified | Not specified |

Sources: `Dockerfile:25-31`; `docker-compose.yml:3-46`. Heap limits do not establish total application container memory. No explicit startup `-D` settings are present; Docker's `-DskipTests` is a build flag, not a runtime parameter. Application restart policy is `on-failure` (`docker-compose.yml:46`).

## Startup Dependency Chain

1. **Operator configuration → Compose interpolation:** supply required `ORACLE_PASSWORD`, `APP_USER_PASSWORD`, and `APP_ADMIN_PASSWORD` before containers are created; Compose uses required-value interpolation (`docker-compose.yml:7,10,36,38`).
2. **`oracle-db` → mounted startup scripts:** both scripts check required `ORACLE_PWD` and `APP_USER_PASSWORD`, default `APP_USER`, and connect with SQL*Plus to create the schema user if absent. `create-user.sh` includes an unconditional 30-second sleep; `01-create-user.sh` has no explicit readiness wait (`oracle-init/01-create-user.sh:11-29`; `oracle-init/create-user.sh:9-30`). Both are mounted; repository configuration does not independently define their execution order beyond the Oracle image's startup-script handling.
3. **`photoalbum-java-app` → waits for → healthy `oracle-db`:** Compose `depends_on.condition=service_healthy`. The Oracle health check runs SQL*Plus using the application user against `localhost:1521/XE`; this checks application-user database connectivity, not just an open TCP socket. Interval `30s`, timeout `10s`, retries `15`, start period `180s` (`docker-compose.yml:19-24,41-43`). Credentials in the command are masked here.
4. **Application startup → Spring context and datasource availability:** entry point invokes Spring Boot; mandatory administrator secret is injected during context creation (`src/main/java/com/photoalbum/PhotoAlbumApplication.java:9-14`; `SecurityConfig.java:34-42`). No application container health check, explicit application startup timeout, retry policy, discovery server, or config-server dependency is declared.

## Secrets & Sensitive Configuration

| Secret Reference | Type | Storage (masked) |
|---|---|---|
| `ORACLE_PASSWORD` → Oracle `ORACLE_PWD` | Database administrative password | Operator shell/local `.env` → database container environment; `[MASKED]` (`docker-compose.yml:7`; `.env.example:6`). |
| `APP_USER_PASSWORD` → Oracle startup scripts | Application database-user password | Operator shell/local `.env` → database container environment; `[MASKED]` (`docker-compose.yml:10`; startup scripts:13-15 and :11-13). |
| `APP_USER_PASSWORD` → `SPRING_DATASOURCE_PASSWORD` → `spring.datasource.password` | Application database connection password | Application environment → required Spring placeholder; `[MASKED]` (`docker-compose.yml:36`; base:14; docker:5). |
| `APP_ADMIN_PASSWORD` → `app.admin.password` | Administrator authentication password | Operator shell/local `.env` → application environment → required injection; `[MASKED]` (`docker-compose.yml:38`; `SecurityConfig.java:37`). |
| Test `spring.datasource.password` | Test datasource credential field | Checked-in test configuration; `[MASKED]`, including any empty value (`src/test/resources/application-test.properties:5`). |
| Test `app.admin.password` | Test administrator password | Checked-in test configuration; `[MASKED]` (`src/test/resources/application-test.properties:23`). |
| Example secret assignments | Operator template values | Checked-in `.env.example:6,12,17`; every example value `[MASKED]`; not production secrets provisioning. |

### Secrets Provisioning Workflow

1. Copy `.env.example` to `.env`, or export the named variables in the operator shell; replace example secrets with strong unique values. The template explicitly warns not to commit `.env` (`.env.example:1-3`); ignore rules cover it (`.gitignore:201-204`).
2. Compose refuses missing/empty required secret inputs, then binds administrative and schema credentials to Oracle and the matching schema credential to the application. The Oracle health check also references `APP_USER` and `APP_USER_PASSWORD` (`docker-compose.yml:7-20,35-38`).
3. Startup scripts authenticate as Oracle SYSTEM using `ORACLE_PWD`, check whether `APP_USER` exists, and create it only if absent. Grants are schema-oriented; the larger script lists create privileges and unlimited quota on USERS, not DBA (`oracle-init/01-create-user.sh:19-43`; `oracle-init/create-user.sh:21-40`). Existing-user passwords are not updated by these scripts, so changing an environment secret alone is not a database password-rotation workflow.
4. Spring resolves the application database secret and administrator secret from environment configuration. The administrator account is held in an in-memory user-details manager with BCrypt encoding (`SecurityConfig.java:28-42`).

No managed identity/service principal, remote secret store, encrypted-property mechanism, Docker secrets binding, or automated deployment secret retrieval was found. Environment values and SQL*Plus command arguments are not repository-defined at-rest secret encryption. Test credentials are deliberately configured in test resources and are not an operational secrets source.

## Feature Flags

| Flag Name | Default | Controlled By |
|---|---|---|
| Dedicated feature flags / rollout framework | None found | No application `@ConditionalOnProperty`, `@ConditionalOnExpression`, feature-flag client, A/B or rollout configuration found in Java sources or `pom.xml`. |
| Standard configuration switches, not product flags | Encoding enabled/force `true`; SQL output `true` (test `false`); Hibernate SQL formatting `true` | Properties documented above (`application.properties:5-7,20-21`; test:10). |

Profiles are environment selectors rather than feature flags. Security settings are fixed Java configuration, not property-controlled toggles: stateless sessions, HTTP Basic and CSRF disabled (`SecurityConfig.java:46-58`).

## Framework & Runtime Versions

| Component | Version | Source |
|---|---|---|
| Application artifact | `com.photoalbum:photo-album:1.0.0`, JAR | `pom.xml:15-18` |
| Spring Boot parent / dependency management | `3.5.0` | `pom.xml:8-13` |
| Java language/compiler target | `21` | `pom.xml:23-26` |
| Build container / Maven | `maven:3.9.9-eclipse-temurin-21` / Maven `3.9.9` | `Dockerfile:2` |
| Runtime container / Java | `eclipse-temurin:21-jre` / Java 21 JRE; patch/digest not pinned | `Dockerfile:17` |
| Oracle database image | `container-registry.oracle.com/database/express:21.3.0-xe` | `docker-compose.yml:4` |
| Commons IO | `2.14.0` | `pom.xml:68-73` |
| Spring Web, Thymeleaf, Data JPA, Validation, Security, JSON; DevTools and test starter | Spring Boot managed; no individual versions declared | `pom.xml:30-100` |
| Hibernate ORM | Transitive through Data JPA; exact resolved version not declared locally | `pom.xml:43-47` |
| Oracle JDBC | Artifact `ojdbc8`, runtime scope; version parent-managed, not explicitly declared | `pom.xml:49-54` |
| H2 | Test scope; version parent-managed, not explicitly declared | `pom.xml:88-93` |
| Spring Boot Maven plugin | Parent-managed, no explicit plugin version | `pom.xml:103-109` |
| Host Maven / JDK | Workshop guidance: Maven `3.9.x`, JDK `21`; installed versions not verified | `WORKSHOP_PREPARATION.md:29-39`; `WORKSHOP_SETUP_GUIDE.md:31-65` |
| Docker / Compose engine | Not pinned in application configuration | `Dockerfile`; `docker-compose.yml` |

> Note: Some configuration sources or properties could not be fully identified. Operator-local `.env`, workstation Maven settings, deployed overrides and exact resolved transitive dependency versions were not inspected; no build or runtime was executed for this documentation-only inventory.
