# Architecture Diagram

Photo Album is a single-module Java web application providing a public gallery, photo detail navigation, and authenticated upload and deletion. This static assessment covers `/home/runner/work/PhotoAlbum-Java-Lite/PhotoAlbum-Java-Lite`; diagrams describe checked-in implementation and container configuration, not a verified running deployment. Credential values are omitted.

## Application Architecture

```mermaid
flowchart TD
    subgraph Client["Client Layer"]
        A_Browser["Web browser - HTML and JavaScript"]
    end
    subgraph Application["Application Layer - Spring Boot 3.5.0 on Java 21"]
        A_HTTP["Spring MVC - embedded servlet server - port 8080"]
        A_Security["Spring Security - stateless HTTP Basic"]
        A_UI["Thymeleaf gallery and detail views"]
        A_Service["Transactional photo operations and image validation"]
    end
    subgraph Persistence["Data Access Layer"]
        A_JPA["Spring Data JPA and Hibernate"]
        A_JDBC["Oracle JDBC - ojdbc8"]
    end
    subgraph Storage["Database Service - separate process"]
        A_Oracle[("Oracle Database XE 21.3.0 - photos metadata and BLOBs")]
        A_Volume[("Docker named volume - oracle_data")]
    end
    subgraph External["External Browser Dependency"]
        A_CDN["jsDelivr - Bootstrap 5.3.0 CSS and JavaScript"]
    end
    A_Browser -->|"HTTP GET pages and photos; multipart POST uploads; POST delete"| A_HTTP
    A_HTTP -->|"request filtering"| A_Security
    A_Security -->|"public reads; authenticated uploads and deletes"| A_Service
    A_HTTP -->|"render gallery and detail models"| A_UI
    A_UI -->|"HTML with local scripts and image URLs"| A_Browser
    A_Service -->|"photo bytes or upload JSON via MVC"| A_HTTP
    A_Service -->|"CRUD and chronological navigation queries"| A_JPA
    A_JPA -->|"ORM and Oracle-specific native SQL"| A_JDBC
    A_JDBC -->|"Oracle protocol over TCP 1521"| A_Oracle
    A_Oracle -->|"database files in Compose deployment"| A_Volume
    A_Browser -->|"HTTPS fetch of UI assets"| A_CDN
```

### Technology Stack Summary

| Layer | Technology | Version | Purpose |
|---|---|---|---|
| Runtime | Java / Eclipse Temurin | 21 | Application runtime; Docker final image uses a JRE |
| Application | Spring Boot | 3.5.0 | Auto-configuration, executable JAR, dependency management |
| Presentation | Spring MVC / embedded servlet server | Boot-managed; exact resolved versions not verified | HTML, multipart upload JSON, photo byte responses on port 8080 |
| Presentation | Thymeleaf | Boot-managed; exact version not verified | Server-rendered gallery and detail pages |
| Browser | JavaScript Fetch API, Bootstrap via jsDelivr | Browser-provided API; Bootstrap 5.3.0 | Drag-and-drop upload, gallery updates, responsive styling |
| Security | Spring Security / BCrypt | Boot-managed; exact version not verified | In-memory administrator, stateless HTTP Basic, password encoding |
| Business | Spring transactions, Java ImageIO | Boot-managed transactions; JDK 21 ImageIO | CRUD orchestration, configured MIME/size checks, image dimensions and pixel limit |
| Persistence | Spring Data JPA / Hibernate | Boot-managed; exact versions not verified | Entity persistence and repository queries |
| Database connectivity | Oracle JDBC `ojdbc8` | Boot-managed; exact version not verified | Runtime Oracle connection |
| Database | Oracle Database Express Edition | 21.3.0-xe in Compose | Photo metadata and binary data in the `photos` table |
| Build and packaging | Maven, Spring Boot Maven plugin | Docker builder Maven 3.9.9; plugin Boot-managed | Single executable JAR, multi-stage container build |
| Deployment | Docker Compose, Eclipse Temurin | Compose version unspecified; runtime image `21-jre` | App and Oracle services on a shared bridge network |
| Test-only persistence | H2 | Boot-managed; exact version not verified | In-memory datasource in the test profile; not production storage |

### Data Storage & External Services

