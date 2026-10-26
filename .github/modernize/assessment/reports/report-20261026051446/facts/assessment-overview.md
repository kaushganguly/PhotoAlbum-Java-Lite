# Assessment overview

Supplementary analysis for Photo Album. These documents describe the current application, not a completed migration.

- [Architecture diagram](architecture-diagram.md) — Application components, deployment boundaries, and external dependencies.
- [Dependency map](dependency-map.md) — Build dependencies, frameworks, and runtime relationships.
- [API and service contracts](api-service-contracts.md) — HTTP endpoints, payloads, and service communication.
- [Data architecture](data-architecture.md) — Persistence model, database access, and photo storage.
- [Configuration inventory](configuration-inventory.md) — Application settings, environment variables, and deployment configuration.
- [Business workflows](business-workflows.md) — User-facing workflows and their implementation sequences.

See the [assessment report](../report.md) for migration and security findings.

## Security assessment

See the [security findings](../security/security-assessment.md) and [scan limitations](../security/scan-limitations.json). Dependency findings identify affected versions, not proven runtime exploitability; the merged report includes only medium-or-higher CVEs. Application vulnerabilities are documented, not remediated, by this assessment.
