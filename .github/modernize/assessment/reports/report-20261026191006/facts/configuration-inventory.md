# Configuration & Externalized Settings Inventory

Configuration is distributed across three Spring properties files, Docker Compose, a dotenv example, the Dockerfile, Maven configuration, and code/script defaults. Two named runtime profiles (`docker`, `test`) supplement the base settings; secrets are supplied through environment variables rather than an integrated secret store.

All credential values, including usernames, test credentials, and example defaults, are represented as `[MASKED]`. Paths are relative to the repository root. This inventory describes checked-in configuration, not a verified running environment.

## Configuration Sources

| Source | Type | Path/Location | Notes |
|---|---|---|---|
| Base application settings | Spring properties | `src/main/resources/application.properties` | Default settings and environment placeholders. |
| Docker runtime settings | Spring profile properties | `src/main/resources/application-docker.properties` | Overrides the base configuration when `docker` is active. |
| Test runtime settings | Spring profile properties | `src/test/resources/application-test.properties` | Test-classpath H2 settings and masked test credentials. |
| Container orchestration | Docker Compose | `docker-compose.yml` | Database/application environment, ports, readiness dependency, storage, network, restart policy. |
| Environment template | dotenv example | `.env.example` | Documents five credential variables; copy to local `.env` and replace example values. |
| Local secret input | dotenv / process environment | `.env` or invoking shell | Referenced by Compose; actual `.env` contents were not inspected. `.gitignore:201–204` excludes `.env` and `.env.*`, except `.env.example`. |
| Container build/runtime | Dockerfile | `Dockerfile` | Build/runtime images, Java heap options and entrypoint. |
| Build configuration | Maven XML | `pom.xml` | Parent/BOM, compiler target, dependencies and packaging plugin. |
| Security defaults | Java configuration | `src/main/java/com/photoalbum/config/SecurityConfig.java` | `@Value` credential references; in-memory account and BCrypt encoder. |
| Upload property consumers | Java constructor injection | `src/main/java/com/photoalbum/service/impl/PhotoServiceImpl.java:42–43` | Two injected upload settings; no inline defaults. |
| Test profile selection | Java test annotation | `src/test/java/com/photoalbum/PhotoAlbumApplicationTests.java:7–8` | `@SpringBootTest` and `@ActiveProfiles("test")`. |
| Database startup initialization | Shell / SQL | `oracle-init/01-create-user.sh`, `oracle-init/02-verify-user.sql`, `oracle-init/create-user.sh`, `oracle-init/healthcheck.sql` | Entire directory mounted at `/opt/oracle/scripts/startup`; environment-driven user creation and SQL checks. |
| Build workstation guidance | Documentation | `README.md`, `WORKSHOP_SETUP_GUIDE.md`, `WORKSHOP_PREPARATION.md` | Tool prerequisites, local Compose startup and optional external Maven mirror settings; not deployed runtime configuration. |

No application `bootstrap.*`, YAML application configuration, ConfigMap, Kubernetes Secret, checked-in cloud IaC, or CI deployment workflow was discovered outside the excluded assessment/agent material. No Spring Cloud Config, Consul, AWS AppConfig, Azure App Configuration, or external application-configuration Git repository is configured. The repository URL in the guides is an application source repository, not a configuration server.

The README discusses Azure Key Vault and a user-assigned managed identity as prospective workshop deployment resources. No executable Key Vault integration, vault URI, secret path, access policy, or deployment binding is present in the inspected application configuration.

## Build Profiles

| Profile | Activation | Purpose | Key Dependencies/Plugins |
|---|---|---|---|
| Default Maven build; no named profiles | Normal Maven invocation; no `<profiles>` in `pom.xml` | Java 21 compilation and executable JAR packaging | Spring Boot Maven plugin; Web, Thymeleaf, Data JPA, Validation, Security and JSON starters; Oracle JDBC runtime; Commons IO; optional DevTools; test-scoped Spring Boot Test and H2. |
| Container packaging invocation; not a Maven profile | Docker build executes `mvn clean package -DskipTests` | Packages the application without running tests | Same dependencies/plugins as default build; earlier layer runs `mvn dependency:go-offline -B`. |

Build properties in `pom.xml:23–28`: `java.version=21`, `maven.compiler.source=21`, `maven.compiler.target=21`, and `project.build.sourceEncoding=UTF-8`. Packaging is `jar`; coordinates are `com.photoalbum:photo-album:1.0.0`.

`WORKSHOP_SETUP_GUIDE.md:195–223` documents optional user-level Maven settings at `C:\Users\<user>\.m2\settings.xml`, not a repository settings file:

