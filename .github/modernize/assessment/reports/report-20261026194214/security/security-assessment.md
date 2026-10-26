# Security Assessment Report

**Generated:** 2026-10-26T19:52:53.771712+00:00

## Scope and limitations

- **Method:** Repository-wide static assessment of current application source/configuration, not a diff review; dependency inventory resolved using mvn dependency:tree without a build/test run.
- **Reviewed:** All 10 production Java classes, upload.js, three Thymeleaf template output contexts, both production property profiles, Dockerfile, docker-compose.yml, all four Oracle initialization files, .env.example and credential/security references in tracked top-level documentation. Test configuration and existing test were read for context, not treated as production secrets.
- **DependencyScope:** 104 unique resolved direct and transitive Maven coordinates across compile/runtime/test scopes (11 direct). This security skill intentionally expands the core direct-only CVE setting; per-finding scope/origin is retained. Runtime scope inferred from Maven is not proof that a jar is packaged/deployed.
- **AdvisorySource:** GitHub global Security Advisories HTTPS API; 4 batches of at most 30 coordinates, pagination supported, no failed batches, withdrawn advisories excluded; 85 deduplicated range matches. Exact dependency versions are compared to affected ranges; no attack/reachability verification.
- **CweScope:** 59 requested rules in six categories. One confirmed pattern per rule; other occurrences may exist. RulesPassed is a compatibility name for NOT_FOUND rules, not a security certification. The checklist files retain bounded negative evidence; wrapper-format NOT_FOUND evidence is empty as required by their schemas.
- **Excluded:** Git history, ignored/untracked local secrets, .github/agents, assessment/skill/generated artifacts, native/JVM/dependency internals, binary images, live cloud/deployment infrastructure and container/base-image advisories were not audited. These results do not cover every possible CWE (for example CSRF/TLS outside the requested rule set).
- **Validation:** No source remediation, test execution, application build, attack traffic, live credential validation, staging or commits. Assessment JSON/schema/count/path consistency is checked separately.
- **Secrets:** No secret values or credential payloads are reproduced. Environment variable names, public usernames and synthetic test/example placeholders are not production credential findings.
- **Confidence:** High confidence in cited static source patterns and advisory coordinate matches; exploitability, deployment conditions and operational impact are not verified.

## Summary

| Metric | Count |
|---|---:|
| Total findings | 81 |
| CVE advisory matches at medium or above | 74 |
| Confirmed CWE patterns | 7 |
| CWE rules assessed | 59 |
| Rules with no confirmed pattern (not a clean bill of health) | 52 |
| Low CVE matches excluded from merged findings | 11 |

Raw advisory matches: **12 critical, 30 high, 32 medium, 11 low**. The raw CVE file retains all 85. Advisory severity is not an assertion of application exploitability.

### By assessment severity

| Severity | Count |
|---|---:|
| mandatory | 44 |
| optional | 33 |
| potential | 4 |

### CWE category coverage

| Category | Assessed | FOUND | NOT_FOUND |
|---|---:|---:|---:|
| Code Quality | 16 | 3 | 13 |
| Concurrency & Synchronization | 6 | 0 | 6 |
| Credentials & Secrets | 5 | 1 | 4 |
| File & Path Security | 5 | 1 | 4 |
| Injection Attacks | 12 | 2 | 10 |
| Memory Safety | 15 | 0 | 15 |

## CWE findings (code/configuration patterns)

### CWE-606: Unchecked Input for Loop Condition
- **Category:** Code Quality
- **Assessment severity:** potential
- **Story points:** 3
- **Files:** `src/main/java/com/photoalbum/controller/HomeController.java:58-90`, `src/main/resources/application.properties:24-30`, `src/main/resources/application-docker.properties:20-27`

HomeController.uploadPhotos iterates the complete caller-supplied files list and performs per-file database work without enforcing app.file-upload.max-files-per-upload=10. The configured count is never read in production Java. Multipart total bytes are limited to 50MB, so the loop is not literally unbounded, but that byte cap does not enforce the intended ten-file limit and permits many small files and repeated database/image-processing operations. Upload authentication is required; excessive processing beyond the intended count is the confirmed pattern, not a measured service outage.

### CWE-665: Improper Initialization
- **Category:** Code Quality
- **Assessment severity:** potential
- **Story points:** 3
- **Files:** `src/main/resources/application.properties:17-21`, `src/main/resources/application-docker.properties:13-17`

Both normal and Docker profiles initialize the persistent Oracle schema using spring.jpa.hibernate.ddl-auto=create. Hibernate create recreates mapped tables on startup rather than retaining the existing photo data; docker-compose persists the Oracle data volume, so a routine application restart can destructively reinitialize previously stored gallery contents. This is configuration-level destructive resource initialization; actual database loss was not induced during this assessment.

### CWE-789: Memory Allocation with Excessive Size Value
- **Category:** Code Quality
- **Assessment severity:** potential
- **Story points:** 5
- **Files:** `src/main/java/com/photoalbum/repository/PhotoRepository.java:23-29`, `src/main/java/com/photoalbum/model/Photo.java:39-41`, `src/main/java/com/photoalbum/service/impl/PhotoServiceImpl.java:53-56`, `src/main/java/com/photoalbum/controller/HomeController.java:38-42`, `Dockerfile:27-28`

The public GET / handler calls getAllPhotos, which materializes all photo rows including photo_data into List<Photo>. Photo.photoData is an eager-by-default @Lob byte[] and the native SELECT explicitly includes every BLOB without pagination or a row/aggregate-byte cap. Total allocation therefore scales with the accumulated uploaded gallery size, not the per-file 10MB limit. With the documented 512MB heap, a sufficiently large gallery can cause substantial heap pressure on an unauthenticated request; repeated/concurrent requests compound it. No heap-exhaustion attack or production failure was executed.

### CWE-778: Insufficient Logging
- **Category:** Credentials & Secrets
- **Assessment severity:** potential
- **Story points:** 3
- **Files:** `src/main/java/com/photoalbum/service/impl/PhotoServiceImpl.java:191-205`, `src/main/java/com/photoalbum/controller/DetailController.java:64-75`, `src/main/java/com/photoalbum/config/SecurityConfig.java:46-59`

PhotoServiceImpl.deletePhoto logs the deleted photo ID and DetailController repeats the ID/success result, but neither records the authenticated principal or a request/correlation identifier. Upload success/rejection logs likewise omit the actor. SecurityConfig enables HTTP Basic without an application security-audit listener or explicit authentication-event logging. The confirmed gap is missing actor attribution for destructive operations, not complete absence of logging. Upstream proxy/SIEM/runtime audit controls were not available for inspection.

### CWE-434: Unrestricted Upload of File with Dangerous Type
- **Category:** File & Path Security
- **Assessment severity:** mandatory
- **Story points:** 8
- **Files:** `src/main/java/com/photoalbum/service/impl/PhotoServiceImpl.java:85-159`, `src/main/java/com/photoalbum/controller/PhotoFileController.java:74-83`

PhotoServiceImpl.uploadPhoto accepts the client-supplied Content-Type allowlist but does not reject bytes when ImageIO finds no reader (lines 124-143), and non-IO image inspection exceptions continue (149-152). The original bytes and supplied MIME type are then persisted (154-166) and publicly served by PhotoFileController. An authenticated uploader can therefore store arbitrary non-image data by claiming an allowed image MIME type. This is a confirmed fail-open upload-type check; executable server-side upload, browser script execution from these bytes, and decoder exploitation are not demonstrated.

### CWE-79: Improper Neutralization of Input During Web Page Generation ('Cross-site Scripting')
- **Category:** Injection Attacks
- **Assessment severity:** optional
- **Story points:** 8
- **Files:** `src/main/resources/static/js/upload.js:71-82`, `src/main/resources/static/js/upload.js:155-189`, `src/main/resources/static/js/upload.js:215-218`, `src/main/java/com/photoalbum/controller/HomeController.java:76-88`

In upload.js, file.name reaches errors (73) and showErrors.innerHTML (216-218) without HTML encoding. The original multipart filename also flows through HomeController.uploadPhotos into createPhotoCard HTML text/attributes (185-189), then insertAdjacentHTML (157). A specially named selected/dropped file can introduce executable markup into the uploading user browser. The error path occurs before authentication/network submission. The successful-upload path requires an authenticated upload. Server-rendered galleries use escaping Thymeleaf attributes/th:text; cross-user persistent XSS on a normal gallery reload is not established.

### CWE-89: Improper Neutralization of Special Elements used in an SQL Command ('SQL Injection')
- **Category:** Injection Attacks
- **Assessment severity:** mandatory
- **Story points:** 13
- **Files:** `oracle-init/01-create-user.sh:17-45`, `oracle-init/create-user.sh:19-37`

