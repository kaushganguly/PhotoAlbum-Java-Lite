# Architecture Diagram

Photo Album is a single-module Java 21 and Spring Boot 3.5.0 web application for browsing, uploading, viewing, and deleting photos. It renders a server-side gallery and stores both photo metadata and image bytes in Oracle Database.

## Application Architecture

```mermaid
flowchart TD
    subgraph Client["Client Layer"]
        A_Browser["Web browser - HTML and JavaScript upload client"]
    end
    subgraph App["Application Layer - Java 21 and Spring Boot 3.5.0"]
        A_Web["Spring MVC and Thymeleaf - HTTP port 8080"]
        A_Security["Spring Security - stateless HTTP Basic"]
        A_Business["Photo operations - upload validation and image header inspection"]
    end
    subgraph Data["Data Access Layer"]
        A_JPA["Spring Data JPA and Hibernate - Oracle JDBC"]
    end
    subgraph Storage["Data Storage"]
        A_Oracle[("Oracle Database - photos metadata and image BLOBs")]
        A_H2[("H2 - test profile only")]
    end
    subgraph External["External Services"]
        A_CDN["jsDelivr CDN - Bootstrap 5.3.0"]
    end

    A_Browser -->|"HTTP gallery and detail requests, multipart uploads and delete forms"| A_Security
    A_Security -->|"Public reads and authenticated upload or delete requests"| A_Web
    A_Web -->|"Photo queries and mutations"| A_Business
    A_Business -->|"Transactional persistence and navigation queries"| A_JPA
    A_JPA -->|"JDBC and Oracle-specific SQL"| A_Oracle
    A_JPA -.->|"Test profile persistence"| A_H2
    A_Web -->|"Rendered HTML, upload JSON and image bytes"| A_Browser
    A_Browser -->|"HTTPS retrieval of Bootstrap CSS and JavaScript"| A_CDN
```

### Technology Stack Summary

| Layer | Technology | Version | Purpose |
|---|---|---|---|
| Runtime and packaging | Java, Maven, Spring Boot executable JAR | Java 21; Spring Boot 3.5.0; Docker builder Maven 3.9.9 | Single application process; optional multi-stage container with Eclipse Temurin 21 JRE |
| Presentation | Spring MVC, Thymeleaf | Managed by Spring Boot 3.5.0 | Gallery and detail HTML, multipart upload JSON responses, image delivery |
| Browser UI | Bootstrap, JavaScript Fetch API | Bootstrap 5.3.0; browser-provided Fetch | Responsive gallery, asynchronous uploads and feedback |
| Security | Spring Security, BCrypt, in-memory user store | Managed by Spring Boot 3.5.0 | HTTP Basic authentication for upload and delete; public read access |
| Business logic | Spring services, transaction management, Java ImageIO | Spring Boot-managed Spring libraries; Java 21 ImageIO | Validate uploads, inspect dimensions, manage photo lifecycle and navigation |
| Data access | Spring Data JPA, Hibernate, Oracle JDBC ojdbc8 | Managed by Spring Boot 3.5.0 | Entity persistence and native Oracle queries |
| Production storage | Oracle Database | Server version not established by inspected application files | Store image BLOBs and metadata in the `photos` table |
| Test storage | H2 | Managed by Spring Boot 3.5.0; test scope | In-memory persistence under the test profile |

### Data Storage & External Services

Oracle is the application's persistent store: the `photos` table contains UUID identifiers, original filenames, MIME types, file sizes, timestamps, optional image dimensions, and image bytes mapped as a JPA large object. Photo delivery reads these bytes from the database rather than an upload filesystem or object store. Native repository queries use Oracle features such as `NVL`, `ROWNUM`, and `DUAL`. H2 is configured separately for tests. The browser retrieves Bootstrap assets from jsDelivr; no backend external API, message broker, or cache integration was identified. Default and Docker configurations use Hibernate schema creation (`ddl-auto=create`), rather than preserving the schema through migrations.

### Key Architectural Decisions

- A layered monolith uses constructor injection from controllers through a service interface to a Spring Data repository; transaction boundaries reside in the service implementation.
- Images and their metadata share database persistence, while ImageIO inspects image headers during upload and the web layer serves the stored bytes.
- Security is cross-cutting: gallery reads are public, upload and deletion require stateless HTTP Basic authentication, and the configured in-memory administrator uses BCrypt. CSRF protection is disabled in the current configuration; credential values are intentionally omitted.

## Component Relationships