| Setting | Value |
|---|---|
| Mirror ID `aliyun-maven`; `mirrorOf` | `central` |
| Mirror URL | `https://maven.aliyun.com/repository/public` |
| Mirror ID `aliyun-spring`; `mirrorOf` | `spring-releases,spring-milestones,spring-snapshots` |
| Mirror URL | `https://maven.aliyun.com/repository/spring` |

No build-profile activation by environment variable/system property is declared. No Maven wrapper or explicit Maven version enforcement is checked in.

## Runtime Profiles

| Profile | Activation Method | Config Files | Key Overrides |
|---|---|---|---|
| Default / no explicitly active profile | Standalone startup without a profile selector | `src/main/resources/application.properties` | Local Oracle URL fallback, DEBUG application/web logging, base upload settings. Required datasource/admin password inputs still apply. |
| `docker` | Compose sets `SPRING_PROFILES_ACTIVE=docker` | Base settings plus `src/main/resources/application-docker.properties` | Oracle service-host fallback; application logging INFO, web WARN, Hibernate SQL DEBUG. Compose supplies datasource and admin credential variables. |
| `test` | `@ActiveProfiles("test")` on the context-load test | Base settings plus `src/test/resources/application-test.properties` | H2 URL/driver/dialect, `create-drop`, SQL display false, test upload path, masked datasource/admin credentials. |

No `@Profile`, profile groups, `spring.profiles.include`, or application-file `spring.profiles.active` declaration was found. Multiple profiles can be supplied using Spring's normal comma-separated activation, but no combined activation is declared or tested here.

## Properties Inventory

### Spring application: `photo-album`

“Default” below means the checked-in base value or explicitly stated code default, not an inferred framework default. `base`, `docker`, and `test` refer to the three properties files listed above. Types are stated in the key column; no extra application-specific ranges are asserted where none are configured.

| Property Key | Default | Profiles | Source |
|---|---|---|---|
| `server.port` (integer TCP port) | `8080` | Repeated in `docker`; inherited by `test` | base:2; docker:25 |
| `server.servlet.encoding.charset` (charset string) | `UTF-8` | Repeated in `docker`; inherited by `test` | base:5; docker:9 |
| `server.servlet.encoding.enabled` (boolean) | `true` | Repeated in `docker`; inherited by `test` | base:6; docker:10 |
| `server.servlet.encoding.force` (boolean) | `true` | Repeated in `docker`; inherited by `test` | base:7; docker:11 |
| `spring.datasource.url` (JDBC URL string) | `${SPRING_DATASOURCE_URL:jdbc:oracle:thin:@localhost:1521:XE}` | `docker`: `${SPRING_DATASOURCE_URL:jdbc:oracle:thin:@oracle-db:1521:XE}`; `test`: `jdbc:h2:mem:testdb` | base:12; docker:3; test:2 |
| `spring.datasource.username` (credential string) | `[MASKED]`; reference `SPRING_DATASOURCE_USERNAME` with fallback | Same reference in `docker`; literal test credential `[MASKED]` | base:13; docker:4; test:4 |
| `spring.datasource.password` (secret string) | No fallback; reference `SPRING_DATASOURCE_PASSWORD`; value `[MASKED]` | Same reference in `docker`; test value `[MASKED]` | base:14; docker:5; test:5 |
| `spring.datasource.driver-class-name` (class name) | `oracle.jdbc.OracleDriver` | Repeated in `docker`; `test`: `org.h2.Driver` | base:15; docker:6; test:3 |
| `spring.jpa.database-platform` (class name) | `org.hibernate.dialect.OracleDialect` | Repeated in `docker`; `test`: `org.hibernate.dialect.H2Dialect` | base:18; docker:14; test:8 |
| `spring.jpa.hibernate.ddl-auto` (enum string) | `create` | Repeated in `docker`; `test`: `create-drop` | base:19; docker:15; test:9 |
| `spring.jpa.show-sql` (boolean) | `true` | Repeated in `docker`; `test`: `false` | base:20; docker:16; test:10 |
| `spring.jpa.properties.hibernate.format_sql` (boolean) | `true` | Repeated in `docker`; inherited by `test` | base:21; docker:17 |
| `spring.servlet.multipart.max-file-size` (data size) | `10MB` | Repeated in `docker`; inherited by `test` | base:24; docker:26 |
| `spring.servlet.multipart.max-request-size` (data size) | `50MB` | Repeated in `docker`; inherited by `test` | base:25; docker:27 |
| `app.file-upload.max-file-size-bytes` (long integer, bytes) | `10485760` | Same value in `docker` and `test` | base:28; docker:20; test:14; constructor `@Value` |
| `app.file-upload.allowed-mime-types` (comma-separated string array) | `image/jpeg,image/png,image/gif,image/webp` | Same value in `docker` and `test` | base:29; docker:21; test:15; constructor `@Value` |
| `app.file-upload.max-files-per-upload` (integer) | `10` | Same value in `docker` and `test` | base:30; docker:22; test:16 |
| `app.file-upload.upload-path` (path string) | Not declared in base | `test`: `target/test-uploads` | test:13 |
| `logging.level.com.photoalbum` (log-level string) | `DEBUG` | `docker`: `INFO`; `test`: `DEBUG` | base:33; docker:30; test:19 |
| `logging.level.org.springframework.web` (log-level string) | `DEBUG` | `docker`: `WARN`; inherited by `test` | base:34; docker:31 |
| `logging.level.org.hibernate.SQL` (log-level string) | Not explicitly declared in base | `docker`: `DEBUG` | docker:32 |
| `app.admin.username` (credential string) | Code fallback `[MASKED]`; environment binding `APP_ADMIN_USERNAME` | `test`: literal credential `[MASKED]`; Compose supplies environment value | `SecurityConfig.java:36`; test:22; Compose:37 |
| `app.admin.password` (secret string) | No code fallback; environment binding `APP_ADMIN_PASSWORD`; value `[MASKED]` | `test`: literal credential `[MASKED]`; Compose requires environment input | `SecurityConfig.java:37`; test:23; Compose:38 |