Oracle is the only identified application datastore. The `Photo` entity maps to `photos`, storing UUID identifiers, original filenames, MIME types, upload timestamps, dimensions, file sizes, and image bytes through a JPA LOB field. Uploads are saved to the database and `/photo/{id}` returns those bytes; the bundled file under `static/uploads` is not evidence of an active filesystem upload pipeline. Repository native queries use Oracle constructs including `NVL`, `ROWNUM`, `SYSDATE`, and `DUAL`.

Compose deploys the app and Oracle on `photoalbum-network`, persists Oracle files in `oracle_data`, and mounts initialization scripts into the database container. App startup depends on the database health check. Database and administrator passwords are supplied through external configuration; no credential values are reproduced here. Bootstrap assets are requested directly by browsers from jsDelivr over HTTPS. No application cache, message broker, object storage, or server-side third-party API integration was identified.

**Significant caveats:** Both default and Docker profiles set `spring.jpa.hibernate.ddl-auto=create`, so application startup can recreate the schema even when the Oracle volume persists. The configured application endpoint is HTTP; no TLS termination component is present in the examined deployment files. Upload and delete POSTs require authentication, while reads are public; CSRF protection is explicitly disabled. These are configuration observations, not runtime or security-test results. The browser upload script has no explicit login or Authorization-header flow, so authenticated browser upload behavior was not established. The `max-files-per-upload` setting exists, but no corresponding server-side count enforcement was found in the upload controller/service. No builds, tests, dependency resolution, database connections, or Mermaid renderer were run.

### Key Architectural Decisions

- A layered monolith uses constructor-injected MVC controllers, a `PhotoService` interface and transactional implementation, and a Spring Data repository; communication within the process is synchronous.
- Photo content and metadata share Oracle persistence rather than a separate file or object store. Native SQL makes chronological navigation and gallery queries Oracle-specific.
- Public browsing is separated from authenticated mutation through a configured security filter chain and an externally configured, BCrypt-encoded in-memory administrator; browser presentation combines server-rendered pages and asynchronous upload JSON.

## Component Relationships

```mermaid
flowchart LR
    subgraph Presentation["Presentation"]
        C_Views["index.html and detail.html"]
        C_UploadJS["upload.js"]
        C_Home["HomeController"]
        C_Detail["DetailController"]
        C_File["PhotoFileController"]
    end
    subgraph Business["Business Logic"]
        C_Contract["PhotoService"]
        C_Impl["PhotoServiceImpl"]
        C_Result["UploadResult"]
    end
    subgraph Data["Data Access and Model"]
        C_Repo["PhotoRepository"]
        C_Photo["Photo"]
    end
    subgraph Infrastructure["Infrastructure and Cross-Cutting"]
        C_App["PhotoAlbumApplication"]
        C_Config["application properties and Docker profile"]
        C_Security["SecurityConfig"]
        C_Filter["SecurityFilterChain"]
        C_Users["InMemoryUserDetailsManager"]
        C_Encoder["BCrypt PasswordEncoder"]
        C_Tx["Spring transaction interception"]
        C_Logging["SLF4J logging"]
    end
    C_Home -->|"gallery model"| C_Views
    C_Detail -->|"detail and navigation model"| C_Views
    C_Views -->|"loads upload script"| C_UploadJS
    C_UploadJS -->|"multipart POST upload; consumes JSON"| C_Home
    C_Views -->|"POST delete form"| C_Detail
    C_Views -->|"image GET requests"| C_File
    C_Home -->|"constructor injection"| C_Contract
    C_Detail -->|"constructor injection"| C_Contract
    C_File -->|"constructor injection"| C_Contract
    C_Impl -.->|"implements"| C_Contract
    C_Impl -->|"upload outcome"| C_Result
    C_Home -->|"maps outcome into response JSON"| C_Result
    C_Impl -->|"constructor-injected CRUD and queries"| C_Repo
    C_Repo -->|"persists and loads"| C_Photo
    C_Impl -->|"creates and reads"| C_Photo
    C_App -.->|"component scanning and auto-configuration"| C_Home
    C_App -.->|"discovers service and repository"| C_Impl
    C_Config -.->|"injects upload size and MIME settings"| C_Impl
    C_Config -.->|"supplies datasource and JPA configuration"| C_Repo
    C_Security -->|"creates"| C_Filter
    C_Security -->|"creates administrator store"| C_Users
    C_Security -->|"creates"| C_Encoder
    C_Users -->|"uses encoded administrator password"| C_Encoder
    C_Filter -->|"HTTP Basic authentication"| C_Users
    C_Filter -.->|"filters gallery and upload requests"| C_Home
    C_Filter -.->|"filters detail and delete requests"| C_Detail
    C_Filter -.->|"permits public photo reads"| C_File
    C_Tx -.->|"wraps transactional service operations"| C_Impl
    C_Logging -.->|"records upload and persistence outcomes"| C_Impl
```

