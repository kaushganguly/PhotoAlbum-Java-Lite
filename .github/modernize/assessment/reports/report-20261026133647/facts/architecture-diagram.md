# Architecture Diagram

Photo Album is a single-deployable Spring Boot 3.5 MVC application that stores photo binaries directly in an Oracle database and serves them through server-rendered Thymeleaf pages and a small JSON upload endpoint.

## Application Architecture

~~~mermaid
flowchart TD
    subgraph Client["Client Layer"]
        Browser["Web Browser - Thymeleaf pages, upload.js"]
    end
    subgraph App["Application Layer - Spring Boot 3.5.0 on Java 21"]
        Sec["Spring Security - HTTP Basic, stateless"]
        Web["Spring MVC Controllers"]
        Service["PhotoService business logic"]
        Views["Thymeleaf templates"]
    end
    subgraph Data["Data Layer"]
        JPA["Spring Data JPA + Hibernate 6.6"]
        DB[("Oracle Database XE 21c")]
    end
    subgraph Infra["Container Infrastructure"]
        Compose["Docker Compose - app + oracle-db"]
    end

    Browser -->|"HTTP GET pages and photos"| Web
    Browser -->|"POST /upload, POST /detail/id/delete"| Sec
    Sec -->|"authenticated or permitted"| Web
    Web -->|"renders model"| Views
    Web -->|"delegates"| Service
    Service -->|"CRUD and native queries"| JPA
    JPA -->|"SQL over JDBC ojdbc8"| DB
    Compose -.->|"runs"| App
    Compose -.->|"runs"| DB
~~~

### Technology Stack Summary

| Layer | Technology | Version | Purpose |
|-------|-----------|---------|---------|
| Runtime | Java (Temurin) | 21 | Application runtime |
| Framework | Spring Boot | 3.5.0 | Application framework and auto-configuration |
| Presentation | Spring MVC + Thymeleaf | 6.2.7 / 3.1.3 | Server-side rendered gallery and detail pages |
| Client scripting | Vanilla JavaScript + Bootstrap CSS | n/a | Multi-file upload with progress and error display |
| Security | Spring Security | 6.5.0 | HTTP Basic auth protecting upload and delete |
| Persistence | Spring Data JPA / Hibernate | 3.5.0 / 6.6.15 | ORM and repositories |
| Database | Oracle Database XE | 21.3.0 | Stores photo metadata and binary BLOB data |
| JDBC | Oracle ojdbc8 | 23.7.0.25.01 | Database driver |
| Packaging | Maven + Docker | 3.9.9 | Build and container image |

### Data Storage & External Services

All data, including photo binaries (`@Lob byte[]`), lives in a single Oracle `photos` table. There are no external web services, message brokers, caches or cloud SDKs. The only external system is the Oracle database, run as a sibling container in Docker Compose.

### Key Architectural Decisions

- Classic layered design (Controller -> Service -> Repository) with constructor injection and interface-based service.
- Photos are stored in the database rather than on a file system, so the app container is stateless.
- Repository queries use Oracle-specific SQL (NVL, ROWNUM, SYSDATE FROM DUAL), tightly coupling the data layer to Oracle.

## Component Relationships

~~~mermaid
flowchart LR
    subgraph Presentation
        HomeCtrl["HomeController"]
        DetailCtrl["DetailController"]
        FileCtrl["PhotoFileController"]
    end
    subgraph Business["Business Logic"]
        PhotoSvc["PhotoService"]
        PhotoSvcImpl["PhotoServiceImpl"]
    end
    subgraph DataAccess["Data Access"]
        PhotoRepo["PhotoRepository"]
        PhotoEntity["Photo entity"]
    end
    subgraph Infra["Infrastructure"]
        SecCfg["SecurityConfig"]
        Result["UploadResult"]
    end

    HomeCtrl -->|"upload and list"| PhotoSvc
    DetailCtrl -->|"view and delete"| PhotoSvc
    FileCtrl -->|"serve bytes"| PhotoSvc
    PhotoSvcImpl -.->|"implements"| PhotoSvc
    PhotoSvcImpl -->|"queries"| PhotoRepo
    PhotoSvcImpl -->|"returns"| Result
    PhotoRepo -->|"maps"| PhotoEntity
    SecCfg -.->|"filters upload and delete"| HomeCtrl
    SecCfg -.->|"filters upload and delete"| DetailCtrl
~~~

### Component Inventory

| Component | Layer | Type | Responsibility |
|-----------|-------|------|----------------|
| HomeController | Presentation | MVC Controller | Gallery page (`GET /`) and multi-file upload (`POST /upload`) |
| DetailController | Presentation | MVC Controller | Photo detail page with prev/next navigation and delete |
| PhotoFileController | Presentation | MVC Controller | Streams stored photo bytes (`GET /photo/{id}`) |
| PhotoService / PhotoServiceImpl | Business Logic | Service | Validation, dimension extraction, persistence, navigation |
| PhotoRepository | Data Access | Spring Data JPA repository | CRUD plus three Oracle native queries |
| Photo | Data Access | JPA entity | `photos` table mapping including BLOB |
| UploadResult | Business Logic | Result object | Per-file upload outcome |
| SecurityConfig | Infrastructure | Spring Security configuration | In-memory admin user, BCrypt, HTTP Basic, CSRF disabled |