The source injects `max-file-size-bytes` and `allowed-mime-types`; no consumer of `max-files-per-upload` or `upload-path` was found. These latter keys are listed as declarations, not claimed to be effective runtime controls.

### Database container and environment bindings

| Property Key | Default | Profiles | Source |
|---|---|---|---|
| `ORACLE_PASSWORD` → database `ORACLE_PWD` (secret string) | Required Compose input; `[MASKED]` | Compose deployment | `.env.example`; Compose:7; initialization scripts |
| `ORACLE_CHARACTERSET` (charset string) | `AL32UTF8` | Database container | Compose:8 |
| `APP_USER` (credential string) | Fallback `[MASKED]` | Database initialization and application datasource binding | `.env.example`; Compose:9,35; both initialization shell scripts |
| `APP_USER_PASSWORD` (secret string) | Required; `[MASKED]` | Database initialization, health check and application | `.env.example`; Compose:10,20,36 |
| `SPRING_DATASOURCE_URL` (JDBC URL string) | Compose sets `jdbc:oracle:thin:@oracle-db:1521:XE` | `docker` | Compose:34 |
| `SPRING_DATASOURCE_USERNAME` (credential string) | Bound from `APP_USER`; fallback `[MASKED]` | `docker` | Compose:35 |
| `SPRING_DATASOURCE_PASSWORD` (secret string) | Bound from required `APP_USER_PASSWORD`; `[MASKED]` | `docker` | Compose:36 |
| `APP_ADMIN_USERNAME` (credential string) | Fallback `[MASKED]` | `docker` | `.env.example`; Compose:37 |
| `APP_ADMIN_PASSWORD` (secret string) | Required; `[MASKED]` | `docker` | `.env.example`; Compose:38 |
| `APP_USER_UPPER` (derived credential identifier) | Uppercased `APP_USER`; `[MASKED]` | Initialization shell scripts | `oracle-init/01-create-user.sh`, `oracle-init/create-user.sh` |

Resolution chain: Compose interpolates `${VAR}`, `${VAR:-fallback}` and `${VAR:?error}` from its invocation environment/local `.env`, then passes the declared environment entries to containers. Spring does not automatically load this dotenv file during standalone Java startup. Spring combines base settings with active-profile settings; higher-priority environment variables, JVM properties and command-line arguments can override file settings using normal Spring Boot resolution. `${SPRING_DATASOURCE_*}` placeholders resolve from that environment. `app.admin.*` uses Spring environment binding from `APP_ADMIN_*`, plus the username-only code fallback. Test properties are available only on the test classpath.

## Startup Parameters & Resource Requirements