### Component Inventory

| Component | Layer | Type | Responsibility |
|---|---|---|---|
| `PhotoAlbumApplication` | Infrastructure | Boot entry point | Starts Spring Boot and enables component scanning/auto-configuration |
| `HomeController` | Presentation | MVC controller | `GET /` gallery; `POST /upload` multipart batches and JSON outcomes; local multipart exception handling |
| `DetailController` | Presentation | MVC controller | `GET /detail/{id}` detail/navigation; `POST /detail/{id}/delete` deletion and redirect feedback |
| `PhotoFileController` | Presentation | MVC controller | `GET /photo/{id}` database image bytes, content type, and no-cache response headers |
| `index.html`, `detail.html` | Presentation | Thymeleaf views | Gallery, upload UI, photo detail, previous/next links, deletion form |
| `layout.html` | Presentation | Additional template | Shared-layout markup exists; direct reuse by the standalone gallery/detail templates was not established |
| `upload.js`, `site.css` | Presentation | Static browser assets | Drag/drop selection, client MIME/size checks, Fetch upload, DOM gallery updates and styling |
| `PhotoService` | Business Logic | Service interface | Defines browsing, upload, retrieval, deletion, and adjacent-photo operations |
| `PhotoServiceImpl` | Business Logic | Constructor-injected transactional service | Validates upload size/MIME, extracts dimensions with ImageIO, applies pixel bound, persists and navigates photos |
| `UploadResult` | Business Logic | Result DTO | Carries success, filename, error message and generated photo ID to the upload controller |
| `PhotoRepository` | Data Access | Spring Data `JpaRepository<Photo, String>` | CRUD plus Oracle-native ordered gallery and timestamp navigation queries |
| `Photo` | Data Access / Model | JPA entity | UUID-based photo metadata and LOB bytes; upload-time index and validation annotations |
| `SecurityConfig` | Infrastructure | Spring configuration | Builds security chain, administrator store, and password encoder from external configuration |
| `SecurityFilterChain` | Infrastructure | Request filter chain bean | Stateless Basic authentication for upload/delete POSTs; otherwise permits access; disables CSRF |
| `InMemoryUserDetailsManager`, `PasswordEncoder` | Infrastructure | Security beans | Holds one configured administrator and BCrypt-encodes the supplied password; not a database user table |
| Spring transaction interception | Infrastructure | Framework interceptor | Applies service transaction boundaries, including read-only retrieval/navigation methods |
| SLF4J logging | Infrastructure | Cross-cutting logging API | Controllers and service log operations, failures, and photo-serving diagnostics |
| `application.properties`, `application-docker.properties` | Infrastructure | Externalized configuration | Datasource, Oracle dialect, schema creation, upload settings, logging and HTTP port |
| `Dockerfile`, `docker-compose.yml` | Infrastructure | Build/deployment definitions | Multi-stage JAR build; app/Oracle service topology, network, persistent database volume and startup ordering |

**Evidence:** `pom.xml`; `Dockerfile`; `docker-compose.yml`; `src/main/resources/application.properties`; `src/main/resources/application-docker.properties`; `src/main/java/com/photoalbum/PhotoAlbumApplication.java`; `src/main/java/com/photoalbum/config/SecurityConfig.java`; all three files in `src/main/java/com/photoalbum/controller/`; `src/main/java/com/photoalbum/service/PhotoService.java`; `src/main/java/com/photoalbum/service/impl/PhotoServiceImpl.java`; `src/main/java/com/photoalbum/repository/PhotoRepository.java`; `src/main/java/com/photoalbum/model/Photo.java`; `src/main/java/com/photoalbum/model/UploadResult.java`; `src/main/resources/templates/`; `src/main/resources/static/js/upload.js`; `src/test/resources/application-test.properties`.
