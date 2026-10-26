# API & Service Communication Contracts

The application exposes 5 HTTP endpoints from a single deployable service: server-rendered HTML pages, a JSON upload API and a binary photo endpoint. There are no outbound service calls.

## Service Catalog

| Service | Port | Category | Purpose |
|---------|------|----------|---------|
| photoalbum-java-app (`photo-album` module) | 8080 | Business | Photo gallery, upload, detail view, delete |
| oracle-db (third-party container, Oracle XE 21.3.0) | 1521 (SQL), 5500 (EM) | Infrastructure | Relational data store for the app |

## API Endpoints Inventory

| Service | Method | Path | Request Type | Response Type |
|---------|--------|------|--------------|---------------|
| photoalbum-java-app | GET | `/` | none | HTML view `index` (model `photos`) |
| photoalbum-java-app | POST | `/upload` (auth required) | multipart `files` (list of MultipartFile) | JSON map: `success`, `uploadedPhotos`, `failedUploads`; 400 if no files |
| photoalbum-java-app | GET | `/detail/{id}` | path `id` | HTML view `detail`; redirects to `/` if not found |
| photoalbum-java-app | POST | `/detail/{id}/delete` (auth required) | path `id` | 302 redirect to `/` with flash message |
| photoalbum-java-app | GET | `/photo/{id}` | path `id` | Binary image (`ByteArrayResource`) with stored MIME type; 404 if missing |

## Management & Observability Endpoints

| Service | Endpoint | Custom Metrics (if any) |
|---------|----------|-------------------------|
| photoalbum-java-app | None (Spring Boot Actuator not included) | None |

## DTOs & Contracts

`UploadResult` is an internal mutable result object (not serialized directly); the upload endpoint builds `Map<String,Object>` responses by hand. `Photo` is the JPA entity and is passed to Thymeleaf views (see `data-architecture.md`). There are no records, OpenAPI/Swagger specs, protobuf or GraphQL schemas. JSON serialization uses Spring Boot's default Jackson configuration. Multipart limits: 10MB per file, 50MB per request, max 10 files per upload configured.

## Communication Patterns

- **Synchronous only**: browser to controller over HTTP; controller to service by direct method calls; JPA to Oracle over JDBC.
- **Asynchronous**: none (no queues, events or schedulers).
- **Resilience**: no circuit breaker, retry or timeout configuration; service failures return an error page redirect or an empty gallery.
- **Service discovery / gateway / load balancing**: none; the app reaches the database by the fixed host name `oracle-db` on the Compose network.
- **Startup dependency chain**: the app starts only after the Oracle container is healthy (see `configuration-inventory.md`).
- **Security posture**: HTTP Basic authentication protects `POST /upload` and `POST /detail/*/delete` (in-memory ADMIN user, BCrypt). All other endpoints, including photo reads, are public. CSRF is disabled, and no TLS is configured (plain HTTP on 8080).

## Service Technology Matrix

| Service | Web | Data Access | Discovery | Gateway | Actuator | Cache | Metrics |
|---------|-----|-------------|-----------|---------|----------|-------|---------|
| photoalbum-java-app | Spring MVC + Thymeleaf | Spring Data JPA | none | none | none | none | none |

## Service Communication Sequence

~~~mermaid
sequenceDiagram
    participant Client
    participant Sec as "Spring Security"
    participant Home as "HomeController"
    participant Svc as "PhotoServiceImpl"
    participant Repo as "PhotoRepository"
    participant DB as "Oracle DB"

    Client->>Sec: POST /upload (Basic auth, multipart files)
    alt Credentials invalid
        Sec-->>Client: 401 Unauthorized
    else Authenticated
        Sec->>Home: uploadPhotos(files)
        loop each file
            Home->>Svc: uploadPhoto(file)
            alt Invalid type, size or dimensions
                Svc-->>Home: UploadResult(success=false)
            else Valid
                Svc->>Repo: save(photo)
                Repo->>DB: INSERT photos
                DB-->>Repo: ok
                Svc-->>Home: UploadResult(success=true, photoId)
                Home->>Svc: getPhotoById(photoId)
            end
        end
        Home-->>Client: 200 JSON uploadedPhotos and failedUploads
    end
    Client->>Home: GET /photo/id
    Home-->>Client: image bytes with stored Content-Type
~~~
