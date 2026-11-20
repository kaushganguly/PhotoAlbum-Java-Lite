# Architecture Diagram

The application serves a browser-based photo gallery, accepts image uploads, and stores photo records and binary content in a relational database.

## Application Architecture

```mermaid
flowchart TD
    subgraph Client["Client Layer"]
        Browser["Web Browser"]
    end
    subgraph Application["Application Layer - Spring Boot 3.5.0"]
        Web["Spring MVC and Thymeleaf"]
        Security["Spring Security HTTP Basic"]
        Controllers["Gallery, detail, and photo controllers"]
        Services["Photo service"]
        Repository["Spring Data JPA repository"]
        ORM["Hibernate ORM"]
    end
    subgraph Storage["Data Layer"]
        Oracle[("Oracle Database XE")]
    end

    Browser -->|"HTTP requests and image uploads"| Web
    Web --> Security
    Security -->|"authorized request"| Controllers
    Controllers -->|"photo operations"| Services
    Services -->|"CRUD and photo queries"| Repository
    Repository --> ORM
    ORM -->|"SQL and photo BLOB data"| Oracle
```

### Technology Stack Summary

| Layer | Technology | Version | Purpose |
|---|---|---:|---|
| Presentation | Spring MVC and Thymeleaf | Spring Boot 3.5.0 | Renders the gallery and photo detail pages and receives upload/delete requests |
| Security | Spring Security | Managed by Spring Boot 3.5.0 | Protects state-changing requests with stateless HTTP Basic authentication |
| Business logic | Spring service components | Spring Boot 3.5.0 | Validates image uploads, persists photos, and supports gallery navigation |
| Persistence | Spring Data JPA and Hibernate | Hibernate 6.6.15.Final | Repository access and ORM mapping |
| Database | Oracle Database XE | 21.3.0-xe in Compose | Stores photo metadata and binary content |

### Data Storage & External Services

Oracle Database XE is the only application data store. The `Photo` entity keeps image bytes in a database LOB; no cache, message broker, or external application API was identified.

### Key Architectural Decisions

- Uses Spring MVC controllers, a service layer, and a Spring Data JPA repository.
- Stores uploaded images in the database rather than on the application filesystem.
- Uses server-rendered Thymeleaf pages alongside a JSON response for uploads.

## Component Relationships

```mermaid
flowchart LR
    subgraph Presentation["Presentation"]
        Home["HomeController"]
        Detail["DetailController"]
        PhotoFile["PhotoFileController"]
    end
    subgraph Business["Business Logic"]
        PhotoService["PhotoService"]
        PhotoServiceImpl["PhotoServiceImpl"]
    end
    subgraph DataAccess["Data Access"]
        PhotoRepository["PhotoRepository"]
        PhotoEntity["Photo entity"]
    end
    subgraph Infrastructure["Infrastructure"]
        SecurityConfig["SecurityConfig"]
        Oracle["Oracle Database"]
    end

    Home -->|"gallery and upload operations"| PhotoService
    Detail -->|"detail and deletion operations"| PhotoService
    PhotoFile -->|"retrieve image bytes"| PhotoService
    PhotoService -->|"implemented by"| PhotoServiceImpl
    PhotoServiceImpl -->|"queries and saves"| PhotoRepository
    PhotoRepository -->|"maps"| PhotoEntity
    PhotoRepository -->|"JPA persistence"| Oracle
    SecurityConfig -.->|"protects state-changing requests"| Home
    SecurityConfig -.->|"protects deletion requests"| Detail
```

### Component Inventory

| Component | Layer | Type | Responsibility |
|---|---|---|---|
| `HomeController` | Presentation | Spring MVC controller | Displays the gallery and handles multi-file uploads |
| `DetailController` | Presentation | Spring MVC controller | Displays a photo and handles deletion |
| `PhotoFileController` | Presentation | Spring MVC controller | Serves stored photo bytes |
| `PhotoService` | Business Logic | Service interface | Defines photo retrieval, upload, deletion, and navigation operations |
| `PhotoServiceImpl` | Business Logic | Service | Applies upload checks and coordinates persistence |
| `PhotoRepository` | Data Access | Spring Data JPA repository | Retrieves and persists `Photo` records |
| `Photo` | Data Access | JPA entity | Represents photo metadata and stored binary content |
| `SecurityConfig` | Infrastructure | Security configuration | Configures HTTP Basic authentication and access rules |