| Service | JVM/Runtime Options | Memory | Instance Count |
|---|---|---|---|
| `photoalbum-java-app` | `JAVA_OPTS="-Xmx512m -Xms256m"`; entrypoint `sh -c "java $JAVA_OPTS -jar app.jar"` in `/app`; `SPRING_PROFILES_ACTIVE=docker` under Compose | Initial heap 256 MiB, maximum heap 512 MiB; no container memory request/limit; native/JVM overhead not budgeted | No explicit replicas; one container in ordinary Compose startup |
| `oracle-db` | Oracle Express container; credential/environment inputs above; no JVM flags declared | No explicit memory request/limit | No explicit replicas; one container in ordinary Compose startup |
| Maven/test execution | Java source/target 21; Docker packaging uses build-time `-DskipTests`, not a JVM startup option | No test/build heap settings declared | Not configured |

Neither CPU limits/reservations, autoscaling rules, cloud instance sizing, nor runtime `-D` system properties are specified. `JAVA_OPTS` can be replaced as a container environment value, but Compose does not explicitly forward a host `JAVA_OPTS`. `JAVA_HOME` and the Java/Maven `PATH` entries are workstation setup guidance in `WORKSHOP_SETUP_GUIDE.md`, not application properties.

Container/network settings from `docker-compose.yml`: application host/container port `8080:8080`; Oracle `1521:1521` and `5500:5500`; shared bridge network `photoalbum-network`. Oracle storage uses named volume `oracle_data:/opt/oracle/oradata`; startup scripts use bind mount `./oracle-init:/opt/oracle/scripts/startup`. No application volume is configured. The application restart policy is `on-failure`; no database restart policy is explicitly declared.

## Startup Dependency Chain

1. **Compose interpolation → required environment inputs.** Missing `ORACLE_PASSWORD`, `APP_USER_PASSWORD`, or `APP_ADMIN_PASSWORD` fails Compose interpolation before service startup. Initialization scripts additionally require `ORACLE_PWD` and `APP_USER_PASSWORD` using shell checks.
2. **`oracle-db` → Oracle startup scripts.** The startup directory contains `01-create-user.sh`, `02-verify-user.sql`, `create-user.sh`, and `healthcheck.sql`. The scripts provision/check the application account; actual script execution ordering is delegated to the Oracle image. `create-user.sh` includes a fixed `sleep 30`, rather than a readiness polling loop.
3. **`photoalbum-java-app` → waits for → `oracle-db`.** Compose `depends_on.condition=service_healthy` gates application startup. The database health check invokes SQL*Plus with `APP_USER` / `APP_USER_PASSWORD` and `@/opt/oracle/scripts/startup/healthcheck.sql`, which executes `SELECT 1 FROM DUAL`. Connection credential values are masked.
4. **Application context → datasource and security inputs.** Standalone/default and Docker startup require datasource/admin password configuration. The `test` profile supplies masked test values and uses an in-memory database, so it does not require the Oracle container.

Database health-check timing: interval `30s`, timeout `10s`, retries `15`, start period `180s` (`docker-compose.yml:19–24`). No explicit application health check, readiness probe, retry/backoff setting, or application startup timeout is declared. No Config Server/discovery-service dependency exists in the inspected configuration.

The verification SQL contains a fixed application-account identifier `[MASKED]`, whereas the shell scripts accept `APP_USER`; verification is therefore not fully parameterized for account overrides. The mounted scripts include overlapping user-creation logic. This inventory does not assume that an account password is rotated when a persisted account already exists.

## Secrets & Sensitive Configuration

| Secret Reference | Type | Storage (masked) |
|---|---|---|
| `ORACLE_PASSWORD` → `ORACLE_PWD` | Database administrative password | Local environment / ignored `.env`; example value `[MASKED]`; passed to Oracle and initialization scripts |
| `APP_USER` / `APP_USER_UPPER` | Database account identifier | Environment, template and script fallbacks `[MASKED]` |
| `APP_USER_PASSWORD` | Application database password | Required Compose/environment input; template value `[MASKED]` |
| `SPRING_DATASOURCE_USERNAME` / `spring.datasource.username` | Datasource account identifier | Environment/reference fallback or test literal `[MASKED]` |
| `SPRING_DATASOURCE_PASSWORD` / `spring.datasource.password` | Datasource password | Environment placeholder or test literal `[MASKED]` |
| `APP_ADMIN_USERNAME` / `app.admin.username` | Application administrator account identifier | Template, Compose/code fallback, test literal `[MASKED]` |
| `APP_ADMIN_PASSWORD` / `app.admin.password` | Application administrator password | Required production environment input; example/test literals `[MASKED]` |
| SQL*Plus connection expressions | Credential-bearing connection arguments | Constructed from environment variables in scripts/Compose; credential portions `[MASKED]` |

### Secrets Provisioning Workflow

