# Core Business Workflows

Photo Album is a small photo-sharing gallery: users browse photos publicly, while an authenticated admin uploads and deletes images stored in the database.

## Domain Entities

| Entity | Service / Bounded Context | Description | Key Relationships |
|--------|---------------------------|-------------|-------------------|
| Photo | Gallery | Uploaded image with metadata and binary data | Standalone; ordered by `uploadedAt` for previous/next navigation |
| UploadResult | Gallery | Outcome of a single file upload (success, file name, error, photo id) | Produced by PhotoService, consumed by HomeController |

## Service-to-Domain Mapping

| Service | Domain Context | Owned Entities | External Dependencies |
|---------|----------------|----------------|-----------------------|
| photoalbum-java-app | Photo gallery | Photo, UploadResult | Oracle database |

## Primary Workflows

### Workflow 1: Upload photos

1. Admin submits one or more files to `POST /upload` with HTTP Basic credentials.
2. For each file, `PhotoServiceImpl.uploadPhoto` validates the MIME type against the allow-list, size against 10MB, and non-empty content.
3. Image dimensions are read from the header; images above 40 million pixels are rejected.
4. A `Photo` (UUID id, upload timestamp) is saved with its bytes to Oracle.
5. The endpoint returns JSON with `uploadedPhotos` and `failedUploads`; partial success is allowed.

### Workflow 2: Browse gallery and view detail

1. `GET /` lists all photos newest first.
2. `GET /detail/{id}` loads a photo and resolves the previous (older) and next (newer) photo ids for navigation.
3. Images are rendered through `GET /photo/{id}`, which streams bytes with the stored MIME type.

### Workflow 3: Delete photo

1. Admin posts to `/detail/{id}/delete`; the photo is looked up and deleted.
2. The user is redirected to the gallery with a success or "Photo not found" flash message.

## Cross-Service Data Flows

Single service; no aggregation across services. All data flows between controllers, service and the Oracle database. If the database is unavailable, the gallery renders empty and detail/photo requests redirect or return 404/500.

## Business Workflow Sequence

~~~mermaid
sequenceDiagram
    participant Admin
    participant Ctrl as "HomeController"
    participant Svc as "PhotoServiceImpl"
    participant DB as "Oracle DB"
    participant Visitor

    Admin->>Ctrl: POST /upload files
    loop each file
        Ctrl->>Svc: uploadPhoto(file)
        alt Type not allowed or size too large or empty
            Svc-->>Ctrl: failure with message
        else Pixels exceed limit
            Svc-->>Ctrl: failure Image dimensions exceed limit
        else Valid
            Svc->>DB: save Photo with bytes
            Svc-->>Ctrl: success with photoId
        end
    end
    Ctrl-->>Admin: JSON uploaded and failed lists
    Visitor->>Ctrl: GET / and /detail/id
    Ctrl->>Svc: getAllPhotos / getPhotoById
    Svc->>DB: SELECT photos
    DB-->>Svc: rows
    Note over Svc: previous and next photos resolved by uploadedAt
    Svc-->>Visitor: rendered page and image bytes
~~~

## Business Rules & Decision Logic

- Allowed types: image/jpeg, image/png, image/gif, image/webp (from Content-Type header).
- Maximum file size 10MB; empty files rejected; decoded image limit 40 million pixels.
- Only authenticated users may upload or delete; viewing is public.
- Photo ids are random UUIDs; `uploadedAt` is assigned at creation and drives navigation ordering.
- Missing MIME type falls back to `application/octet-stream` in queries.
