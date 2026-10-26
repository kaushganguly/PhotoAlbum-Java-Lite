# Configuration & Externalized Settings Inventory

Configuration is held in Spring `application*.properties` files, Docker Compose environment variables and a `.env` file; secrets are injected from environment variables rather than committed.

## Configuration Sources

| Source | Type | Path/Location | Notes |
|--------|------|---------------|-------|
| application.properties | Spring properties | `src/main/resources/application.properties` | Default (local) profile |
| application-docker.properties | Spring properties | `src/main/resources/application-docker.properties` | Activated by Compose |
| application-test.properties | Spring properties | `src/test/resources/application-test.properties` | H2 test context |
| docker-compose.yml | Container orchestration | repository root | App and Oracle services, env injection |
| .env.example | Environment template | repository root | Copy to `.env` (git-ignored) |
| Dockerfile | Container build | repository root | Multi-stage Maven build, JRE runtime |
| oracle-init | Init scripts | `oracle-init/` | Create least-privilege app schema user |

## Build Profiles

| Profile | Activation | Purpose | Key Dependencies/Plugins |
|---------|------------|---------|--------------------------|
| (none) | n/a | No Maven profiles defined | spring-boot-maven-plugin |

## Runtime Profiles

| Profile | Activation Method | Config Files | Key Overrides |
|---------|-------------------|--------------|---------------|
| default | none | application.properties | Oracle on localhost, DEBUG logging |
| docker | `SPRING_PROFILES_ACTIVE=docker` | application-docker.properties | Oracle host `oracle-db`, INFO logging |
| test | `@ActiveProfiles("test")` | application-test.properties | H2 in-memory, `create-drop` |

## Properties Inventory

### photo-album

| Property Key | Default | Profiles | Source |
|--------------|---------|----------|--------|
| server.port | 8080 | default, docker | application*.properties |
| spring.datasource.url | `jdbc:oracle:thin:@localhost:1521:XE` (docker: `@oracle-db:1521:XE`) | default, docker | env `SPRING_DATASOURCE_URL` |
| spring.datasource.username | photoalbum | default, docker | env `SPRING_DATASOURCE_USERNAME` |
| spring.datasource.password | none (required) | default, docker | env `SPRING_DATASOURCE_PASSWORD` |
| spring.jpa.hibernate.ddl-auto | create | default, docker | application*.properties |
| spring.jpa.show-sql | true | default, docker | application*.properties |
| spring.servlet.multipart.max-file-size | 10MB | default, docker | application*.properties |
| spring.servlet.multipart.max-request-size | 50MB | default, docker | application*.properties |
| app.file-upload.max-file-size-bytes | 10485760 | all | application*.properties |
| app.file-upload.allowed-mime-types | image/jpeg,image/png,image/gif,image/webp | all | application*.properties |
| app.file-upload.max-files-per-upload | 10 | all | application*.properties (not referenced by code) |
| app.admin.username | admin | all | env `APP_ADMIN_USERNAME` |
| app.admin.password | none (required) | all | env `APP_ADMIN_PASSWORD` |
| logging.level.com.photoalbum | DEBUG (docker: INFO) | default, docker | application*.properties |
| logging.level.org.springframework.web | DEBUG (docker: WARN) | default, docker | application*.properties |
| server.servlet.encoding.* | UTF-8, forced | default, docker | application*.properties |

## Startup Parameters & Resource Requirements

| Service | JVM/Runtime Options | Memory | Instance Count |
|---------|---------------------|--------|----------------|
| photoalbum-java-app | `JAVA_OPTS=-Xmx512m -Xms256m` | 256-512 MB heap | 1 |
| oracle-db | Oracle XE defaults | Oracle XE minimum about 2 GB | 1 |

## Startup Dependency Chain

1. `oracle-db` starts and runs `oracle-init` scripts on startup.
2. `oracle-db` healthcheck (`sqlplus` SELECT 1 FROM DUAL; 30s interval, 15 retries, 180s start period) must report healthy.
3. `photoalbum-java-app` waits for `oracle-db` with `depends_on: condition: service_healthy`, `restart: on-failure`.

## Secrets & Sensitive Configuration

| Secret Reference | Type | Storage (masked) |
|------------------|------|------------------|
| ORACLE_PASSWORD | Oracle SYS/SYSTEM password | `.env` (git-ignored), value `****` |
| APP_USER_PASSWORD / SPRING_DATASOURCE_PASSWORD | Application DB password | `.env`, container env, `****` |
| APP_ADMIN_PASSWORD (app.admin.password) | Admin HTTP Basic password | `.env`, container env, `****` |

### Secrets Provisioning Workflow

Operator copies `.env.example` to `.env` and sets values; Docker Compose reads `.env` and injects variables into the Oracle and application containers (Compose fails fast if they are unset); Spring resolves them via property placeholders. No external secret store (Key Vault) is used.

## Feature Flags

| Flag Name | Default | Controlled By |
|-----------|---------|---------------|
| None | n/a | n/a |

## Framework & Runtime Versions

| Component | Version | Source |
|-----------|---------|--------|
| Java | 21 | pom.xml `java.version`, Dockerfile |
| Spring Boot | 3.5.0 | pom.xml parent |
| Hibernate | 6.6.15.Final | Boot BOM |
| Oracle ojdbc8 | 23.7.0.25.01 | Boot BOM |
| Oracle Database XE | 21.3.0 | docker-compose.yml |
| Maven (build image) | 3.9.9 | Dockerfile |