1. Operator copies `.env.example` to ignored `.env` and replaces credential examples, or provides the variables in the invoking shell. Examples are not production defaults and all values are masked here.
2. Compose maps `ORACLE_PASSWORD` to `ORACLE_PWD`, and supplies `APP_USER` / `APP_USER_PASSWORD` to the database container. Initialization shell scripts connect with database administrative credentials, create the application account if absent, and grant privileges. `01-create-user.sh` explicitly documents least-privilege grants rather than DBA; the second creation script has separate logic.
3. The database readiness check uses the application account. Once healthy, Compose starts the application and binds `APP_USER` / `APP_USER_PASSWORD` into `SPRING_DATASOURCE_USERNAME` / `SPRING_DATASOURCE_PASSWORD`.
4. Compose separately binds `APP_ADMIN_USERNAME` / `APP_ADMIN_PASSWORD` for `SecurityConfig`. The configured administrator is held in memory with BCrypt password encoding. This is account-password hashing, not encryption of `.env` or container environment values.
5. Tests use checked-in test-only credentials `[MASKED]` rather than a remote secret provider.

The implemented access model is database password authentication plus an in-memory application account. No managed-identity authentication, service-principal secret retrieval, cloud RBAC binding, Jasypt, sealed secrets, or encrypted property storage is configured. No automated CI secret-provisioning/rotation workflow was discovered. Workshop references to Key Vault/managed identity describe a potential deployment, not an existing source → identity → secret-binding flow.

## Feature Flags

| Flag Name | Default | Controlled By |
|---|---|---|
| Dedicated feature flag service/framework | Not configured | No LaunchDarkly, Unleash, remote feature provider or custom rollout configuration found |
| Conditional beans via `@ConditionalOnProperty` / `@ConditionalOnExpression` | None found | No project-defined conditional feature activation |
| `spring.jpa.show-sql` (diagnostic switch, not a product feature flag) | `true`; `test`: `false` | Base/docker/test properties |
| `spring.jpa.properties.hibernate.format_sql` (diagnostic switch) | `true` | Base/docker properties |
| `server.servlet.encoding.enabled` / `server.servlet.encoding.force` (framework switches) | Both `true` | Base/docker properties |

Runtime profiles select configuration environments; they are not documented as A/B testing or gradual-rollout mechanisms. Upload size/type settings are configuration parameters, not feature flags.

## Framework & Runtime Versions

| Component | Version | Source |
|---|---|---|
| Application artifact | `1.0.0` | `pom.xml:15–18` |
| Java compilation target | `21` | `pom.xml:24–26` |
| Spring Boot parent | `3.5.0` | `pom.xml:8–12` |
| Spring Boot Maven plugin | Parent-managed; no explicit plugin version | `pom.xml:103–109` |
| Spring Web, Thymeleaf, Data JPA, Validation, Security, JSON starters | Managed through Spring Boot `3.5.0`; individual resolved versions not verified | `pom.xml` dependencies |
| Hibernate ORM, Spring Framework, embedded servlet container, Thymeleaf, Spring Security | Boot-managed transitive versions; not individually pinned in this repository | Parent/dependency management; no resolved dependency tree generated |
| Oracle JDBC `com.oracle.database.jdbc:ojdbc8` | Parent-managed; no explicit version | `pom.xml:49–54` |
| Commons IO | `2.14.0` | `pom.xml:68–73` |
| Spring Boot Test / DevTools | Boot-managed; no explicit versions | `pom.xml:81–100` |
| H2 | Boot-managed, test scope; no explicit version | `pom.xml:88–93` |
| Maven build container | `maven:3.9.9-eclipse-temurin-21` | `Dockerfile:2` |
| Java runtime container | `eclipse-temurin:21-jre` | `Dockerfile:17`; patch version/digest not pinned |
| Oracle database container | `container-registry.oracle.com/database/express:21.3.0-xe` | `docker-compose.yml:4` |
| Local Maven guidance | README: `3.8.0` or higher; setup guide: `3.9.x` | `README.md:53`; `WORKSHOP_SETUP_GUIDE.md:53–68,242` |
| Local JDK guidance | JDK `21` or higher; setup examples use `21.x.x` | `README.md:51`; `WORKSHOP_SETUP_GUIDE.md:31–51` |
| Docker / Compose | No pinned engine or Compose version; README requests latest Docker Desktop | `README.md:108`; no wrapper/version lock |
| Spring Cloud / external configuration client | Not declared | `pom.xml` |

> Note: Some configuration sources or properties could not be fully identified. Runtime environment overrides, local dotenv/user Maven settings, image-resolved patch versions, and BOM-resolved transitive versions were not inspected or executed. Assessment artifacts and `.github/agents` were excluded from application configuration analysis.