The Oracle initialization scripts interpolate APP_USER/APP_USER_UPPER and APP_USER_PASSWORD directly into an unquoted shell here-document containing PL/SQL string literals and EXECUTE IMMEDIATE statements (01-create-user.sh:25-28; create-user.sh:27-30). These externally supplied environment values are not escaped for the SQL string-literal/identifier contexts. Quote-bearing values can alter or break SQL executed as SYSTEM. This is an unsafe deployment-time SQL construction pattern, not a demonstrated HTTP injection: control of startup environment configuration is a prerequisite. No credential values or exploit payloads are reproduced.

## CVE findings (dependency advisory/version matches)

CVE entries may require configuration, platform, API usage or attacker prerequisites that are absent here. Test-scope findings do not imply production exposure. Listed first-patched releases apply to the advisory affected release line; consult the vendor for a compatible currently supported fixed version.

### CVE-2026-22732: Spring Security HTTP Headers Are not Written Under Some Conditions
- **Raw advisory severity:** critical
- **Assessment severity:** mandatory
- **Story points:** 1
- **Files:** `pom.xml:65`

[CVE-2026-22732](https://github.com/advisories/GHSA-mf92-479x-3373)

Severity: CRITICAL

Affected resolved dependencies:
- org.springframework.security:spring-security-web:6.5.0 (transitive via org.springframework.boot:spring-boot-starter-security; Maven scope compile; declaration pom.xml:65); affected range >= 6.5.0, < 6.5.9; recommended fix: upgrade to 6.5.9 or later on the applicable supported release line.

Presence/version match only: application reachability, deployment prerequisites, and exploitability have not been established. Test-scope coordinates do not imply production exposure.

### CVE-2026-40477: Improper restriction of the scope of accessible objects in Thymeleaf expressions
- **Raw advisory severity:** critical
- **Assessment severity:** mandatory
- **Story points:** 1
- **Files:** `pom.xml:40`

[CVE-2026-40477](https://github.com/advisories/GHSA-r4v4-5mwr-2fwr)

Severity: CRITICAL

Affected resolved dependencies:
- org.thymeleaf:thymeleaf-spring6:3.1.3.RELEASE (transitive via org.springframework.boot:spring-boot-starter-thymeleaf; Maven scope compile; declaration pom.xml:40); affected range <= 3.1.3.RELEASE; recommended fix: upgrade to 3.1.4.RELEASE or later on the applicable supported release line.
- org.thymeleaf:thymeleaf:3.1.3.RELEASE (transitive via org.springframework.boot:spring-boot-starter-thymeleaf; Maven scope compile; declaration pom.xml:40); affected range <= 3.1.3.RELEASE; recommended fix: upgrade to 3.1.4.RELEASE or later on the applicable supported release line.

Presence/version match only: application reachability, deployment prerequisites, and exploitability have not been established. Test-scope coordinates do not imply production exposure.

### CVE-2026-40478: Improper neutralization of specific syntax patterns for unauthorized expressions in Thymeleaf
- **Raw advisory severity:** critical
- **Assessment severity:** mandatory
- **Story points:** 1
- **Files:** `pom.xml:40`

[CVE-2026-40478](https://github.com/advisories/GHSA-xjw8-8c5c-9r79)

Severity: CRITICAL

Affected resolved dependencies:
- org.thymeleaf:thymeleaf-spring6:3.1.3.RELEASE (transitive via org.springframework.boot:spring-boot-starter-thymeleaf; Maven scope compile; declaration pom.xml:40); affected range <= 3.1.3.RELEASE; recommended fix: upgrade to 3.1.4.RELEASE or later on the applicable supported release line.
- org.thymeleaf:thymeleaf:3.1.3.RELEASE (transitive via org.springframework.boot:spring-boot-starter-thymeleaf; Maven scope compile; declaration pom.xml:40); affected range <= 3.1.3.RELEASE; recommended fix: upgrade to 3.1.4.RELEASE or later on the applicable supported release line.

Presence/version match only: application reachability, deployment prerequisites, and exploitability have not been established. Test-scope coordinates do not imply production exposure.

### CVE-2026-41293: Apache Tomcat - HTTP/2 request headers not validated
- **Raw advisory severity:** critical
- **Assessment severity:** mandatory
- **Story points:** 1
- **Files:** `pom.xml:34`

[CVE-2026-41293](https://github.com/advisories/GHSA-r29c-68gh-xp6x)

Severity: CRITICAL

Affected resolved dependencies:
- org.apache.tomcat.embed:tomcat-embed-core:10.1.41 (transitive via org.springframework.boot:spring-boot-starter-web; Maven scope compile; declaration pom.xml:34); affected range >= 10.1.0-M1, < 10.1.55; recommended fix: upgrade to 10.1.55 or later on the applicable supported release line.

Presence/version match only: application reachability, deployment prerequisites, and exploitability have not been established. Test-scope coordinates do not imply production exposure.

### CVE-2026-41901: Sandboxed Thymeleaf expressions vulnerable to improper recognition of unauthorized syntax patterns
- **Raw advisory severity:** critical
- **Assessment severity:** mandatory
- **Story points:** 1
- **Files:** `pom.xml:40`

[CVE-2026-41901](https://github.com/advisories/GHSA-c9ph-gxww-7744)

Severity: CRITICAL

Affected resolved dependencies:
- org.thymeleaf:thymeleaf-spring6:3.1.3.RELEASE (transitive via org.springframework.boot:spring-boot-starter-thymeleaf; Maven scope compile; declaration pom.xml:40); affected range <= 3.1.4.RELEASE; recommended fix: upgrade to 3.1.5.RELEASE or later on the applicable supported release line.
- org.thymeleaf:thymeleaf:3.1.3.RELEASE (transitive via org.springframework.boot:spring-boot-starter-thymeleaf; Maven scope compile; declaration pom.xml:40); affected range <= 3.1.4.RELEASE; recommended fix: upgrade to 3.1.5.RELEASE or later on the applicable supported release line.

Presence/version match only: application reachability, deployment prerequisites, and exploitability have not been established. Test-scope coordinates do not imply production exposure.

### CVE-2026-43512: Apache Tomcat - Digest authenticator will authenticate any unknown user
- **Raw advisory severity:** critical
- **Assessment severity:** mandatory
- **Story points:** 1
- **Files:** `pom.xml:34`

[CVE-2026-43512](https://github.com/advisories/GHSA-h6fc-48rj-7qqh)

Severity: CRITICAL

Affected resolved dependencies:
- org.apache.tomcat.embed:tomcat-embed-core:10.1.41 (transitive via org.springframework.boot:spring-boot-starter-web; Maven scope compile; declaration pom.xml:34); affected range >= 10.1.0-M1, < 10.1.55; recommended fix: upgrade to 10.1.55 or later on the applicable supported release line.

Presence/version match only: application reachability, deployment prerequisites, and exploitability have not been established. Test-scope coordinates do not imply production exposure.

### CVE-2026-43515: Apache Tomcat - Security constraints not correctly applied
- **Raw advisory severity:** critical
- **Assessment severity:** mandatory
- **Story points:** 1
- **Files:** `pom.xml:34`

[CVE-2026-43515](https://github.com/advisories/GHSA-5m62-pw8w-7w9f)

Severity: CRITICAL

Affected resolved dependencies:
- org.apache.tomcat.embed:tomcat-embed-core:10.1.41 (transitive via org.springframework.boot:spring-boot-starter-web; Maven scope compile; declaration pom.xml:34); affected range >= 10.1.0-M1, < 10.1.55; recommended fix: upgrade to 10.1.55 or later on the applicable supported release line.

Presence/version match only: application reachability, deployment prerequisites, and exploitability have not been established. Test-scope coordinates do not imply production exposure.

### CVE-2026-47884: Spring Framework Improper Path Limitation in XsltView
- **Raw advisory severity:** critical
- **Assessment severity:** mandatory
- **Story points:** 1
- **Files:** `pom.xml:34`

[CVE-2026-47884](https://github.com/advisories/GHSA-pc63-qcmh-9cmg)

Severity: CRITICAL

Affected resolved dependencies:
- org.springframework:spring-webmvc:6.2.7 (transitive via org.springframework.boot:spring-boot-starter-web; Maven scope compile; declaration pom.xml:34); affected range >= 6.2.0, <= 6.2.19; recommended fix: no patched version supplied for this affected range; consult the advisory/vendor for a supported fixed release or mitigation.

Presence/version match only: application reachability, deployment prerequisites, and exploitability have not been established. Test-scope coordinates do not imply production exposure.

### CVE-2026-47890: Spring Framework Server Sent Event stream corruption while rendering fragments
- **Raw advisory severity:** critical
- **Assessment severity:** mandatory
- **Story points:** 1
- **Files:** `pom.xml:34`

[CVE-2026-47890](https://github.com/advisories/GHSA-j9f9-w8pj-32f8)

Severity: CRITICAL

Affected resolved dependencies:
- org.springframework:spring-webmvc:6.2.7 (transitive via org.springframework.boot:spring-boot-starter-web; Maven scope compile; declaration pom.xml:34); affected range >= 6.2.0, <= 6.2.19; recommended fix: no patched version supplied for this affected range; consult the advisory/vendor for a supported fixed release or mitigation.

Presence/version match only: application reachability, deployment prerequisites, and exploitability have not been established. Test-scope coordinates do not imply production exposure.

### CVE-2026-65182: Apache Tomcat has an Improper Access Control, Incorrect Authorization vulnerability
- **Raw advisory severity:** critical
- **Assessment severity:** mandatory
- **Story points:** 1
- **Files:** `pom.xml:34`

[CVE-2026-65182](https://github.com/advisories/GHSA-gcx9-497g-6cp6)

Severity: CRITICAL

Affected resolved dependencies:
- org.apache.tomcat.embed:tomcat-embed-core:10.1.41 (transitive via org.springframework.boot:spring-boot-starter-web; Maven scope compile; declaration pom.xml:34); affected range >= 10.1.0-M1, < 10.1.58; recommended fix: upgrade to 10.1.58 or later on the applicable supported release line.

Presence/version match only: application reachability, deployment prerequisites, and exploitability have not been established. Test-scope coordinates do not imply production exposure.

### CVE-2026-65905: Apache Tomcat's DIGEST authenticator has an Authentication Bypass by Capture-replay vulnerability
- **Raw advisory severity:** critical
- **Assessment severity:** mandatory
- **Story points:** 1
- **Files:** `pom.xml:34`

[CVE-2026-65905](https://github.com/advisories/GHSA-9xv2-5v5q-p794)

Severity: CRITICAL

Affected resolved dependencies:
- org.apache.tomcat.embed:tomcat-embed-core:10.1.41 (transitive via org.springframework.boot:spring-boot-starter-web; Maven scope compile; declaration pom.xml:34); affected range >= 10.1.0-M1, < 10.1.58; recommended fix: upgrade to 10.1.58 or later on the applicable supported release line.

Presence/version match only: application reachability, deployment prerequisites, and exploitability have not been established. Test-scope coordinates do not imply production exposure.

### CVE-2026-68525: Apache Tomcat's FORM authentication process has an Incorrect Authorization vulnerability
- **Raw advisory severity:** critical
- **Assessment severity:** mandatory
- **Story points:** 1
- **Files:** `pom.xml:34`

[CVE-2026-68525](https://github.com/advisories/GHSA-h3x4-894j-xpx5)

Severity: CRITICAL

Affected resolved dependencies:
- org.apache.tomcat.embed:tomcat-embed-core:10.1.41 (transitive via org.springframework.boot:spring-boot-starter-web; Maven scope compile; declaration pom.xml:34); affected range >= 10.1.0-M1, < 10.1.58; recommended fix: upgrade to 10.1.58 or later on the applicable supported release line.

Presence/version match only: application reachability, deployment prerequisites, and exploitability have not been established. Test-scope coordinates do not imply production exposure.

### CVE-2025-41248: Spring Security annotation detection mechanism has authorization bypass
- **Raw advisory severity:** high
- **Assessment severity:** mandatory
- **Story points:** 1
- **Files:** `pom.xml:65`

[CVE-2025-41248](https://github.com/advisories/GHSA-8v5q-rhf3-jphm)

Severity: HIGH

Affected resolved dependencies:
- org.springframework.security:spring-security-core:6.5.0 (transitive via org.springframework.boot:spring-boot-starter-security; Maven scope compile; declaration pom.xml:65); affected range >= 6.5.0, < 6.5.4; recommended fix: upgrade to 6.5.4 or later on the applicable supported release line.

Presence/version match only: application reachability, deployment prerequisites, and exploitability have not been established. Test-scope coordinates do not imply production exposure.

### CVE-2025-41249: Spring Framework annotation detection mechanism may result in improper authorization
- **Raw advisory severity:** high
- **Assessment severity:** mandatory
- **Story points:** 1
- **Files:** `pom.xml:84`

[CVE-2025-41249](https://github.com/advisories/GHSA-jmp9-x22r-554x)

Severity: HIGH

Affected resolved dependencies:
- org.springframework:spring-core:6.2.7 (transitive via org.springframework.boot:spring-boot-starter-test; Maven scope compile; declaration pom.xml:84); affected range >= 6.2.0, <= 6.2.10; recommended fix: upgrade to 6.2.11 or later on the applicable supported release line.

Presence/version match only: application reachability, deployment prerequisites, and exploitability have not been established. Test-scope coordinates do not imply production exposure.

### CVE-2025-48988: Apache Tomcat - DoS in multipart upload
- **Raw advisory severity:** high
- **Assessment severity:** mandatory
- **Story points:** 1
- **Files:** `pom.xml:34`

[CVE-2025-48988](https://github.com/advisories/GHSA-h3gc-qfqq-6h8f)

Severity: HIGH

Affected resolved dependencies:
- org.apache.tomcat.embed:tomcat-embed-core:10.1.41 (transitive via org.springframework.boot:spring-boot-starter-web; Maven scope compile; declaration pom.xml:34); affected range >= 10.1.0-M1, <= 10.1.41; recommended fix: upgrade to 10.1.42 or later on the applicable supported release line.

Presence/version match only: application reachability, deployment prerequisites, and exploitability have not been established. Test-scope coordinates do not imply production exposure.

### CVE-2025-48989: Apache Tomcat Improper Resource Shutdown or Release vulnerability
- **Raw advisory severity:** high
- **Assessment severity:** mandatory
- **Story points:** 1
- **Files:** `pom.xml:34`

[CVE-2025-48989](https://github.com/advisories/GHSA-gqp3-2cvr-x8m3)

Severity: HIGH

Affected resolved dependencies:
- org.apache.tomcat.embed:tomcat-embed-core:10.1.41 (transitive via org.springframework.boot:spring-boot-starter-web; Maven scope compile; declaration pom.xml:34); affected range >= 10.1.0-M1, < 10.1.44; recommended fix: upgrade to 10.1.44 or later on the applicable supported release line.

Presence/version match only: application reachability, deployment prerequisites, and exploitability have not been established. Test-scope coordinates do not imply production exposure.

### CVE-2025-52520: Apache Tomcat Catalina is vulnerable to DoS attack through bypassing of size limits
- **Raw advisory severity:** high
- **Assessment severity:** mandatory
- **Story points:** 1
- **Files:** `pom.xml:34`

[CVE-2025-52520](https://github.com/advisories/GHSA-wr62-c79q-cv37)

Severity: HIGH

Affected resolved dependencies:
- org.apache.tomcat.embed:tomcat-embed-core:10.1.41 (transitive via org.springframework.boot:spring-boot-starter-web; Maven scope compile; declaration pom.xml:34); affected range >= 10.1.0-M1, < 10.1.43; recommended fix: upgrade to 10.1.43 or later on the applicable supported release line.

Presence/version match only: application reachability, deployment prerequisites, and exploitability have not been established. Test-scope coordinates do not imply production exposure.

### CVE-2025-53506: Apache Tomcat Coyote vulnerable to Denial of Service via excessive HTTP/2 streams
- **Raw advisory severity:** high
- **Assessment severity:** mandatory
- **Story points:** 1
- **Files:** `pom.xml:34`

[CVE-2025-53506](https://github.com/advisories/GHSA-25xr-qj8w-c4vf)

Severity: HIGH

Affected resolved dependencies:
- org.apache.tomcat.embed:tomcat-embed-core:10.1.41 (transitive via org.springframework.boot:spring-boot-starter-web; Maven scope compile; declaration pom.xml:34); affected range >= 10.1.0-M1, < 10.1.43; recommended fix: upgrade to 10.1.43 or later on the applicable supported release line.

Presence/version match only: application reachability, deployment prerequisites, and exploitability have not been established. Test-scope coordinates do not imply production exposure.

### CVE-2025-55752: Apache Tomcat Vulnerable to Relative Path Traversal
- **Raw advisory severity:** high
- **Assessment severity:** mandatory
- **Story points:** 1
- **Files:** `pom.xml:34`

[CVE-2025-55752](https://github.com/advisories/GHSA-wmwf-9ccg-fff5)

Severity: HIGH

Affected resolved dependencies:
- org.apache.tomcat.embed:tomcat-embed-core:10.1.41 (transitive via org.springframework.boot:spring-boot-starter-web; Maven scope compile; declaration pom.xml:34); affected range >= 10.1.0-M1, < 10.1.45; recommended fix: upgrade to 10.1.45 or later on the applicable supported release line.

Presence/version match only: application reachability, deployment prerequisites, and exploitability have not been established. Test-scope coordinates do not imply production exposure.

### CVE-2026-24400: AssertJ has XML External Entity (XXE) vulnerability when parsing untrusted XML via isXmlEqualTo assertion
- **Raw advisory severity:** high
- **Assessment severity:** mandatory
- **Story points:** 1
- **Files:** `pom.xml:84`

[CVE-2026-24400](https://github.com/advisories/GHSA-rqfh-9r24-8c9r)

Severity: HIGH

Affected resolved dependencies:
- org.assertj:assertj-core:3.27.3 (transitive via org.springframework.boot:spring-boot-starter-test; Maven scope test; declaration pom.xml:84); affected range >= 1.4.0, <= 3.27.6; recommended fix: upgrade to 3.27.7 or later on the applicable supported release line.

Presence/version match only: application reachability, deployment prerequisites, and exploitability have not been established. Test-scope coordinates do not imply production exposure.

### CVE-2026-24734: Apache Tomcat has an Improper Input Validation vulnerability
- **Raw advisory severity:** high
- **Assessment severity:** mandatory
- **Story points:** 1
- **Files:** `pom.xml:34`

[CVE-2026-24734](https://github.com/advisories/GHSA-mgp5-rv84-w37q)

Severity: HIGH

Affected resolved dependencies:
- org.apache.tomcat.embed:tomcat-embed-core:10.1.41 (transitive via org.springframework.boot:spring-boot-starter-web; Maven scope compile; declaration pom.xml:34); affected range >= 10.1.0-M7, < 10.1.52; recommended fix: upgrade to 10.1.52 or later on the applicable supported release line.

Presence/version match only: application reachability, deployment prerequisites, and exploitability have not been established. Test-scope coordinates do not imply production exposure.

### CVE-2026-24880: Apache Tomcat has an HTTP Request/Response Smuggling vulnerability
- **Raw advisory severity:** high
- **Assessment severity:** mandatory
- **Story points:** 1
- **Files:** `pom.xml:34`

[CVE-2026-24880](https://github.com/advisories/GHSA-563x-q5rq-57qp)

Severity: HIGH

Affected resolved dependencies:
- org.apache.tomcat.embed:tomcat-embed-core:10.1.41 (transitive via org.springframework.boot:spring-boot-starter-web; Maven scope compile; declaration pom.xml:34); affected range >= 10.1.0-M1, < 10.1.52; recommended fix: upgrade to 10.1.52 or later on the applicable supported release line.

Presence/version match only: application reachability, deployment prerequisites, and exploitability have not been established. Test-scope coordinates do not imply production exposure.

### CVE-2026-34483: Apache Tomcat has an Improper Encoding or Escaping of Output vulnerability in the JsonAccessLogValve
- **Raw advisory severity:** high
- **Assessment severity:** mandatory
- **Story points:** 1
- **Files:** `pom.xml:34`

[CVE-2026-34483](https://github.com/advisories/GHSA-rv64-5gf8-9qq8)

Severity: HIGH

Affected resolved dependencies:
- org.apache.tomcat.embed:tomcat-embed-core:10.1.41 (transitive via org.springframework.boot:spring-boot-starter-web; Maven scope compile; declaration pom.xml:34); affected range >= 10.1.0-M1, < 10.1.54; recommended fix: upgrade to 10.1.54 or later on the applicable supported release line.

Presence/version match only: application reachability, deployment prerequisites, and exploitability have not been established. Test-scope coordinates do not imply production exposure.

### CVE-2026-34487: Apache Tomcat vulnerable to Insertion of Sensitive Information into Log File
- **Raw advisory severity:** high
- **Assessment severity:** mandatory
- **Story points:** 1
- **Files:** `pom.xml:34`

[CVE-2026-34487](https://github.com/advisories/GHSA-x4m4-345f-5h5g)

Severity: HIGH

Affected resolved dependencies:
- org.apache.tomcat.embed:tomcat-embed-core:10.1.41 (transitive via org.springframework.boot:spring-boot-starter-web; Maven scope compile; declaration pom.xml:34); affected range >= 10.1.0-M1, < 10.1.54; recommended fix: upgrade to 10.1.54 or later on the applicable supported release line.

Presence/version match only: application reachability, deployment prerequisites, and exploitability have not been established. Test-scope coordinates do not imply production exposure.

### CVE-2026-40972: Spring Boot DevTools remote secret comparison is vulnerable to timing attacks
- **Raw advisory severity:** high
- **Assessment severity:** mandatory
- **Story points:** 1
- **Files:** `pom.xml:98`

[CVE-2026-40972](https://github.com/advisories/GHSA-56v8-86gj-66jp)

Severity: HIGH

Affected resolved dependencies:
- org.springframework.boot:spring-boot-devtools:3.5.0 (direct; Maven scope compile; declaration pom.xml:98); affected range >= 3.5.0, < 3.5.14; recommended fix: upgrade to 3.5.14 or later on the applicable supported release line.

Presence/version match only: application reachability, deployment prerequisites, and exploitability have not been established. Test-scope coordinates do not imply production exposure.

### CVE-2026-40973: Spring Boot accepts predictable temp directory without ownership verification
- **Raw advisory severity:** high
- **Assessment severity:** mandatory
- **Story points:** 1
- **Files:** `pom.xml:98`

[CVE-2026-40973](https://github.com/advisories/GHSA-wwpq-f5c3-7hvx)

Severity: HIGH

Affected resolved dependencies:
- org.springframework.boot:spring-boot:3.5.0 (transitive via org.springframework.boot:spring-boot-devtools; Maven scope compile; declaration pom.xml:98); affected range >= 3.5.0, < 3.5.14; recommended fix: upgrade to 3.5.14 or later on the applicable supported release line.

Presence/version match only: application reachability, deployment prerequisites, and exploitability have not been established. Test-scope coordinates do not imply production exposure.

### CVE-2026-41284: Apache Tomcat: Unbounded read in WebDAV LOCK and  PROPFIND handling
- **Raw advisory severity:** high
- **Assessment severity:** mandatory
- **Story points:** 1
- **Files:** `pom.xml:34`

[CVE-2026-41284](https://github.com/advisories/GHSA-gx5v-xp9w-j4cg)

Severity: HIGH

Affected resolved dependencies:
- org.apache.tomcat.embed:tomcat-embed-core:10.1.41 (transitive via org.springframework.boot:spring-boot-starter-web; Maven scope compile; declaration pom.xml:34); affected range >= 10.1.0-M1, < 10.1.55; recommended fix: upgrade to 10.1.55 or later on the applicable supported release line.

Presence/version match only: application reachability, deployment prerequisites, and exploitability have not been established. Test-scope coordinates do not imply production exposure.

### CVE-2026-41695: Spring Data: Unbounded property-path cache keyed by externally-supplied path string
- **Raw advisory severity:** high
- **Assessment severity:** mandatory
- **Story points:** 1
- **Files:** `pom.xml:46`

[CVE-2026-41695](https://github.com/advisories/GHSA-88fw-v6x4-3f58)

Severity: HIGH

Affected resolved dependencies:
- org.springframework.data:spring-data-commons:3.5.0 (transitive via org.springframework.boot:spring-boot-starter-data-jpa; Maven scope compile; declaration pom.xml:46); affected range >= 3.5.0, <= 3.5.11; recommended fix: upgrade to 3.5.12 or later on the applicable supported release line.

Presence/version match only: application reachability, deployment prerequisites, and exploitability have not been established. Test-scope coordinates do not imply production exposure.

### CVE-2026-41716: Spring Data Commons: Heap exhaustion from unbounded property-lookup cache retaining crafted string keys
- **Raw advisory severity:** high
- **Assessment severity:** mandatory
- **Story points:** 1
- **Files:** `pom.xml:46`

[CVE-2026-41716](https://github.com/advisories/GHSA-9fw2-h3hf-293r)

Severity: HIGH

Affected resolved dependencies:
- org.springframework.data:spring-data-commons:3.5.0 (transitive via org.springframework.boot:spring-boot-starter-data-jpa; Maven scope compile; declaration pom.xml:46); affected range >= 3.5.0, <= 3.5.11; recommended fix: upgrade to 3.5.12 or later on the applicable supported release line.

Presence/version match only: application reachability, deployment prerequisites, and exploitability have not been established. Test-scope coordinates do not imply production exposure.

### CVE-2026-41842: Spring Framework Denial of Service via Versioned Resources in Spring MVC and WebFlux
- **Raw advisory severity:** high
- **Assessment severity:** mandatory
- **Story points:** 1
- **Files:** `pom.xml:34`

[CVE-2026-41842](https://github.com/advisories/GHSA-x23c-287f-qqv5)

Severity: HIGH

Affected resolved dependencies:
- org.springframework:spring-webmvc:6.2.7 (transitive via org.springframework.boot:spring-boot-starter-web; Maven scope compile; declaration pom.xml:34); affected range >= 6.2.0, <= 6.2.18; recommended fix: upgrade to 6.2.19 or later on the applicable supported release line.

Presence/version match only: application reachability, deployment prerequisites, and exploitability have not been established. Test-scope coordinates do not imply production exposure.

### CVE-2026-41845: Spring Framework Cross-site Scripting via JavaScriptUtils
- **Raw advisory severity:** high
- **Assessment severity:** mandatory
- **Story points:** 1
- **Files:** `pom.xml:34`

[CVE-2026-41845](https://github.com/advisories/GHSA-3chg-m5w7-qfv5)

Severity: HIGH

Affected resolved dependencies:
- org.springframework:spring-webmvc:6.2.7 (transitive via org.springframework.boot:spring-boot-starter-web; Maven scope compile; declaration pom.xml:34); affected range >= 6.2.0, <= 6.2.18; recommended fix: upgrade to 6.2.19 or later on the applicable supported release line.

Presence/version match only: application reachability, deployment prerequisites, and exploitability have not been established. Test-scope coordinates do not imply production exposure.

### CVE-2026-41850: Spring Framework Algorithmic Denial of Service via SpEL Expressions
- **Raw advisory severity:** high
- **Assessment severity:** mandatory
- **Story points:** 1
- **Files:** `pom.xml:34`

[CVE-2026-41850](https://github.com/advisories/GHSA-r5w3-xv2f-j59q)

Severity: HIGH

Affected resolved dependencies:
- org.springframework:spring-expression:6.2.7 (transitive via org.springframework.boot:spring-boot-starter-web; Maven scope compile; declaration pom.xml:34); affected range >= 6.2.0, <= 6.2.18; recommended fix: upgrade to 6.2.19 or later on the applicable supported release line.

Presence/version match only: application reachability, deployment prerequisites, and exploitability have not been established. Test-scope coordinates do not imply production exposure.

### CVE-2026-42498: Apache Tomcat - WebSocket authentication header exposure
- **Raw advisory severity:** high
- **Assessment severity:** mandatory
- **Story points:** 1
- **Files:** `pom.xml:34`

[CVE-2026-42498](https://github.com/advisories/GHSA-fv25-8xcx-gqjc)

Severity: HIGH

Affected resolved dependencies:
- org.apache.tomcat.embed:tomcat-embed-core:10.1.41 (transitive via org.springframework.boot:spring-boot-starter-web; Maven scope compile; declaration pom.xml:34); affected range >= 10.1.0-M1, < 10.1.55; recommended fix: upgrade to 10.1.55 or later on the applicable supported release line.

Presence/version match only: application reachability, deployment prerequisites, and exploitability have not been established. Test-scope coordinates do not imply production exposure.

### CVE-2026-43513: Apache Tomcat: LockOutRealm treats user names as case-sensitive
- **Raw advisory severity:** high
- **Assessment severity:** mandatory
- **Story points:** 1
- **Files:** `pom.xml:34`

[CVE-2026-43513](https://github.com/advisories/GHSA-5mp6-jrq3-r938)

Severity: HIGH

Affected resolved dependencies:
- org.apache.tomcat.embed:tomcat-embed-core:10.1.41 (transitive via org.springframework.boot:spring-boot-starter-web; Maven scope compile; declaration pom.xml:34); affected range >= 10.1.0-M1, < 10.1.55; recommended fix: upgrade to 10.1.55 or later on the applicable supported release line.

Presence/version match only: application reachability, deployment prerequisites, and exploitability have not been established. Test-scope coordinates do not imply production exposure.

### CVE-2026-54512: jackson-databind has a PolymorphicTypeValidator bypass via generic type parameters that allows arbitrary class instantiation
- **Raw advisory severity:** high
- **Assessment severity:** mandatory
- **Story points:** 1
- **Files:** `pom.xml:78`

[CVE-2026-54512](https://github.com/advisories/GHSA-j3rv-43j4-c7qm)

Severity: HIGH

Affected resolved dependencies:
- com.fasterxml.jackson.core:jackson-databind:2.19.0 (transitive via org.springframework.boot:spring-boot-starter-json; Maven scope compile; declaration pom.xml:78); affected range >= 2.19.0, <= 2.21.3; recommended fix: upgrade to 2.21.4 or later on the applicable supported release line.

Presence/version match only: application reachability, deployment prerequisites, and exploitability have not been established. Test-scope coordinates do not imply production exposure.

### CVE-2026-54513: jackson-databind has an array subtype allowlist bypass in BasicPolymorphicTypeValidator (allowIfSubTypeIsArray)
- **Raw advisory severity:** high
- **Assessment severity:** mandatory
- **Story points:** 1
- **Files:** `pom.xml:78`

[CVE-2026-54513](https://github.com/advisories/GHSA-rmj7-2vxq-3g9f)

Severity: HIGH

Affected resolved dependencies:
- com.fasterxml.jackson.core:jackson-databind:2.19.0 (transitive via org.springframework.boot:spring-boot-starter-json; Maven scope compile; declaration pom.xml:78); affected range >= 2.19.0, < 2.21.4; recommended fix: upgrade to 2.21.4 or later on the applicable supported release line.

Presence/version match only: application reachability, deployment prerequisites, and exploitability have not been established. Test-scope coordinates do not imply production exposure.

### CVE-2026-68494: jackson-core: Async parser maxNumberLength bypass via chunked digit accumulation (incomplete fix for GHSA-72hv-8253-57qq)
- **Raw advisory severity:** high
- **Assessment severity:** mandatory
- **Story points:** 1
- **Files:** `pom.xml:78`

[CVE-2026-68494](https://github.com/advisories/GHSA-r7wm-3cxj-wff9)

Severity: HIGH

Affected resolved dependencies:
- com.fasterxml.jackson.core:jackson-core:2.19.0 (transitive via org.springframework.boot:spring-boot-starter-json; Maven scope compile; declaration pom.xml:78); affected range >= 2.19.0, < 2.21.4; recommended fix: upgrade to 2.21.4 or later on the applicable supported release line.

Presence/version match only: application reachability, deployment prerequisites, and exploitability have not been established. Test-scope coordinates do not imply production exposure.

### CVE-2026-68497: jackson-databind: Duration XMLGregorianCalendar Unbounded Number Parse DoS
- **Raw advisory severity:** high
- **Assessment severity:** mandatory
- **Story points:** 1
- **Files:** `pom.xml:78`

[CVE-2026-68497](https://github.com/advisories/GHSA-q4xh-88c3-wmh7)

Severity: HIGH

Affected resolved dependencies:
- com.fasterxml.jackson.core:jackson-databind:2.19.0 (transitive via org.springframework.boot:spring-boot-starter-json; Maven scope compile; declaration pom.xml:78); affected range >= 2.19.0, < 2.21.6; recommended fix: upgrade to 2.21.6 or later on the applicable supported release line.

Presence/version match only: application reachability, deployment prerequisites, and exploitability have not been established. Test-scope coordinates do not imply production exposure.

### CVE-2026-89407:  jackson-core: ReDoS: quadratic backtracking in NumberInput.PATTERN_FLOAT via looksLikeValidNumber()
- **Raw advisory severity:** high
- **Assessment severity:** mandatory
- **Story points:** 1
- **Files:** `pom.xml:78`

[CVE-2026-89407](https://github.com/advisories/GHSA-p6pp-m3f8-5c89)

Severity: HIGH

Affected resolved dependencies:
- com.fasterxml.jackson.core:jackson-core:2.19.0 (transitive via org.springframework.boot:spring-boot-starter-json; Maven scope compile; declaration pom.xml:78); affected range >= 2.19.0, <= 2.21.6; recommended fix: upgrade to 2.21.7 or later on the applicable supported release line.

Presence/version match only: application reachability, deployment prerequisites, and exploitability have not been established. Test-scope coordinates do not imply production exposure.

### CVE-2026-89425: jackson-core: UTF8DataInputJsonParser._reportInvalidToken() missing maxErrorTokenLength limit -> unbounded StringBuilder growth (DoS)
- **Raw advisory severity:** high
- **Assessment severity:** mandatory
- **Story points:** 1
- **Files:** `pom.xml:78`

[CVE-2026-89425](https://github.com/advisories/GHSA-7hhh-6rmp-j9qf)

Severity: HIGH

Affected resolved dependencies:
- com.fasterxml.jackson.core:jackson-core:2.19.0 (transitive via org.springframework.boot:spring-boot-starter-json; Maven scope compile; declaration pom.xml:78); affected range >= 2.19.0, <= 2.21.6; recommended fix: upgrade to 2.21.7 or later on the applicable supported release line.

Presence/version match only: application reachability, deployment prerequisites, and exploitability have not been established. Test-scope coordinates do not imply production exposure.

### CVE-2026-91776: jackson-databind retains every unknown raw type ID
- **Raw advisory severity:** high
- **Assessment severity:** mandatory
- **Story points:** 1
- **Files:** `pom.xml:78`

[CVE-2026-91776](https://github.com/advisories/GHSA-wv8q-qhhj-9h54)

Severity: HIGH

Affected resolved dependencies:
- com.fasterxml.jackson.core:jackson-databind:2.19.0 (transitive via org.springframework.boot:spring-boot-starter-json; Maven scope compile; declaration pom.xml:78); affected range >= 2.19.0, <= 2.21.6; recommended fix: upgrade to 2.21.7 or later on the applicable supported release line.

Presence/version match only: application reachability, deployment prerequisites, and exploitability have not been established. Test-scope coordinates do not imply production exposure.

### CVE-2026-91777: jackson-databind quadratic forward-reference completion
- **Raw advisory severity:** high
- **Assessment severity:** mandatory
- **Story points:** 1
- **Files:** `pom.xml:78`

[CVE-2026-91777](https://github.com/advisories/GHSA-cxp5-3px4-pw24)

Severity: HIGH

Affected resolved dependencies:
- com.fasterxml.jackson.core:jackson-databind:2.19.0 (transitive via org.springframework.boot:spring-boot-starter-json; Maven scope compile; declaration pom.xml:78); affected range >= 2.19.0, <= 2.21.6; recommended fix: upgrade to 2.21.7 or later on the applicable supported release line.

Presence/version match only: application reachability, deployment prerequisites, and exploitability have not been established. Test-scope coordinates do not imply production exposure.
### CVE-2025-11226: QOS.CH logback-core is vulnerable to Arbitrary Code Execution through file processing
- **Raw advisory severity:** medium
- **Assessment severity:** optional
- **Story points:** 1
- **Files:** `pom.xml:34`

[CVE-2025-11226](https://github.com/advisories/GHSA-25qh-j22f-pwp8)

Severity: MEDIUM

Affected resolved dependencies:
- ch.qos.logback:logback-core:1.5.18 (transitive via org.springframework.boot:spring-boot-starter-web; Maven scope compile; declaration pom.xml:34); affected range >= 1.4.0, < 1.5.19; recommended fix: upgrade to 1.5.19 or later on the applicable supported release line.

Presence/version match only: application reachability, deployment prerequisites, and exploitability have not been established. Test-scope coordinates do not imply production exposure.

### CVE-2025-41234: Spring Framework vulnerable to a reflected file download (RFD)
- **Raw advisory severity:** medium
- **Assessment severity:** optional
- **Story points:** 1
- **Files:** `pom.xml:34`

[CVE-2025-41234](https://github.com/advisories/GHSA-6r3c-xf4w-jxjm)

Severity: MEDIUM

Affected resolved dependencies:
- org.springframework:spring-web:6.2.7 (transitive via org.springframework.boot:spring-boot-starter-web; Maven scope compile; declaration pom.xml:34); affected range >= 6.2.0, < 6.2.8; recommended fix: upgrade to 6.2.8 or later on the applicable supported release line.

Presence/version match only: application reachability, deployment prerequisites, and exploitability have not been established. Test-scope coordinates do not imply production exposure.

### CVE-2025-41242: Spring Framework MVC Applications Path Traversal Vulnerability
- **Raw advisory severity:** medium
- **Assessment severity:** optional
- **Story points:** 1
- **Files:** `pom.xml:34`

[CVE-2025-41242](https://github.com/advisories/GHSA-r936-gwx5-v52f)

Severity: MEDIUM

Affected resolved dependencies:
- org.springframework:spring-webmvc:6.2.7 (transitive via org.springframework.boot:spring-boot-starter-web; Maven scope compile; declaration pom.xml:34); affected range >= 6.2.0, < 6.2.10; recommended fix: upgrade to 6.2.10 or later on the applicable supported release line.

Presence/version match only: application reachability, deployment prerequisites, and exploitability have not been established. Test-scope coordinates do not imply production exposure.

### CVE-2025-49124: Apache Tomcat installer for Windows has an untrusted search path vulnerability
- **Raw advisory severity:** medium
- **Assessment severity:** optional
- **Story points:** 1
- **Files:** `pom.xml:34`

[CVE-2025-49124](https://github.com/advisories/GHSA-42wg-hm62-jcwg)

Severity: MEDIUM

Affected resolved dependencies:
- org.apache.tomcat.embed:tomcat-embed-core:10.1.41 (transitive via org.springframework.boot:spring-boot-starter-web; Maven scope compile; declaration pom.xml:34); affected range >= 10.1.0, < 10.1.42; recommended fix: upgrade to 10.1.42 or later on the applicable supported release line.

Presence/version match only: application reachability, deployment prerequisites, and exploitability have not been established. Test-scope coordinates do not imply production exposure.

### CVE-2025-49125: Apache Tomcat - Security constraint bypass for pre/post-resources
- **Raw advisory severity:** medium
- **Assessment severity:** optional
- **Story points:** 1
- **Files:** `pom.xml:34`

[CVE-2025-49125](https://github.com/advisories/GHSA-wc4r-xq3c-5cf3)

Severity: MEDIUM

Affected resolved dependencies:
- org.apache.tomcat.embed:tomcat-embed-core:10.1.41 (transitive via org.springframework.boot:spring-boot-starter-web; Maven scope compile; declaration pom.xml:34); affected range >= 10.1.0-M1, <= 10.1.41; recommended fix: upgrade to 10.1.42 or later on the applicable supported release line.

Presence/version match only: application reachability, deployment prerequisites, and exploitability have not been established. Test-scope coordinates do not imply production exposure.

### CVE-2025-55668: Apache Tomcat Session Fixation vulnerability
- **Raw advisory severity:** medium
- **Assessment severity:** optional
- **Story points:** 1
- **Files:** `pom.xml:34`

[CVE-2025-55668](https://github.com/advisories/GHSA-23hv-mwm6-g8jf)

Severity: MEDIUM

Affected resolved dependencies:
- org.apache.tomcat.embed:tomcat-embed-core:10.1.41 (transitive via org.springframework.boot:spring-boot-starter-web; Maven scope compile; declaration pom.xml:34); affected range >= 10.1.0-M1, < 10.1.42; recommended fix: upgrade to 10.1.42 or later on the applicable supported release line.

Presence/version match only: application reachability, deployment prerequisites, and exploitability have not been established. Test-scope coordinates do not imply production exposure.

### CVE-2025-66614: Apache Tomcat - Client certificate verification bypass
- **Raw advisory severity:** medium
- **Assessment severity:** optional
- **Story points:** 1
- **Files:** `pom.xml:34`

[CVE-2025-66614](https://github.com/advisories/GHSA-fpj8-gq4v-p354)

Severity: MEDIUM

Affected resolved dependencies:
- org.apache.tomcat.embed:tomcat-embed-core:10.1.41 (transitive via org.springframework.boot:spring-boot-starter-web; Maven scope compile; declaration pom.xml:34); affected range >= 10.1.0-M1, < 10.1.50; recommended fix: upgrade to 10.1.50 or later on the applicable supported release line.

Presence/version match only: application reachability, deployment prerequisites, and exploitability have not been established. Test-scope coordinates do not imply production exposure.

### CVE-2026-18401: jackson-core: Number Length Constraint Bypass in Async Parser Leads to Potential DoS Condition
- **Raw advisory severity:** medium
- **Assessment severity:** optional
- **Story points:** 1
- **Files:** `pom.xml:78`

[CVE-2026-18401](https://github.com/advisories/GHSA-72hv-8253-57qq)

Severity: MEDIUM

Affected resolved dependencies:
- com.fasterxml.jackson.core:jackson-core:2.19.0 (transitive via org.springframework.boot:spring-boot-starter-json; Maven scope compile; declaration pom.xml:78); affected range >= 2.19.0, < 2.21.1; recommended fix: upgrade to 2.21.1 or later on the applicable supported release line.

Presence/version match only: application reachability, deployment prerequisites, and exploitability have not been established. Test-scope coordinates do not imply production exposure.

### CVE-2026-19032: jackson-databind: Path Deserialization Missing Scheme Allowlist for FileSystemProvider Resolution
- **Raw advisory severity:** medium
- **Assessment severity:** optional
- **Story points:** 1
- **Files:** `pom.xml:78`

[CVE-2026-19032](https://github.com/advisories/GHSA-wjgm-6hv5-3cvf)

Severity: MEDIUM

Affected resolved dependencies:
- com.fasterxml.jackson.core:jackson-databind:2.19.0 (transitive via org.springframework.boot:spring-boot-starter-json; Maven scope compile; declaration pom.xml:78); affected range >= 2.19.0, < 2.21.6; recommended fix: upgrade to 2.21.6 or later on the applicable supported release line.

Presence/version match only: application reachability, deployment prerequisites, and exploitability have not been established. Test-scope coordinates do not imply production exposure.

### CVE-2026-22737: Spring Framework Improper Path Limitation with Script View Templates
- **Raw advisory severity:** medium
- **Assessment severity:** optional
- **Story points:** 1
- **Files:** `pom.xml:34`

[CVE-2026-22737](https://github.com/advisories/GHSA-4773-3jfm-qmx3)

Severity: MEDIUM

Affected resolved dependencies:
- org.springframework:spring-webmvc:6.2.7 (transitive via org.springframework.boot:spring-boot-starter-web; Maven scope compile; declaration pom.xml:34); affected range >= 6.2.0, < 6.2.17; recommended fix: upgrade to 6.2.17 or later on the applicable supported release line.

Presence/version match only: application reachability, deployment prerequisites, and exploitability have not been established. Test-scope coordinates do not imply production exposure.

### CVE-2026-22745: Spring MVC and WebFlux applications are vulnerable to Denial of Service attacks when resolving static resources
- **Raw advisory severity:** medium
- **Assessment severity:** optional
- **Story points:** 1
- **Files:** `pom.xml:34`

[CVE-2026-22745](https://github.com/advisories/GHSA-6p4f-wcwh-5vvm)

Severity: MEDIUM

Affected resolved dependencies:
- org.springframework:spring-webmvc:6.2.7 (transitive via org.springframework.boot:spring-boot-starter-web; Maven scope compile; declaration pom.xml:34); affected range >= 6.2.0, <= 6.2.17; recommended fix: upgrade to 6.2.18 or later on the applicable supported release line.

Presence/version match only: application reachability, deployment prerequisites, and exploitability have not been established. Test-scope coordinates do not imply production exposure.

### CVE-2026-22751: Spring Security Core has a TOCTOU race condition when One-Time Token login with JdbcOneTimeTokenService is configured
- **Raw advisory severity:** medium
- **Assessment severity:** optional
- **Story points:** 1
- **Files:** `pom.xml:65`

[CVE-2026-22751](https://github.com/advisories/GHSA-x2wq-9x2f-fhj7)

Severity: MEDIUM

Affected resolved dependencies:
- org.springframework.security:spring-security-core:6.5.0 (transitive via org.springframework.boot:spring-boot-starter-security; Maven scope compile; declaration pom.xml:65); affected range >= 6.5.0, < 6.5.10; recommended fix: upgrade to 6.5.10 or later on the applicable supported release line.

Presence/version match only: application reachability, deployment prerequisites, and exploitability have not been established. Test-scope coordinates do not imply production exposure.

### CVE-2026-25854: Apache Tomcat has an Open Redirect vulnerability
- **Raw advisory severity:** medium
- **Assessment severity:** optional
- **Story points:** 1
- **Files:** `pom.xml:34`

[CVE-2026-25854](https://github.com/advisories/GHSA-9m3c-qcxr-9x87)

Severity: MEDIUM

Affected resolved dependencies:
- org.apache.tomcat.embed:tomcat-embed-core:10.1.41 (transitive via org.springframework.boot:spring-boot-starter-web; Maven scope compile; declaration pom.xml:34); affected range >= 10.1.0-M1, < 10.1.53; recommended fix: upgrade to 10.1.53 or later on the applicable supported release line.

Presence/version match only: application reachability, deployment prerequisites, and exploitability have not been established. Test-scope coordinates do not imply production exposure.

### CVE-2026-41001: Spring Boot: Predictable Temp Directory in Artemis Auto-configuration
- **Raw advisory severity:** medium
- **Assessment severity:** optional
- **Story points:** 1
- **Files:** `pom.xml:98`

[CVE-2026-41001](https://github.com/advisories/GHSA-ggg2-9786-hwc8)

Severity: MEDIUM

Affected resolved dependencies:
- org.springframework.boot:spring-boot-autoconfigure:3.5.0 (transitive via org.springframework.boot:spring-boot-devtools; Maven scope compile; declaration pom.xml:98); affected range >= 3.5.0, <= 3.5.14; recommended fix: upgrade to 3.5.15 or later on the applicable supported release line.

Presence/version match only: application reachability, deployment prerequisites, and exploitability have not been established. Test-scope coordinates do not imply production exposure.

### CVE-2026-41706: Spring Security: Open Redirect via Unvalidated Post-Login Redirect URL Stored in CookieRequestCache
- **Raw advisory severity:** medium
- **Assessment severity:** optional
- **Story points:** 1
- **Files:** `pom.xml:65`

[CVE-2026-41706](https://github.com/advisories/GHSA-x2r2-rvhq-2mqv)

Severity: MEDIUM

Affected resolved dependencies:
- org.springframework.security:spring-security-web:6.5.0 (transitive via org.springframework.boot:spring-boot-starter-security; Maven scope compile; declaration pom.xml:65); affected range >= 6.5.0, <= 6.5.10; recommended fix: upgrade to 6.5.11 or later on the applicable supported release line.

Presence/version match only: application reachability, deployment prerequisites, and exploitability have not been established. Test-scope coordinates do not imply production exposure.

### CVE-2026-41711: Spring Data Commons: StackOverflowException when parsing Sort parameters (DoS)
- **Raw advisory severity:** medium
- **Assessment severity:** optional
- **Story points:** 1
- **Files:** `pom.xml:46`

[CVE-2026-41711](https://github.com/advisories/GHSA-5vpf-xvv7-c8vh)

Severity: MEDIUM

Affected resolved dependencies:
- org.springframework.data:spring-data-commons:3.5.0 (transitive via org.springframework.boot:spring-boot-starter-data-jpa; Maven scope compile; declaration pom.xml:46); affected range >= 3.5.0, <= 3.5.11; recommended fix: upgrade to 3.5.12 or later on the applicable supported release line.

Presence/version match only: application reachability, deployment prerequisites, and exploitability have not been established. Test-scope coordinates do not imply production exposure.

### CVE-2026-41721: Spring Data Commons: Denial of Service via excessive memory allocation in projection binding
- **Raw advisory severity:** medium
- **Assessment severity:** optional
- **Story points:** 1
- **Files:** `pom.xml:46`

[CVE-2026-41721](https://github.com/advisories/GHSA-5m4m-73w9-8433)

Severity: MEDIUM

Affected resolved dependencies:
- org.springframework.data:spring-data-commons:3.5.0 (transitive via org.springframework.boot:spring-boot-starter-data-jpa; Maven scope compile; declaration pom.xml:46); affected range >= 3.5.0, <= 3.5.11; recommended fix: upgrade to 3.5.12 or later on the applicable supported release line.

Presence/version match only: application reachability, deployment prerequisites, and exploitability have not been established. Test-scope coordinates do not imply production exposure.

### CVE-2026-41841: Spring Framework Information Disclosure via Static Resource Cache in Spring MVC and WebFlux
- **Raw advisory severity:** medium
- **Assessment severity:** optional
- **Story points:** 1
- **Files:** `pom.xml:34`

[CVE-2026-41841](https://github.com/advisories/GHSA-mq64-j8f9-9gcj)

Severity: MEDIUM

Affected resolved dependencies:
- org.springframework:spring-webmvc:6.2.7 (transitive via org.springframework.boot:spring-boot-starter-web; Maven scope compile; declaration pom.xml:34); affected range >= 6.2.0, <= 6.2.18; recommended fix: upgrade to 6.2.19 or later on the applicable supported release line.

Presence/version match only: application reachability, deployment prerequisites, and exploitability have not been established. Test-scope coordinates do not imply production exposure.

### CVE-2026-41843: Spring Framework Path Traversal via Versioned Static Resources in Spring MVC and WebFlux
- **Raw advisory severity:** medium
- **Assessment severity:** optional
- **Story points:** 1
- **Files:** `pom.xml:34`

[CVE-2026-41843](https://github.com/advisories/GHSA-72pg-x5f8-j25j)

Severity: MEDIUM

Affected resolved dependencies:
- org.springframework:spring-webmvc:6.2.7 (transitive via org.springframework.boot:spring-boot-starter-web; Maven scope compile; declaration pom.xml:34); affected range >= 6.2.0, <= 6.2.18; recommended fix: upgrade to 6.2.19 or later on the applicable supported release line.

Presence/version match only: application reachability, deployment prerequisites, and exploitability have not been established. Test-scope coordinates do not imply production exposure.

### CVE-2026-41844: Spring Framework Open Redirect in Spring MVC and WebFlux
- **Raw advisory severity:** medium
- **Assessment severity:** optional
- **Story points:** 1
- **Files:** `pom.xml:34`

[CVE-2026-41844](https://github.com/advisories/GHSA-h3qp-gqrc-q736)

Severity: MEDIUM

Affected resolved dependencies:
- org.springframework:spring-webmvc:6.2.7 (transitive via org.springframework.boot:spring-boot-starter-web; Maven scope compile; declaration pom.xml:34); affected range >= 6.2.0, <= 6.2.18; recommended fix: upgrade to 6.2.19 or later on the applicable supported release line.

Presence/version match only: application reachability, deployment prerequisites, and exploitability have not been established. Test-scope coordinates do not imply production exposure.

### CVE-2026-41846: Spring Framework Cross-site Scripting via JSP Form Tags
- **Raw advisory severity:** medium
- **Assessment severity:** optional
- **Story points:** 1
- **Files:** `pom.xml:34`

[CVE-2026-41846](https://github.com/advisories/GHSA-957g-f97v-vppc)

Severity: MEDIUM

Affected resolved dependencies:
- org.springframework:spring-webmvc:6.2.7 (transitive via org.springframework.boot:spring-boot-starter-web; Maven scope compile; declaration pom.xml:34); affected range >= 6.2.0, <= 6.2.18; recommended fix: upgrade to 6.2.19 or later on the applicable supported release line.

Presence/version match only: application reachability, deployment prerequisites, and exploitability have not been established. Test-scope coordinates do not imply production exposure.

### CVE-2026-41851: Spring Framework Denial of Service via Unbounded Cache in SpEL
- **Raw advisory severity:** medium
- **Assessment severity:** optional
- **Story points:** 1
- **Files:** `pom.xml:34`

[CVE-2026-41851](https://github.com/advisories/GHSA-wxpp-56q6-5pcg)

Severity: MEDIUM

Affected resolved dependencies:
- org.springframework:spring-expression:6.2.7 (transitive via org.springframework.boot:spring-boot-starter-web; Maven scope compile; declaration pom.xml:34); affected range >= 6.2.0, <= 6.2.18; recommended fix: upgrade to 6.2.19 or later on the applicable supported release line.

Presence/version match only: application reachability, deployment prerequisites, and exploitability have not been established. Test-scope coordinates do not imply production exposure.

### CVE-2026-41853: Spring Framework Multipart Request Smuggling in Spring MVC and WebFlux
- **Raw advisory severity:** medium
- **Assessment severity:** optional
- **Story points:** 1
- **Files:** `pom.xml:34`

[CVE-2026-41853](https://github.com/advisories/GHSA-cjpg-rgq5-fr37)

Severity: MEDIUM

Affected resolved dependencies:
- org.springframework:spring-webmvc:6.2.7 (transitive via org.springframework.boot:spring-boot-starter-web; Maven scope compile; declaration pom.xml:34); affected range >= 6.2.0, <= 6.2.18; recommended fix: upgrade to 6.2.19 or later on the applicable supported release line.

Presence/version match only: application reachability, deployment prerequisites, and exploitability have not been established. Test-scope coordinates do not imply production exposure.

### CVE-2026-41854: Spring Framework Server-Side Request Forgery via UriComponentsBuilder
- **Raw advisory severity:** medium
- **Assessment severity:** optional
- **Story points:** 1
- **Files:** `pom.xml:34`

[CVE-2026-41854](https://github.com/advisories/GHSA-7m2p-62gw-p8qq)

Severity: MEDIUM

Affected resolved dependencies:
- org.springframework:spring-web:6.2.7 (transitive via org.springframework.boot:spring-boot-starter-web; Maven scope compile; declaration pom.xml:34); affected range >= 6.2.0, <= 6.2.18; recommended fix: upgrade to 6.2.19 or later on the applicable supported release line.

Presence/version match only: application reachability, deployment prerequisites, and exploitability have not been established. Test-scope coordinates do not imply production exposure.

### CVE-2026-47838: Spring Security Vulnerable to Unauthorized User Impersonation when Using X.509 Client Certificates
- **Raw advisory severity:** medium
- **Assessment severity:** optional
- **Story points:** 1
- **Files:** `pom.xml:65`

[CVE-2026-47838](https://github.com/advisories/GHSA-293q-567p-wmwq)

Severity: MEDIUM

Affected resolved dependencies:
- org.springframework.security:spring-security-web:6.5.0 (transitive via org.springframework.boot:spring-boot-starter-security; Maven scope compile; declaration pom.xml:65); affected range >= 6.5.0, <= 6.5.10; recommended fix: upgrade to 6.5.11 or later on the applicable supported release line.

Presence/version match only: application reachability, deployment prerequisites, and exploitability have not been established. Test-scope coordinates do not imply production exposure.

### CVE-2026-49844: Apache Log4j API: Improper encoding of non-finite floating-point values during MapMessage JSON serialization
- **Raw advisory severity:** medium
- **Assessment severity:** optional
- **Story points:** 1
- **Files:** `pom.xml:34`

[CVE-2026-49844](https://github.com/advisories/GHSA-qv9r-c865-cp47)

Severity: MEDIUM

Affected resolved dependencies:
- org.apache.logging.log4j:log4j-api:2.24.3 (transitive via org.springframework.boot:spring-boot-starter-web; Maven scope compile; declaration pom.xml:34); affected range >= 2.13.1, < 2.25.5; recommended fix: upgrade to 2.25.5 or later on the applicable supported release line.

Presence/version match only: application reachability, deployment prerequisites, and exploitability have not been established. Test-scope coordinates do not imply production exposure.

### CVE-2026-54514: jackson-databind: InetSocketAddress deserialization triggers eager DNS resolution (SSRF)
- **Raw advisory severity:** medium
- **Assessment severity:** optional
- **Story points:** 1
- **Files:** `pom.xml:78`

[CVE-2026-54514](https://github.com/advisories/GHSA-hgj6-7826-r7m5)

Severity: MEDIUM

Affected resolved dependencies:
- com.fasterxml.jackson.core:jackson-databind:2.19.0 (transitive via org.springframework.boot:spring-boot-starter-json; Maven scope compile; declaration pom.xml:78); affected range >= 2.19.0, < 2.21.4; recommended fix: upgrade to 2.21.4 or later on the applicable supported release line.

Presence/version match only: application reachability, deployment prerequisites, and exploitability have not been established. Test-scope coordinates do not imply production exposure.

### CVE-2026-54515: jackson-databind has case-insensitive deserialization bypasses per-property @JsonIgnoreProperties
- **Raw advisory severity:** medium
- **Assessment severity:** optional
- **Story points:** 1
- **Files:** `pom.xml:78`

[CVE-2026-54515](https://github.com/advisories/GHSA-5jmj-h7xm-6q6v)

Severity: MEDIUM

Affected resolved dependencies:
- com.fasterxml.jackson.core:jackson-databind:2.19.0 (transitive via org.springframework.boot:spring-boot-starter-json; Maven scope compile; declaration pom.xml:78); affected range >= 2.19.0, < 2.21.5; recommended fix: upgrade to 2.21.5 or later on the applicable supported release line.

Presence/version match only: application reachability, deployment prerequisites, and exploitability have not been established. Test-scope coordinates do not imply production exposure.

### CVE-2026-59888: jackson-databind: @JsonIgnore on a Record property is bypassed with a PropertyNamingStrategy
- **Raw advisory severity:** medium
- **Assessment severity:** optional
- **Story points:** 1
- **Files:** `pom.xml:78`

[CVE-2026-59888](https://github.com/advisories/GHSA-3pjw-73gf-8qr5)

Severity: MEDIUM

Affected resolved dependencies:
- com.fasterxml.jackson.core:jackson-databind:2.19.0 (transitive via org.springframework.boot:spring-boot-starter-json; Maven scope compile; declaration pom.xml:78); affected range >= 2.19.0, < 2.21.4; recommended fix: upgrade to 2.21.4 or later on the applicable supported release line.

Presence/version match only: application reachability, deployment prerequisites, and exploitability have not been established. Test-scope coordinates do not imply production exposure.

### CVE-2026-59889: jackson-databind: @JsonView bypassed for @JsonUnwrapped container properties on deserialization
- **Raw advisory severity:** medium
- **Assessment severity:** optional
- **Story points:** 1
- **Files:** `pom.xml:78`

[CVE-2026-59889](https://github.com/advisories/GHSA-5gvw-p9qm-jgwh)

Severity: MEDIUM

Affected resolved dependencies:
- com.fasterxml.jackson.core:jackson-databind:2.19.0 (transitive via org.springframework.boot:spring-boot-starter-json; Maven scope compile; declaration pom.xml:78); affected range >= 2.19.0, < 2.21.5; recommended fix: upgrade to 2.21.5 or later on the applicable supported release line.

Presence/version match only: application reachability, deployment prerequisites, and exploitability have not been established. Test-scope coordinates do not imply production exposure.

### CVE-2026-77310: jackson-databind: Incomplete fix for CVE-2026-54514: eager DNS resolution (SSRF) still present in InetAddress deserialization
- **Raw advisory severity:** medium
- **Assessment severity:** optional
- **Story points:** 1
- **Files:** `pom.xml:78`

[CVE-2026-77310](https://github.com/advisories/GHSA-vvgp-rfg2-7rr6)

Severity: MEDIUM

Affected resolved dependencies:
- com.fasterxml.jackson.core:jackson-databind:2.19.0 (transitive via org.springframework.boot:spring-boot-starter-json; Maven scope compile; declaration pom.xml:78); affected range >= 2.19.0, < 2.21.5; recommended fix: upgrade to 2.21.5 or later on the applicable supported release line.

Presence/version match only: application reachability, deployment prerequisites, and exploitability have not been established. Test-scope coordinates do not imply production exposure.

### CVE-2026-83557: jackson-databind: Comparable missing from DefaultBaseTypeLimitingValidator's unsafe base types (incomplete PolymorphicTypeValidator denylist)
- **Raw advisory severity:** medium
- **Assessment severity:** optional
- **Story points:** 1
- **Files:** `pom.xml:78`

[CVE-2026-83557](https://github.com/advisories/GHSA-gx83-3vf8-gh7j)

Severity: MEDIUM

Affected resolved dependencies:
- com.fasterxml.jackson.core:jackson-databind:2.19.0 (transitive via org.springframework.boot:spring-boot-starter-json; Maven scope compile; declaration pom.xml:78); affected range >= 2.19.0, < 2.21.6; recommended fix: upgrade to 2.21.6 or later on the applicable supported release line.

Presence/version match only: application reachability, deployment prerequisites, and exploitability have not been established. Test-scope coordinates do not imply production exposure.
