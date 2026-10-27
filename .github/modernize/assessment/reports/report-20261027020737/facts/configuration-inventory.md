# Configuration & Externalized Settings Inventory

Configuration is supplied through three Spring properties files, Docker Compose, a Dockerfile, an environment template, and Java property bindings. Two named runtime profiles are present; operational passwords are required environment inputs, while test-only password literals are redacted below.

Scope: repository configuration and documentation inspected statically; no deployment or dependency resolution performed. Source citations use repository-relative paths and verified line numbers. No `.github/agents` files were read.

Source hyperlinks below are relative to the final report's `facts/` directory, six levels below the repository root; inline `path:line` citations throughout this inventory identify the relevant lines:

- [Base application properties](../../../../../../src/main/resources/application.properties#L1-L34), [Docker profile properties](../../../../../../src/main/resources/application-docker.properties#L1-L32), and [test profile properties](../../../../../../src/test/resources/application-test.properties#L1-L23).
- [Maven build](../../../../../../pom.xml#L8-L109), [Dockerfile](../../../../../../Dockerfile#L1-L31), and [Compose deployment](../../../../../../docker-compose.yml#L1-L53).
- [Environment template](../../../../../../.env.example#L1-L17) and [environment-file ignore rules](../../../../../../.gitignore#L201-L204).
- [Security property bindings](../../../../../../src/main/java/com/photoalbum/config/SecurityConfig.java#L28-L42), [upload property bindings](../../../../../../src/main/java/com/photoalbum/service/impl/PhotoServiceImpl.java#L40-L46), [application startup](../../../../../../src/main/java/com/photoalbum/PhotoAlbumApplication.java#L9-L13), and [test profile activation](../../../../../../src/test/java/com/photoalbum/PhotoAlbumApplicationTests.java#L3-L15).
- [Primary Oracle initialization](../../../../../../oracle-init/01-create-user.sh#L11-L50), [supplemental Oracle initialization](../../../../../../oracle-init/create-user.sh#L9-L45), [user verification SQL](../../../../../../oracle-init/02-verify-user.sql#L1-L14), and [supplemental health SQL](../../../../../../oracle-init/healthcheck.sql#L1-L3).
- [Workshop runtime setup](../../../../../../WORKSHOP_SETUP_GUIDE.md#L31-L65), [Maven mirror instructions](../../../../../../WORKSHOP_SETUP_GUIDE.md#L195-L233), and [documented version checklist](../../../../../../WORKSHOP_SETUP_GUIDE.md#L241-L242).

## Configuration Sources

| Source | Type | Path/Location | Notes |
|---|---|---|---|
| Base application settings | Spring properties | `src/main/resources/application.properties:1-34` | Shared configuration and datasource environment placeholders. |
| Docker overrides | Spring profile properties | `src/main/resources/application-docker.properties:1-32` | Overrides datasource host and logging; repeats several base settings. |
| Test overrides | Spring profile properties | `src/test/resources/application-test.properties:1-23` | H2, test credentials, test upload path, and logging. Test-classpath configuration only. |
| Environment template | Compose interpolation input template | `.env.example:1-17` | Instructs copying to `.env` and replacing password placeholders. Actual local `.env` values were not inspected. |
| Container deployment | Compose YAML | `docker-compose.yml:1-53` | Environment bindings, network, persistent volume, database readiness, and restart policy. |
| Container image/startup | Dockerfile | `Dockerfile:1-31` | Build/runtime images, package command, JVM options, and entrypoint. |
| Build metadata | Maven XML | `pom.xml:8-109` | Parent/BOM, compiler properties, dependencies, and packaging plugin. |
| Java property bindings | Spring `@Value` | `src/main/java/com/photoalbum/config/SecurityConfig.java:33-42`; `src/main/java/com/photoalbum/service/impl/PhotoServiceImpl.java:40-46` | Admin username fallback; mandatory admin password and upload settings. |
| Database bootstrap | Shell/SQL | `oracle-init/01-create-user.sh:11-50`; `oracle-init/create-user.sh:9-45`; `oracle-init/02-verify-user.sql:1-14`; `oracle-init/healthcheck.sql:1-3` | Environment-driven user creation; supplemental verification/health SQL. |
| Developer tool configuration | Documentation-only Maven settings | `WORKSHOP_SETUP_GUIDE.md:195-233` | User-level `C:\Users\<YourUsername>\.m2\settings.xml`; mirrors Central to `https://maven.aliyun.com/repository/public` and Spring repositories to `https://maven.aliyun.com/repository/spring`. Not a checked-in settings file or an application config repository. |
| Developer runtime selection | Documentation | `WORKSHOP_SETUP_GUIDE.md:31-65` | `JAVA_HOME`, JDK bin on `Path`, and Maven bin on `Path`. |
| Secret exclusion | Git ignore rules | `.gitignore:201-204` | Ignores `.env` and `.env.*`, except `.env.example`. |

No application `bootstrap.*`, external configuration repository, Spring Cloud Config client/server, remote secret store, Kubernetes manifests, or additional application profile files were found in the inspected application/deployment sources. Workshop migration instructions are not deployed configuration.

## Build Profiles

| Profile | Activation | Purpose | Key Dependencies/Plugins |
|---|---|---|---|
| Default Maven build; no named `<profiles>` | Ordinary Maven invocation | Java 21 JAR packaging | Spring Boot parent `3.5.0`; Spring Boot Maven plugin; dependencies declared globally (`pom.xml:8-109`). |
| Container package invocation; not a Maven profile | Docker build executes `mvn clean package -DskipTests` | Packages the image artifact without running tests | Same dependencies/plugins; preceding `mvn dependency:go-offline -B` resolves dependencies (`Dockerfile:6-14`). |

Build properties: `java.version=21`, `maven.compiler.source=21`, `maven.compiler.target=21`, `project.build.sourceEncoding=UTF-8`; artifact coordinates `com.photoalbum:photo-album:1.0.0`, packaging `jar` (`pom.xml:15-28`). No profile-specific dependencies or activation conditions are declared.

## Runtime Profiles

| Profile | Activation Method | Config Files | Key Overrides |
|---|---|---|---|
| Base/default | No explicit active profile in base settings | `src/main/resources/application.properties` | Local Oracle URL fallback; DEBUG application/web logging (`:12-34`). |
| `docker` | Compose sets `SPRING_PROFILES_ACTIVE=docker` | Base plus `src/main/resources/application-docker.properties` | Oracle container hostname; application INFO, web WARN, Hibernate SQL DEBUG (`docker-compose.yml:32-38`; profile file `:3-32`). |
| `test` | `@ActiveProfiles("test")` on context test | Base plus `src/test/resources/application-test.properties` | H2 URL/driver/dialect, create-drop, SQL logging false, test admin values (`src/test/java/com/photoalbum/PhotoAlbumApplicationTests.java:7-8`; test properties `:1-23`). |

No `@Profile` beans, profile groups, include directives, or combined activation settings were found in `src`. The test profile is not a Maven build profile.

## Properties Inventory

### Application module: `photo-album`

Defaults below are values explicitly declared in the repository, not inferred framework defaults. “Base” means inherited by a named profile unless overridden. Secret literals, including empty passwords and test defaults, are masked.

| Property Key | Default | Profiles | Source |
|---|---|---|---|
| `server.port` | `8080` (integer) | Base; Docker repeats | `src/main/resources/application.properties:2`; `src/main/resources/application-docker.properties:25` |
| `server.servlet.encoding.charset` | `UTF-8` (charset) | Base; Docker repeats | Base `:5`; Docker `:9` |
| `server.servlet.encoding.enabled` | `true` (boolean) | Base; Docker repeats | Base `:6`; Docker `:10` |
| `server.servlet.encoding.force` | `true` (boolean) | Base; Docker repeats | Base `:7`; Docker `:11` |
| `spring.datasource.url` | `${SPRING_DATASOURCE_URL:jdbc:oracle:thin:@localhost:1521:XE}` (JDBC string) | Docker fallback `jdbc:oracle:thin:@oracle-db:1521:XE`; test `jdbc:h2:mem:testdb` | Base `:12`; Docker `:3`; `src/test/resources/application-test.properties:2` |
| `spring.datasource.username` | `${SPRING_DATASOURCE_USERNAME:photoalbum}` (string) | Docker repeats; test `sa` | Base `:13`; Docker `:4`; test `:4` |
| `spring.datasource.password` | Required `${SPRING_DATASOURCE_PASSWORD}`; no application fallback | Base/Docker require environment value; test `[MASKED]` insecure default | Base `:14`; Docker `:5`; test `:5` |
| `spring.datasource.driver-class-name` | `oracle.jdbc.OracleDriver` (class name) | Docker repeats; test `org.h2.Driver` | Base `:15`; Docker `:6`; test `:3` |
| `spring.jpa.database-platform` | `org.hibernate.dialect.OracleDialect` (class name) | Docker repeats; test `org.hibernate.dialect.H2Dialect` | Base `:18`; Docker `:14`; test `:8` |
| `spring.jpa.hibernate.ddl-auto` | `create` (mode) | Docker repeats; test `create-drop` | Base `:19`; Docker `:15`; test `:9` |
| `spring.jpa.show-sql` | `true` (boolean) | Docker repeats; test `false` | Base `:20`; Docker `:16`; test `:10` |
| `spring.jpa.properties.hibernate.format_sql` | `true` (boolean) | Base; Docker repeats; test inherits | Base `:21`; Docker `:17` |
| `spring.servlet.multipart.max-file-size` | `10MB` (data size) | Base; Docker repeats | Base `:24`; Docker `:26` |
| `spring.servlet.multipart.max-request-size` | `50MB` (data size) | Base; Docker repeats | Base `:25`; Docker `:27` |
| `app.file-upload.max-file-size-bytes` | `10485760` (bound as Java `long`, bytes) | Base, Docker, test | Base `:28`; Docker `:20`; test `:14`; `PhotoServiceImpl.java:40-45` |
| `app.file-upload.allowed-mime-types` | `image/jpeg,image/png,image/gif,image/webp` (bound as string array) | Base, Docker, test | Base `:29`; Docker `:21`; test `:15`; `PhotoServiceImpl.java:40-46` |
| `app.file-upload.max-files-per-upload` | `10` (integer-shaped value) | Base, Docker, test | Base `:30`; Docker `:22`; test `:16` |
| `app.file-upload.upload-path` | No base declaration; test `target/test-uploads` (path) | Test only | Test `:13` |
| `logging.level.com.photoalbum` | `DEBUG` (log level) | Docker `INFO`; test `DEBUG` | Base `:33`; Docker `:30`; test `:19` |
| `logging.level.org.springframework.web` | `DEBUG` (log level) | Docker `WARN`; test inherits base | Base `:34`; Docker `:31` |
| `logging.level.org.hibernate.SQL` | No base declaration; Docker `DEBUG` | Docker only explicit setting | Docker `:32` |
| `app.admin.username` | `admin` (string, Java fallback) | Compose `APP_ADMIN_USERNAME` fallback `admin`; test `admin` | `src/main/java/com/photoalbum/config/SecurityConfig.java:36`; `docker-compose.yml:37`; test `:22` |
| `app.admin.password` | Required; no Java fallback | Compose `APP_ADMIN_PASSWORD` required; test `[MASKED]` insecure default | `SecurityConfig.java:37`; `docker-compose.yml:38`; test `:23` |

In this table, “Base”, “Docker”, and “test” line citations abbreviate `src/main/resources/application.properties`, `src/main/resources/application-docker.properties`, and `src/test/resources/application-test.properties`; Java filename abbreviations refer to the full paths in Configuration Sources.

`app.file-upload.max-files-per-upload` and `app.file-upload.upload-path` have declarations but no matching consumers in the inspected Java source. Numeric accepted ranges beyond the bound types are not declared as configuration constraints.

### Compose and database environment inputs

| Property Key | Default | Profiles | Source |
|---|---|---|---|
| `ORACLE_PASSWORD` → database `ORACLE_PWD` | Required; Compose `${ORACLE_PASSWORD:?...}` rejects missing/empty input | Compose | `docker-compose.yml:7`; `.env.example:5-6` |
| `ORACLE_CHARACTERSET` | `AL32UTF8` | Database container | `docker-compose.yml:8` |
| `APP_USER` | `photoalbum`; mapped to database `APP_USER` and application `SPRING_DATASOURCE_USERNAME` | Compose | `docker-compose.yml:9,35`; `.env.example:8-9` |
| `APP_USER_PASSWORD` | Required; no fallback; database environment and application `SPRING_DATASOURCE_PASSWORD` | Compose | `docker-compose.yml:10,36`; `.env.example:11-12` |
| `SPRING_DATASOURCE_URL` | Explicit `jdbc:oracle:thin:@oracle-db:1521:XE` | Application container | `docker-compose.yml:34` |
| `APP_ADMIN_USERNAME` | `admin` | Application container | `docker-compose.yml:37`; `.env.example:14-16` |
| `APP_ADMIN_PASSWORD` | Required; no fallback | Application container | `docker-compose.yml:38`; `.env.example:17` |

Resolution chain: operator environment / Compose `.env` interpolation → Compose service environment → Spring environment binding/placeholders → profile properties overriding base properties → local placeholder or Java fallback where declared. Spring's normal command-line/system-property overrides remain available; the entrypoint does not explicitly supply them. `.env` is a Compose input, not a configured Spring dotenv loader. Direct non-Compose execution must separately export/provide `SPRING_DATASOURCE_PASSWORD` and `APP_ADMIN_PASSWORD` (`.env.example:1-3`; `docker-compose.yml:6-10,32-38`; base properties `:12-14`; `SecurityConfig.java:36-37`; `Dockerfile:31`).

## Startup Parameters & Resource Requirements

| Service | JVM/Runtime Options | Memory | Instance Count |
|---|---|---|---|
| `photoalbum-java-app` | `JAVA_OPTS="-Xmx512m -Xms256m"`; `sh -c "java $JAVA_OPTS -jar app.jar"`; `SPRING_PROFILES_ACTIVE=docker` | Initial heap 256 MiB, maximum heap 512 MiB; no container memory/CPU requests or limits declared | No explicit replica/scaling setting; one service declaration |
| `oracle-db` | Oracle image startup; `ORACLE_CHARACTERSET=AL32UTF8`; environment-driven credentials | No memory/CPU limits declared | No explicit replica/scaling setting; one service declaration |
| Local/test JVM | Main delegates `args` to `SpringApplication.run`; no explicit JVM heap/system properties declared for tests | Not specified | Not specified |

Sources: `Dockerfile:24-31`; `docker-compose.yml:1-46`; `src/main/java/com/photoalbum/PhotoAlbumApplication.java:9-13`; `src/test/java/com/photoalbum/PhotoAlbumApplicationTests.java:7-15`. No `-D` JVM startup properties or sizing-to-container-limit mapping are present. The Docker build's `-DskipTests` is a build option, not a runtime setting.

Compose exposes application port `8080:8080` and database ports `1521:1521`, `5500:5500`; both services use bridge network `photoalbum-network`. Database persistence is `oracle_data:/opt/oracle/oradata`; startup scripts mount at `/opt/oracle/scripts/startup`. Application restart policy is `on-failure`; no application volume is declared (`docker-compose.yml:11-18,39-53`).

## Startup Dependency Chain

1. **Operator configuration → Compose interpolation**: supply required `ORACLE_PASSWORD`, `APP_USER_PASSWORD`, and `APP_ADMIN_PASSWORD` before starting containers; Compose requires nonempty values (`docker-compose.yml:7,10,36,38`).
2. **Oracle container → database and application-user initialization**: mounted startup scripts require `ORACLE_PWD` and `APP_USER_PASSWORD`; default `APP_USER` is `photoalbum`. The first creation script uppercases the username, conditionally creates it, and applies schema grants. The supplementary creation script includes a fixed 30-second sleep, not a readiness loop (`docker-compose.yml:14-16`; `oracle-init/01-create-user.sh:11-43`; `oracle-init/create-user.sh:9-35`).
3. **Application → waits for → healthy Oracle**: Compose `depends_on.oracle-db.condition=service_healthy`. Database probe uses SQL*Plus with the application username/password against localhost port 1521, service `XE`, executes `SELECT 1 FROM DUAL`, and searches for `1` in output. Settings: interval `30s`, timeout `10s`, retries `15`, start period `180s` (`docker-compose.yml:19-24,41-43`). This is the configured readiness signal, not independently verified connection/error handling.
4. **Spring context → datasource and required admin binding**: credentials and datasource settings must resolve for the configured context. No application healthcheck, readiness probe, dedicated wait script, Config Server retry policy, or explicit application startup timeout is declared (`docker-compose.yml:26-46`; base properties `:12-19`; `SecurityConfig.java:33-42`).

`oracle-init/healthcheck.sql:1-3` is a supplemental SQL file; Compose uses inline SQL instead. `oracle-init/02-verify-user.sql:5-12` verifies the fixed username `PHOTOALBUM`, not the configurable `APP_USER`; it is not the Compose readiness command.

## Secrets & Sensitive Configuration

| Secret Reference | Type | Storage (masked) |
|---|---|---|
| `ORACLE_PASSWORD` → `ORACLE_PWD` | Oracle administrative password | Operator environment / git-ignored `.env`; `.env.example:6` contains a placeholder `[MASKED]`, not an operational default; required by `docker-compose.yml:7`. |
| `APP_USER_PASSWORD` → database `APP_USER_PASSWORD` and application `SPRING_DATASOURCE_PASSWORD` → `spring.datasource.password` | Database application password | Operator environment / `.env`; template placeholder `[MASKED]`; no production fallback (`docker-compose.yml:10,36`; base properties `:14`; Docker properties `:5`). |
| `APP_ADMIN_PASSWORD` → `app.admin.password` | Application admin password | Operator environment / `.env`; template placeholder `[MASKED]`; required Java binding (`docker-compose.yml:38`; `SecurityConfig.java:37`). |
| Test `spring.datasource.password` | Test database password | `[MASKED]` — insecure default confined to test properties (`src/test/resources/application-test.properties:5`). |
| Test `app.admin.password` | Test admin password | `[MASKED]` — insecure fixed default confined to test properties (`src/test/resources/application-test.properties:21-23`). |

All password literals and template values are deliberately omitted, including defaults. Datasource URL declarations contain no embedded credential literals. Runtime SQL*Plus commands construct credential-bearing connection arguments from environment references (`oracle-init/01-create-user.sh:19`; `oracle-init/create-user.sh:22`; `docker-compose.yml:20`).

### Secrets Provisioning Workflow

1. Operator copies `.env.example` to `.env` and replaces placeholders with strong, unique values; `.gitignore` excludes local environment files (`.env.example:1-17`; `.gitignore:201-204`).
2. Compose checks required passwords, passes the administrative and schema secrets to Oracle, and passes the schema and admin secrets to the application. Template username defaults are `photoalbum` and `admin`; usernames are not passwords (`docker-compose.yml:6-10,32-38`).
3. Startup scripts connect as Oracle `SYSTEM`, create the configured application user if absent, and grant schema-oriented permissions. The primary script explicitly avoids DBA and grants unlimited quota on `USERS`; the alternate script grants a smaller set on creation. These scripts do not rotate an existing user's password (`oracle-init/01-create-user.sh:19-43`; `oracle-init/create-user.sh:21-39`).
4. Spring resolves the application datasource password; the admin password is BCrypt-encoded when constructing the in-memory user store (`src/main/resources/application.properties:12-15`; `SecurityConfig.java:28-42`). BCrypt is password hashing here, not encryption of environment values or configuration files.

No Key Vault/Vault/Secrets Manager binding, managed identity, service-principal authentication, secret-store RBAC, encrypted property syntax, sealed secrets, or CI-based secret provisioning is declared in the inspected deployment/application files. Runtime secrets remain environment inputs; test credentials are separate checked-in test configuration.

## Feature Flags

| Flag Name | Default | Controlled By |
|---|---|---|
| Dedicated business feature flags | None found | No feature-flag framework, `@ConditionalOnProperty`, or `@ConditionalOnExpression` in inspected `src`/`pom.xml`. |
| `spring.jpa.show-sql` (diagnostic toggle) | `true`; test `false` | Base `:20`; Docker `:16`; test `:10`. |
| `spring.jpa.properties.hibernate.format_sql` (diagnostic toggle) | `true` | Base `:21`; Docker `:17`. |
| `server.servlet.encoding.enabled`, `server.servlet.encoding.force` (framework toggles) | Both `true` | Base `:6-7`; Docker `:10-11`. |

These booleans are framework settings, not evidence of rollout or A/B testing. No remote flag provider or gradual-rollout configuration was found.

## Framework & Runtime Versions

| Component | Version | Source |
|---|---|---|
| Application artifact | `com.photoalbum:photo-album:1.0.0` | `pom.xml:15-18` |
| Spring Boot parent | `3.5.0` | `pom.xml:8-12` |
| Java compilation target | `21` | `pom.xml:23-27` |
| Container builder | `maven:3.9.9-eclipse-temurin-21` (Maven 3.9.9 / Temurin 21 tag) | `Dockerfile:1-2` |
| Container runtime | `eclipse-temurin:21-jre`; exact patch/digest not pinned | `Dockerfile:16-17` |
| Oracle database image | `container-registry.oracle.com/database/express:21.3.0-xe` | `docker-compose.yml:4` |
| Commons IO | `2.14.0` | `pom.xml:68-73` |
| Boot Web, Thymeleaf, Data JPA, Validation, Security, JSON starters | Boot-managed; individual resolved versions not verified | `pom.xml:30-79` |
| Oracle JDBC `ojdbc8` | Boot-managed; no explicit version; runtime scope | `pom.xml:49-54` |
| H2 | Boot-managed; no explicit version; test scope | `pom.xml:88-93` |
| Boot test starter / JUnit Jupiter | Boot-managed; individual versions not resolved | `pom.xml:81-86`; `src/test/java/com/photoalbum/PhotoAlbumApplicationTests.java:3` |
| DevTools | Boot-managed; optional dependency | `pom.xml:95-100` |
| Hibernate / embedded servlet container / Spring Security libraries | Transitive/Boot-managed; exact versions not established from checked-in declarations | `pom.xml:8-12,31-66` |
| Spring Boot Maven plugin | Parent-managed; no explicit plugin version | `pom.xml:103-109` |
| Host Java/Maven | Documentation expects Java 21 and Maven 3.9.x; installed versions not checked | `WORKSHOP_SETUP_GUIDE.md:31-65,241-242` |
| Docker / Compose tooling | Version not pinned in deployment files | `Dockerfile:1-31`; `docker-compose.yml:1-53` |

> Note: Resolved transitive dependency versions, actual deployed values, host tool versions, and external operator configuration could not be fully identified from the repository alone.
