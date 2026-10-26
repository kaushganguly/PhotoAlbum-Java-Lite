# Dependency Map

Photo Album (`com.photoalbum:photo-album:1.0.0`) declares 11 direct dependencies (9 compile/runtime, 2 test-scoped plus the optional DevTools) on the `spring-boot-starter-parent` 3.5.0 BOM, resolving to roughly 100 artifacts including transitives.

## Dependencies

~~~mermaid
flowchart LR
    App["Photo Album 1.0.0"]
    BOM["spring-boot-starter-parent 3.5.0 BOM"]
    subgraph Web["Web Frameworks"]
        SWeb["spring-boot-starter-web 3.5.0"]
        Thyme["spring-boot-starter-thymeleaf 3.5.0"]
        Valid["spring-boot-starter-validation 3.5.0"]
    end
    subgraph DB["Database / ORM"]
        JPA["spring-boot-starter-data-jpa 3.5.0"]
        Hib["Hibernate Core 6.6.15"]
        Ojdbc["Oracle ojdbc8 23.7.0.25"]
    end
    subgraph Sec["Security"]
        SSec["spring-boot-starter-security 3.5.0"]
    end
    subgraph Log["Logging"]
        Logback["Logback 1.5.18 via starter"]
    end
    subgraph Util["Utilities"]
        CIO["commons-io 2.14.0"]
        Json["spring-boot-starter-json 3.5.0"]
        Dev["spring-boot-devtools 3.5.0 optional"]
    end

    BOM -.->|"manages versions"| App
    App -->|"web"| Web
    App -->|"persistence"| DB
    App -->|"security"| Sec
    App -->|"logging"| Log
    App -->|"utilities"| Util
    JPA -.->|"includes"| Hib
~~~

### Dependency Summary

| Category | Count | Key Libraries | Notes |
|----------|-------|---------------|-------|
| Web Frameworks | 3 | Spring Web MVC 6.2.7, Thymeleaf 3.1.3, Hibernate Validator | Embedded Tomcat 10.1.41 |
| Database / ORM | 3 | Spring Data JPA, Hibernate 6.6.15, ojdbc8 23.7.0.25 | Oracle-only runtime driver |
| Security | 1 | Spring Security 6.5.0 | HTTP Basic |
| Logging | 1 | Logback 1.5.18 / SLF4J 2.0.17 (via starter) | Default Spring Boot logging |
| Utilities | 3 | commons-io 2.14.0, Jackson 2.19.0, DevTools | commons-io is declared but not imported in source |

### Version & Compatibility Risks

Spring Boot 3.5.0 and its managed libraries (Spring Framework 6.2.7, Tomcat 10.1.41, Jackson 2.19.0, Spring Security 6.5.0, Logback 1.5.18) are behind current patch releases and have multiple published advisories; see the security assessment. `ojdbc8` targets Java 8 (ojdbc11 is recommended for Java 21). Oracle-specific native SQL limits portability to Azure-managed databases such as PostgreSQL.

### Notable Observations

- Versions are almost entirely governed by the Spring Boot parent BOM; only commons-io has an explicit version.
- `commons-io` has no usages in the source tree and could be removed.
- `spring-boot-devtools` is declared optional and should not ship in production images (the Dockerfile builds a plain jar, so repackaging excludes it).
- Spring Security was introduced to protect state-changing endpoints.

## Test Dependencies

| Framework | Version | Notes |
|-----------|---------|-------|
| spring-boot-starter-test | 3.5.0 | Bundles JUnit Jupiter 5.12.2, Mockito 5.17.0, AssertJ 3.27.3 |
| H2 Database | 2.3.232 | In-memory DB for the `test` profile |

Total test-scope dependencies: 2 declared (about 20 resolved including transitives).

Only a single `contextLoads` smoke test exists; there is no unit, controller or repository test coverage.
