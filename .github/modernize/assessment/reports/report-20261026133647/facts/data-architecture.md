# Data Architecture & Persistence Layer

Photo Album persists all state in one Oracle table (`photos`) through Spring Data JPA/Hibernate, including the photo binaries stored as a BLOB.

## Database Configuration

| Service/Module | DB Type | Profile | Driver | Connection | Migration Tool |
|----------------|---------|---------|--------|------------|----------------|
| photo-album | Oracle XE 21c | default | `oracle.jdbc.OracleDriver` (ojdbc8) | `${SPRING_DATASOURCE_URL:jdbc:oracle:thin:@localhost:1521:XE}`, credentials from environment | None - Hibernate `ddl-auto=create` |
| photo-album | Oracle XE 21c | docker | `oracle.jdbc.OracleDriver` | `jdbc:oracle:thin:@oracle-db:1521:XE` | None - Hibernate `ddl-auto=create` |
| photo-album | H2 2.3.232 in-memory | test | `org.h2.Driver` | `jdbc:h2:mem:testdb` | `create-drop` |

## Data Ownership per Service

| Service | Tables Owned | ORM Framework | Caching | Notes |
|---------|--------------|---------------|---------|-------|
| photo-album | `photos` (index `idx_photos_uploaded_at`) | Hibernate 6.6.15 via Spring Data JPA | None | `ddl-auto=create` drops and recreates the schema on every start, so data is not preserved across restarts |

## Entity Model

~~~mermaid
erDiagram
    PHOTOS {
        string id PK "UUID string, length 36"
        string original_file_name "not null, max 255"
        bytes photo_data "BLOB, nullable"
        long file_size "not null, positive"
        string mime_type "not null, max 50"
        datetime uploaded_at "not null, indexed"
        int width "nullable"
        int height "nullable"
    }
~~~

## Key Repository Methods

| Service | Repository | Notable Methods | Purpose |
|---------|------------|-----------------|---------|
| photo-album | PhotoRepository | `findAllOrderByUploadedAtDesc()` | Native query, NVL on mime_type, newest first (loads all BLOBs) |
| photo-album | PhotoRepository | `findPhotosUploadedBefore(uploadedAt)` | Native Oracle query with ROWNUM limit 10 for previous navigation |
| photo-album | PhotoRepository | `findPhotosUploadedAfter(uploadedAt)` | Native Oracle query with SYSDATE FROM DUAL for next navigation |

## Caching Strategy

No caching layer is configured. HTTP responses for photo bytes are marked `no-cache, no-store, must-revalidate`, so every image request reads the BLOB from Oracle.

## Data Ownership Boundaries

Single application and single schema; no cross-service data access. The gallery query selects `photo_data` for every row, which makes page load cost grow with total stored bytes.

### Data Classification & Sensitivity

| Entity | Sensitive Fields | Classification (PII/PHI/PCI/None) | Controls in Place |
|--------|------------------|-----------------------------------|-------------------|
| Photo | `photo_data` (user-uploaded images), `original_file_name` | Potential PII (images may contain personal content) | Writes require authentication; reads are public; no encryption at rest at application level |
