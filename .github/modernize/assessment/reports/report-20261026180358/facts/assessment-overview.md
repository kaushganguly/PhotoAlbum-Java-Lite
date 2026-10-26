# Assessment Overview

Supplementary application analysis for report `20261026180358`. The following documents describe the current implementation; they do not represent implemented modernization changes.

The application runtime is Java 21. The automated core report also detected Python from assessment setup tooling; that is not an application runtime dependency. Core readiness findings require applicability review, and security advisory matches do not by themselves demonstrate exploitability.

| Document | Description |
| --- | --- |
| [Architecture diagram](architecture-diagram.md) | Application components, deployment boundaries, technologies, and relationships. |
| [Dependency map](dependency-map.md) | Build dependencies, managed versions, and dependency relationships. |
| [API and service contracts](api-service-contracts.md) | HTTP endpoints, request and response contracts, security, and service interactions. |
| [Data architecture](data-architecture.md) | Data model, persistence, file storage, and data sensitivity. |
| [Configuration inventory](configuration-inventory.md) | Application settings, environment variables, profiles, and deployment configuration. |
| [Business workflows](business-workflows.md) | Core user journeys, business rules, and workflow sequences. |

See the [assessment report](../report.md) for consolidated readiness and security findings, and the [security assessment](../security/security-assessment.md) for scan coverage, limitations, and detailed evidence.