```mermaid
flowchart LR
    subgraph Presentation["Presentation"]
        C_UploadJS["upload.js"]
        C_Home["HomeController"]
        C_Detail["DetailController"]
        C_File["PhotoFileController"]
        C_Views["Thymeleaf templates - index, detail and layout"]
    end
    subgraph Business["Business Logic"]
        C_Service["PhotoService"]
        C_Impl["PhotoServiceImpl"]
        C_Result["UploadResult"]
    end
    subgraph DataAccess["Data Access"]
        C_Repo["PhotoRepository"]
        C_Photo["Photo entity"]
    end
    subgraph Infrastructure["Infrastructure"]
        C_Boot["PhotoAlbumApplication"]
        C_Config["SecurityConfig"]
        C_Filter["SecurityFilterChain"]
        C_Users["InMemoryUserDetailsManager and BCryptPasswordEncoder"]
        C_Settings["Application properties and profile overrides"]
        C_Tx["Declarative transaction management"]
    end

    C_UploadJS -->|"Multipart POST and JSON feedback"| C_Home
    C_Home -->|"Gallery and upload operations"| C_Service
    C_Detail -->|"Detail, adjacent photos and deletion"| C_Service
    C_File -->|"Read photo for binary response"| C_Service
    C_Home -->|"Gallery model"| C_Views
    C_Detail -->|"Detail and navigation model"| C_Views
    C_Views -->|"Includes upload script on gallery page"| C_UploadJS
    C_Service -->|"Implemented by"| C_Impl
    C_Impl -->|"CRUD and native navigation queries"| C_Repo
    C_Repo -->|"Persists and returns"| C_Photo
    C_Impl -->|"Creates upload outcomes"| C_Result
    C_Home -->|"Maps outcomes into JSON response"| C_Result
    C_Config -->|"Defines"| C_Filter
    C_Config -->|"Defines"| C_Users
    C_Filter -->|"Authenticates using"| C_Users
    C_Filter -.->|"Protects upload"| C_Home
    C_Filter -.->|"Protects deletion"| C_Detail
    C_Filter -.->|"Permits public image reads"| C_File
    C_Settings -.->|"Injects upload limits and MIME allowlist"| C_Impl
    C_Settings -.->|"Injects administrator settings"| C_Config
    C_Tx -.->|"Wraps service operations"| C_Impl
    C_Boot -.->|"Bootstraps component scanning and auto-configuration"| Presentation
    C_Boot -.->|"Discovers services and repositories"| Business
    C_Boot -.->|"Enables persistence auto-configuration"| DataAccess
```

### Component Inventory

| Component | Layer | Type | Responsibility |
|---|---|---|---|
| `HomeController` | Presentation | Spring MVC controller | Render `/`; handle multipart `/upload` requests and upload errors; produce JSON feedback |
| `DetailController` | Presentation | Spring MVC controller | Render `/detail/{id}`, resolve older and newer photos, and handle deletion with redirects |
| `PhotoFileController` | Presentation | Spring MVC controller | Serve `/photo/{id}` as a byte-array resource using the stored MIME type and no-cache headers |
| `index.html`, `detail.html`, `layout.html` | Presentation | Thymeleaf templates | Gallery, photo detail, navigation, delete form, and shared layout template |
| `upload.js` | Presentation | Browser script | Submit multipart uploads with Fetch and update gallery feedback |
| `PhotoService` | Business Logic | Service interface | Define photo listing, lookup, upload, deletion, and navigation operations |
| `PhotoServiceImpl` | Business Logic | Transactional Spring service | Validate file size and MIME type, inspect image dimensions, coordinate repository access and upload outcomes |
| `UploadResult` | Business Logic | Result DTO | Carry upload success, photo identifier, filename, and error information |
| `PhotoRepository` | Data Access | Spring Data JPA repository | Standard CRUD plus native Oracle listing and timestamp-based navigation queries |
| `Photo` | Data Access | JPA entity with validation constraints | Map the `photos` table, metadata, UUID identifier, and binary photo data |
| `PhotoAlbumApplication` | Infrastructure | Spring Boot entry point | Start the executable application and enable component scanning and auto-configuration |
| `SecurityConfig` | Infrastructure | Spring configuration | Define the security chain, in-memory administrator, and password encoder |
| `SecurityFilterChain` | Infrastructure | HTTP security filter chain | Apply stateless HTTP Basic authentication to upload and delete endpoints; allow other requests |
| `InMemoryUserDetailsManager`, `BCryptPasswordEncoder` | Infrastructure | Authentication beans | Hold the configured administrator in memory and verify its BCrypt-encoded password |
| Application properties and profile overrides | Infrastructure | Externalized configuration | Supply datasource, JPA, HTTP, multipart, logging, and upload settings; provide a separate test database profile |
| Declarative transaction management | Infrastructure | Spring transaction interception | Apply service transactions and read-only semantics to photo retrieval operations |
