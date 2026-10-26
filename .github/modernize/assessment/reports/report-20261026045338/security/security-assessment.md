# Security Assessment Report

**Generated:** 2026-10-26T05:01:38.908420Z

## Summary

| Metric | Count |
|--------|-------|
| Total Findings | 75 |
| CVE Vulnerabilities | 74 |
| CWE Vulnerabilities | 1 |
| Total Rules Assessed | 59 |
| Rules Passed | 58 |

Minimum CVE severity: **medium**. Eleven low-severity advisories are excluded from the merged findings; the raw CVE results retain them.

### Scope and limitations

- Maven resolved 104 dependencies: 11 direct and 93 transitive, including test dependencies. Evidence records package scope and the declaring dependency.
- All 59 CWE rules were reviewed sequentially across six categories. NOT_FOUND means no confirmed instance, not proof of absence.
- Advisory data identifies affected package versions; deployment-specific exploitability is not established.
- Static review only; application tests and exploit execution were not performed.
- No application source was changed.

### By Severity

| Severity | Count |
|----------|-------|
| mandatory | 42 |
| optional | 33 |
| potential | 0 |

## CVE Findings (Dependency Vulnerabilities)

### CVE-2025-11226: QOS.CH logback-core is vulnerable to Arbitrary Code Execution through file processing
- **Category:** CVE
- **Severity:** optional
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2025-11226](https://github.com/advisories/GHSA-25qh-j22f-pwp8): QOS.CH logback-core is vulnerable to Arbitrary Code Execution through file processing

Severity: MEDIUM

Affected dependencies:
- ch.qos.logback:logback-core:1.5.18 (transitive via org.springframework.boot:spring-boot-starter-web; compile scope; pom.xml:34); affected range >= 1.4.0, < 1.5.19

Recommended fix:
- Upgrade ch.qos.logback:logback-core to 1.5.19 or later.

Dependency presence is established; advisory-specific exploit preconditions require deployment review.

### CVE-2025-41234: Spring Framework vulnerable to a reflected file download (RFD)
- **Category:** CVE
- **Severity:** optional
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2025-41234](https://github.com/advisories/GHSA-6r3c-xf4w-jxjm): Spring Framework vulnerable to a reflected file download (RFD)

Severity: MEDIUM

Affected dependencies:
- org.springframework:spring-web:6.2.7 (transitive via org.springframework.boot:spring-boot-starter-web; compile scope; pom.xml:34); affected range >= 6.2.0, < 6.2.8

Recommended fix:
- Upgrade org.springframework:spring-web to 6.2.8 or later.

Dependency presence is established; advisory-specific exploit preconditions require deployment review.

### CVE-2025-41242: Spring Framework MVC Applications Path Traversal Vulnerability
- **Category:** CVE
- **Severity:** optional
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2025-41242](https://github.com/advisories/GHSA-r936-gwx5-v52f): Spring Framework MVC Applications Path Traversal Vulnerability

Severity: MEDIUM

Affected dependencies:
- org.springframework:spring-webmvc:6.2.7 (transitive via org.springframework.boot:spring-boot-starter-web; compile scope; pom.xml:34); affected range >= 6.2.0, < 6.2.10

Recommended fix:
- Upgrade org.springframework:spring-webmvc to 6.2.10 or later.

Dependency presence is established; advisory-specific exploit preconditions require deployment review.

### CVE-2025-41248: Spring Security annotation detection mechanism has authorization bypass
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:65

[CVE-2025-41248](https://github.com/advisories/GHSA-8v5q-rhf3-jphm): Spring Security annotation detection mechanism has authorization bypass

Severity: HIGH

Affected dependencies:
- org.springframework.security:spring-security-core:6.5.0 (transitive via org.springframework.boot:spring-boot-starter-security; compile scope; pom.xml:65); affected range >= 6.5.0, < 6.5.4

Recommended fix:
- Upgrade org.springframework.security:spring-security-core to 6.5.4 or later.

Dependency presence is established; advisory-specific exploit preconditions require deployment review.

### CVE-2025-41249: Spring Framework annotation detection mechanism may result in improper authorization
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:84

[CVE-2025-41249](https://github.com/advisories/GHSA-jmp9-x22r-554x): Spring Framework annotation detection mechanism may result in improper authorization

Severity: HIGH

Affected dependencies:
- org.springframework:spring-core:6.2.7 (transitive via org.springframework.boot:spring-boot-starter-test; compile scope; pom.xml:84); affected range >= 6.2.0, <= 6.2.10

Recommended fix:
- Upgrade org.springframework:spring-core to 6.2.11 or later.

Dependency presence is established; advisory-specific exploit preconditions require deployment review.

### CVE-2025-48988: Apache Tomcat - DoS in multipart upload
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2025-48988](https://github.com/advisories/GHSA-h3gc-qfqq-6h8f): Apache Tomcat - DoS in multipart upload

Severity: HIGH

Affected dependencies:
- org.apache.tomcat.embed:tomcat-embed-core:10.1.41 (transitive via org.springframework.boot:spring-boot-starter-web; compile scope; pom.xml:34); affected range >= 10.1.0-M1, <= 10.1.41

Recommended fix:
- Upgrade org.apache.tomcat.embed:tomcat-embed-core to 10.1.42 or later.

Dependency presence is established; advisory-specific exploit preconditions require deployment review.

### CVE-2025-48989: Apache Tomcat Improper Resource Shutdown or Release vulnerability
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2025-48989](https://github.com/advisories/GHSA-gqp3-2cvr-x8m3): Apache Tomcat Improper Resource Shutdown or Release vulnerability

Severity: HIGH

Affected dependencies:
- org.apache.tomcat.embed:tomcat-embed-core:10.1.41 (transitive via org.springframework.boot:spring-boot-starter-web; compile scope; pom.xml:34); affected range >= 10.1.0-M1, < 10.1.44

Recommended fix:
- Upgrade org.apache.tomcat.embed:tomcat-embed-core to 10.1.44 or later.

Dependency presence is established; advisory-specific exploit preconditions require deployment review.

### CVE-2025-49124: Apache Tomcat installer for Windows has an untrusted search path vulnerability
- **Category:** CVE
- **Severity:** optional
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2025-49124](https://github.com/advisories/GHSA-42wg-hm62-jcwg): Apache Tomcat installer for Windows has an untrusted search path vulnerability

Severity: MEDIUM

Affected dependencies:
- org.apache.tomcat.embed:tomcat-embed-core:10.1.41 (transitive via org.springframework.boot:spring-boot-starter-web; compile scope; pom.xml:34); affected range >= 10.1.0, < 10.1.42

Recommended fix:
- Upgrade org.apache.tomcat.embed:tomcat-embed-core to 10.1.42 or later.

Dependency presence is established; advisory-specific exploit preconditions require deployment review.

### CVE-2025-49125: Apache Tomcat - Security constraint bypass for pre/post-resources
- **Category:** CVE
- **Severity:** optional
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2025-49125](https://github.com/advisories/GHSA-wc4r-xq3c-5cf3): Apache Tomcat - Security constraint bypass for pre/post-resources

Severity: MEDIUM

Affected dependencies:
- org.apache.tomcat.embed:tomcat-embed-core:10.1.41 (transitive via org.springframework.boot:spring-boot-starter-web; compile scope; pom.xml:34); affected range >= 10.1.0-M1, <= 10.1.41

Recommended fix:
- Upgrade org.apache.tomcat.embed:tomcat-embed-core to 10.1.42 or later.

Dependency presence is established; advisory-specific exploit preconditions require deployment review.

### CVE-2025-52520: Apache Tomcat Catalina is vulnerable to DoS attack through bypassing of size limits
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2025-52520](https://github.com/advisories/GHSA-wr62-c79q-cv37): Apache Tomcat Catalina is vulnerable to DoS attack through bypassing of size limits

Severity: HIGH

Affected dependencies:
- org.apache.tomcat.embed:tomcat-embed-core:10.1.41 (transitive via org.springframework.boot:spring-boot-starter-web; compile scope; pom.xml:34); affected range >= 10.1.0-M1, < 10.1.43

Recommended fix:
- Upgrade org.apache.tomcat.embed:tomcat-embed-core to 10.1.43 or later.

Dependency presence is established; advisory-specific exploit preconditions require deployment review.

### CVE-2025-53506: Apache Tomcat Coyote vulnerable to Denial of Service via excessive HTTP/2 streams
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2025-53506](https://github.com/advisories/GHSA-25xr-qj8w-c4vf): Apache Tomcat Coyote vulnerable to Denial of Service via excessive HTTP/2 streams

Severity: HIGH

Affected dependencies:
- org.apache.tomcat.embed:tomcat-embed-core:10.1.41 (transitive via org.springframework.boot:spring-boot-starter-web; compile scope; pom.xml:34); affected range >= 10.1.0-M1, < 10.1.43

Recommended fix:
- Upgrade org.apache.tomcat.embed:tomcat-embed-core to 10.1.43 or later.

Dependency presence is established; advisory-specific exploit preconditions require deployment review.

### CVE-2025-55668: Apache Tomcat Session Fixation vulnerability
- **Category:** CVE
- **Severity:** optional
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2025-55668](https://github.com/advisories/GHSA-23hv-mwm6-g8jf): Apache Tomcat Session Fixation vulnerability

Severity: MEDIUM

Affected dependencies:
- org.apache.tomcat.embed:tomcat-embed-core:10.1.41 (transitive via org.springframework.boot:spring-boot-starter-web; compile scope; pom.xml:34); affected range >= 10.1.0-M1, < 10.1.42

Recommended fix:
- Upgrade org.apache.tomcat.embed:tomcat-embed-core to 10.1.42 or later.

Dependency presence is established; advisory-specific exploit preconditions require deployment review.

### CVE-2025-55752: Apache Tomcat Vulnerable to Relative Path Traversal
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2025-55752](https://github.com/advisories/GHSA-wmwf-9ccg-fff5): Apache Tomcat Vulnerable to Relative Path Traversal

Severity: HIGH

Affected dependencies:
- org.apache.tomcat.embed:tomcat-embed-core:10.1.41 (transitive via org.springframework.boot:spring-boot-starter-web; compile scope; pom.xml:34); affected range >= 10.1.0-M1, < 10.1.45

Recommended fix:
- Upgrade org.apache.tomcat.embed:tomcat-embed-core to 10.1.45 or later.

Dependency presence is established; advisory-specific exploit preconditions require deployment review.

### CVE-2025-66614: Apache Tomcat - Client certificate verification bypass
- **Category:** CVE
- **Severity:** optional
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2025-66614](https://github.com/advisories/GHSA-fpj8-gq4v-p354): Apache Tomcat - Client certificate verification bypass

Severity: MEDIUM

Affected dependencies:
- org.apache.tomcat.embed:tomcat-embed-core:10.1.41 (transitive via org.springframework.boot:spring-boot-starter-web; compile scope; pom.xml:34); affected range >= 10.1.0-M1, < 10.1.50

Recommended fix:
- Upgrade org.apache.tomcat.embed:tomcat-embed-core to 10.1.50 or later.

Dependency presence is established; advisory-specific exploit preconditions require deployment review.

### CVE-2026-18401: jackson-core: Number Length Constraint Bypass in Async Parser Leads to Potential DoS Condition
- **Category:** CVE
- **Severity:** optional
- **Story Points:** 1
- **Files:** pom.xml:78

[CVE-2026-18401](https://github.com/advisories/GHSA-72hv-8253-57qq): jackson-core: Number Length Constraint Bypass in Async Parser Leads to Potential DoS Condition

Severity: MEDIUM

Affected dependencies:
- com.fasterxml.jackson.core:jackson-core:2.19.0 (transitive via org.springframework.boot:spring-boot-starter-json; compile scope; pom.xml:78); affected range >= 2.19.0, < 2.21.1

Recommended fix:
- Upgrade com.fasterxml.jackson.core:jackson-core to 2.21.1 or later.

Dependency presence is established; advisory-specific exploit preconditions require deployment review.

### CVE-2026-19032: jackson-databind: Path Deserialization Missing Scheme Allowlist for FileSystemProvider Resolution
- **Category:** CVE
- **Severity:** optional
- **Story Points:** 1
- **Files:** pom.xml:78

[CVE-2026-19032](https://github.com/advisories/GHSA-wjgm-6hv5-3cvf): jackson-databind: Path Deserialization Missing Scheme Allowlist for FileSystemProvider Resolution

Severity: MEDIUM

Affected dependencies:
- com.fasterxml.jackson.core:jackson-databind:2.19.0 (transitive via org.springframework.boot:spring-boot-starter-json; compile scope; pom.xml:78); affected range >= 2.19.0, < 2.21.6

Recommended fix:
- Upgrade com.fasterxml.jackson.core:jackson-databind to 2.21.6 or later.

Dependency presence is established; advisory-specific exploit preconditions require deployment review.

### CVE-2026-22732: Spring Security HTTP Headers Are not Written Under Some Conditions
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:65

[CVE-2026-22732](https://github.com/advisories/GHSA-mf92-479x-3373): Spring Security HTTP Headers Are not Written Under Some Conditions

Severity: CRITICAL

Affected dependencies:
- org.springframework.security:spring-security-web:6.5.0 (transitive via org.springframework.boot:spring-boot-starter-security; compile scope; pom.xml:65); affected range >= 6.5.0, < 6.5.9

Recommended fix:
- Upgrade org.springframework.security:spring-security-web to 6.5.9 or later.

Dependency presence is established; advisory-specific exploit preconditions require deployment review.

### CVE-2026-22737: Spring Framework Improper Path Limitation with Script View Templates
- **Category:** CVE
- **Severity:** optional
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2026-22737](https://github.com/advisories/GHSA-4773-3jfm-qmx3): Spring Framework Improper Path Limitation with Script View Templates

Severity: MEDIUM

Affected dependencies:
- org.springframework:spring-webmvc:6.2.7 (transitive via org.springframework.boot:spring-boot-starter-web; compile scope; pom.xml:34); affected range >= 6.2.0, < 6.2.17

Recommended fix:
- Upgrade org.springframework:spring-webmvc to 6.2.17 or later.

Dependency presence is established; advisory-specific exploit preconditions require deployment review.

### CVE-2026-22745: Spring MVC and WebFlux applications are vulnerable to Denial of Service attacks when resolving static resources
- **Category:** CVE
- **Severity:** optional
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2026-22745](https://github.com/advisories/GHSA-6p4f-wcwh-5vvm): Spring MVC and WebFlux applications are vulnerable to Denial of Service attacks when resolving static resources

Severity: MEDIUM

Affected dependencies:
- org.springframework:spring-webmvc:6.2.7 (transitive via org.springframework.boot:spring-boot-starter-web; compile scope; pom.xml:34); affected range >= 6.2.0, <= 6.2.17

Recommended fix:
- Upgrade org.springframework:spring-webmvc to 6.2.18 or later.

Dependency presence is established; advisory-specific exploit preconditions require deployment review.

### CVE-2026-22751: Spring Security Core has a TOCTOU race condition when One-Time Token login with JdbcOneTimeTokenService is configured
- **Category:** CVE
- **Severity:** optional
- **Story Points:** 1
- **Files:** pom.xml:65

[CVE-2026-22751](https://github.com/advisories/GHSA-x2wq-9x2f-fhj7): Spring Security Core has a TOCTOU race condition when One-Time Token login with JdbcOneTimeTokenService is configured

Severity: MEDIUM

Affected dependencies:
- org.springframework.security:spring-security-core:6.5.0 (transitive via org.springframework.boot:spring-boot-starter-security; compile scope; pom.xml:65); affected range >= 6.5.0, < 6.5.10

Recommended fix:
- Upgrade org.springframework.security:spring-security-core to 6.5.10 or later.

Dependency presence is established; advisory-specific exploit preconditions require deployment review.

### CVE-2026-24400: AssertJ has XML External Entity (XXE) vulnerability when parsing untrusted XML via isXmlEqualTo assertion
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:84

[CVE-2026-24400](https://github.com/advisories/GHSA-rqfh-9r24-8c9r): AssertJ has XML External Entity (XXE) vulnerability when parsing untrusted XML via isXmlEqualTo assertion

Severity: HIGH

Affected dependencies:
- org.assertj:assertj-core:3.27.3 (transitive via org.springframework.boot:spring-boot-starter-test; test scope; pom.xml:84); affected range >= 1.4.0, <= 3.27.6

Recommended fix:
- Upgrade org.assertj:assertj-core to 3.27.7 or later.

Dependency presence is established; advisory-specific exploit preconditions require deployment review.

### CVE-2026-24734: Apache Tomcat has an Improper Input Validation vulnerability
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2026-24734](https://github.com/advisories/GHSA-mgp5-rv84-w37q): Apache Tomcat has an Improper Input Validation vulnerability

Severity: HIGH

Affected dependencies:
- org.apache.tomcat.embed:tomcat-embed-core:10.1.41 (transitive via org.springframework.boot:spring-boot-starter-web; compile scope; pom.xml:34); affected range >= 10.1.0-M7, < 10.1.52

Recommended fix:
- Upgrade org.apache.tomcat.embed:tomcat-embed-core to 10.1.52 or later.

Dependency presence is established; advisory-specific exploit preconditions require deployment review.

### CVE-2026-24880: Apache Tomcat has an HTTP Request/Response Smuggling vulnerability
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2026-24880](https://github.com/advisories/GHSA-563x-q5rq-57qp): Apache Tomcat has an HTTP Request/Response Smuggling vulnerability

Severity: HIGH

Affected dependencies:
- org.apache.tomcat.embed:tomcat-embed-core:10.1.41 (transitive via org.springframework.boot:spring-boot-starter-web; compile scope; pom.xml:34); affected range >= 10.1.0-M1, < 10.1.52

Recommended fix:
- Upgrade org.apache.tomcat.embed:tomcat-embed-core to 10.1.52 or later.

Dependency presence is established; advisory-specific exploit preconditions require deployment review.

### CVE-2026-25854: Apache Tomcat has an Open Redirect vulnerability
- **Category:** CVE
- **Severity:** optional
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2026-25854](https://github.com/advisories/GHSA-9m3c-qcxr-9x87): Apache Tomcat has an Open Redirect vulnerability

Severity: MEDIUM

Affected dependencies:
- org.apache.tomcat.embed:tomcat-embed-core:10.1.41 (transitive via org.springframework.boot:spring-boot-starter-web; compile scope; pom.xml:34); affected range >= 10.1.0-M1, < 10.1.53

Recommended fix:
- Upgrade org.apache.tomcat.embed:tomcat-embed-core to 10.1.53 or later.

Dependency presence is established; advisory-specific exploit preconditions require deployment review.

### CVE-2026-34483: Apache Tomcat has an Improper Encoding or Escaping of Output vulnerability in the JsonAccessLogValve
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2026-34483](https://github.com/advisories/GHSA-rv64-5gf8-9qq8): Apache Tomcat has an Improper Encoding or Escaping of Output vulnerability in the JsonAccessLogValve

Severity: HIGH

Affected dependencies:
- org.apache.tomcat.embed:tomcat-embed-core:10.1.41 (transitive via org.springframework.boot:spring-boot-starter-web; compile scope; pom.xml:34); affected range >= 10.1.0-M1, < 10.1.54

Recommended fix:
- Upgrade org.apache.tomcat.embed:tomcat-embed-core to 10.1.54 or later.

Dependency presence is established; advisory-specific exploit preconditions require deployment review.

### CVE-2026-34487: Apache Tomcat vulnerable to Insertion of Sensitive Information into Log File
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2026-34487](https://github.com/advisories/GHSA-x4m4-345f-5h5g): Apache Tomcat vulnerable to Insertion of Sensitive Information into Log File

Severity: HIGH

Affected dependencies:
- org.apache.tomcat.embed:tomcat-embed-core:10.1.41 (transitive via org.springframework.boot:spring-boot-starter-web; compile scope; pom.xml:34); affected range >= 10.1.0-M1, < 10.1.54

Recommended fix:
- Upgrade org.apache.tomcat.embed:tomcat-embed-core to 10.1.54 or later.

Dependency presence is established; advisory-specific exploit preconditions require deployment review.

### CVE-2026-40477: Improper restriction of the scope of accessible objects in Thymeleaf expressions
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:40

[CVE-2026-40477](https://github.com/advisories/GHSA-r4v4-5mwr-2fwr): Improper restriction of the scope of accessible objects in Thymeleaf expressions

Severity: CRITICAL

Affected dependencies:
- org.thymeleaf:thymeleaf:3.1.3.RELEASE (transitive via org.springframework.boot:spring-boot-starter-thymeleaf; compile scope; pom.xml:40); affected range <= 3.1.3.RELEASE
- org.thymeleaf:thymeleaf-spring6:3.1.3.RELEASE (transitive via org.springframework.boot:spring-boot-starter-thymeleaf; compile scope; pom.xml:40); affected range <= 3.1.3.RELEASE

Recommended fix:
- Upgrade org.thymeleaf:thymeleaf to 3.1.4.RELEASE or later.
- Upgrade org.thymeleaf:thymeleaf-spring6 to 3.1.4.RELEASE or later.

Dependency presence is established; advisory-specific exploit preconditions require deployment review.

### CVE-2026-40478: Improper neutralization of specific syntax patterns for unauthorized expressions in Thymeleaf
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:40

[CVE-2026-40478](https://github.com/advisories/GHSA-xjw8-8c5c-9r79): Improper neutralization of specific syntax patterns for unauthorized expressions in Thymeleaf

Severity: CRITICAL

Affected dependencies:
- org.thymeleaf:thymeleaf:3.1.3.RELEASE (transitive via org.springframework.boot:spring-boot-starter-thymeleaf; compile scope; pom.xml:40); affected range <= 3.1.3.RELEASE
- org.thymeleaf:thymeleaf-spring6:3.1.3.RELEASE (transitive via org.springframework.boot:spring-boot-starter-thymeleaf; compile scope; pom.xml:40); affected range <= 3.1.3.RELEASE

Recommended fix:
- Upgrade org.thymeleaf:thymeleaf to 3.1.4.RELEASE or later.
- Upgrade org.thymeleaf:thymeleaf-spring6 to 3.1.4.RELEASE or later.

Dependency presence is established; advisory-specific exploit preconditions require deployment review.

### CVE-2026-40972: Spring Boot DevTools remote secret comparison is vulnerable to timing attacks
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:98

[CVE-2026-40972](https://github.com/advisories/GHSA-56v8-86gj-66jp): Spring Boot DevTools remote secret comparison is vulnerable to timing attacks

Severity: HIGH

Affected dependencies:
- org.springframework.boot:spring-boot-devtools:3.5.0 (direct; compile scope; pom.xml:98); affected range >= 3.5.0, < 3.5.14

Recommended fix:
- Upgrade org.springframework.boot:spring-boot-devtools to 3.5.14 or later.

Dependency presence is established; advisory-specific exploit preconditions require deployment review.

### CVE-2026-40973: Spring Boot accepts predictable temp directory without ownership verification
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:98

[CVE-2026-40973](https://github.com/advisories/GHSA-wwpq-f5c3-7hvx): Spring Boot accepts predictable temp directory without ownership verification

Severity: HIGH

Affected dependencies:
- org.springframework.boot:spring-boot:3.5.0 (transitive via org.springframework.boot:spring-boot-devtools; compile scope; pom.xml:98); affected range >= 3.5.0, < 3.5.14

Recommended fix:
- Upgrade org.springframework.boot:spring-boot to 3.5.14 or later.

Dependency presence is established; advisory-specific exploit preconditions require deployment review.

### CVE-2026-41001: Spring Boot: Predictable Temp Directory in Artemis Auto-configuration
- **Category:** CVE
- **Severity:** optional
- **Story Points:** 1
- **Files:** pom.xml:98

[CVE-2026-41001](https://github.com/advisories/GHSA-ggg2-9786-hwc8): Spring Boot: Predictable Temp Directory in Artemis Auto-configuration

Severity: MEDIUM

Affected dependencies:
- org.springframework.boot:spring-boot-autoconfigure:3.5.0 (transitive via org.springframework.boot:spring-boot-devtools; compile scope; pom.xml:98); affected range >= 3.5.0, <= 3.5.14

Recommended fix:
- Upgrade org.springframework.boot:spring-boot-autoconfigure to 3.5.15 or later.

Dependency presence is established; advisory-specific exploit preconditions require deployment review.

### CVE-2026-41284: Apache Tomcat: Unbounded read in WebDAV LOCK and  PROPFIND handling
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2026-41284](https://github.com/advisories/GHSA-gx5v-xp9w-j4cg): Apache Tomcat: Unbounded read in WebDAV LOCK and  PROPFIND handling

Severity: HIGH

Affected dependencies:
- org.apache.tomcat.embed:tomcat-embed-core:10.1.41 (transitive via org.springframework.boot:spring-boot-starter-web; compile scope; pom.xml:34); affected range >= 10.1.0-M1, < 10.1.55

Recommended fix:
- Upgrade org.apache.tomcat.embed:tomcat-embed-core to 10.1.55 or later.

Dependency presence is established; advisory-specific exploit preconditions require deployment review.

### CVE-2026-41293: Apache Tomcat - HTTP/2 request headers not validated
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2026-41293](https://github.com/advisories/GHSA-r29c-68gh-xp6x): Apache Tomcat - HTTP/2 request headers not validated

Severity: CRITICAL

Affected dependencies:
- org.apache.tomcat.embed:tomcat-embed-core:10.1.41 (transitive via org.springframework.boot:spring-boot-starter-web; compile scope; pom.xml:34); affected range >= 10.1.0-M1, < 10.1.55

Recommended fix:
- Upgrade org.apache.tomcat.embed:tomcat-embed-core to 10.1.55 or later.

Dependency presence is established; advisory-specific exploit preconditions require deployment review.

### CVE-2026-41695: Spring Data: Unbounded property-path cache keyed by externally-supplied path string
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:46

[CVE-2026-41695](https://github.com/advisories/GHSA-88fw-v6x4-3f58): Spring Data: Unbounded property-path cache keyed by externally-supplied path string

Severity: HIGH

Affected dependencies:
- org.springframework.data:spring-data-commons:3.5.0 (transitive via org.springframework.boot:spring-boot-starter-data-jpa; compile scope; pom.xml:46); affected range >= 3.5.0, <= 3.5.11

Recommended fix:
- Upgrade org.springframework.data:spring-data-commons to 3.5.12 or later.

Dependency presence is established; advisory-specific exploit preconditions require deployment review.

### CVE-2026-41706: Spring Security: Open Redirect via Unvalidated Post-Login Redirect URL Stored in CookieRequestCache
- **Category:** CVE
- **Severity:** optional
- **Story Points:** 1
- **Files:** pom.xml:65

[CVE-2026-41706](https://github.com/advisories/GHSA-x2r2-rvhq-2mqv): Spring Security: Open Redirect via Unvalidated Post-Login Redirect URL Stored in CookieRequestCache

Severity: MEDIUM

Affected dependencies:
- org.springframework.security:spring-security-web:6.5.0 (transitive via org.springframework.boot:spring-boot-starter-security; compile scope; pom.xml:65); affected range >= 6.5.0, <= 6.5.10

Recommended fix:
- Upgrade org.springframework.security:spring-security-web to 6.5.11 or later.

Dependency presence is established; advisory-specific exploit preconditions require deployment review.

### CVE-2026-41711: Spring Data Commons: StackOverflowException when parsing Sort parameters (DoS)
- **Category:** CVE
- **Severity:** optional
- **Story Points:** 1
- **Files:** pom.xml:46

[CVE-2026-41711](https://github.com/advisories/GHSA-5vpf-xvv7-c8vh): Spring Data Commons: StackOverflowException when parsing Sort parameters (DoS)

Severity: MEDIUM

Affected dependencies:
- org.springframework.data:spring-data-commons:3.5.0 (transitive via org.springframework.boot:spring-boot-starter-data-jpa; compile scope; pom.xml:46); affected range >= 3.5.0, <= 3.5.11

Recommended fix:
- Upgrade org.springframework.data:spring-data-commons to 3.5.12 or later.

Dependency presence is established; advisory-specific exploit preconditions require deployment review.

### CVE-2026-41716: Spring Data Commons: Heap exhaustion from unbounded property-lookup cache retaining crafted string keys
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:46

[CVE-2026-41716](https://github.com/advisories/GHSA-9fw2-h3hf-293r): Spring Data Commons: Heap exhaustion from unbounded property-lookup cache retaining crafted string keys

Severity: HIGH

Affected dependencies:
- org.springframework.data:spring-data-commons:3.5.0 (transitive via org.springframework.boot:spring-boot-starter-data-jpa; compile scope; pom.xml:46); affected range >= 3.5.0, <= 3.5.11

Recommended fix:
- Upgrade org.springframework.data:spring-data-commons to 3.5.12 or later.

Dependency presence is established; advisory-specific exploit preconditions require deployment review.

### CVE-2026-41721: Spring Data Commons: Denial of Service via excessive memory allocation in projection binding
- **Category:** CVE
- **Severity:** optional
- **Story Points:** 1
- **Files:** pom.xml:46

[CVE-2026-41721](https://github.com/advisories/GHSA-5m4m-73w9-8433): Spring Data Commons: Denial of Service via excessive memory allocation in projection binding

Severity: MEDIUM

Affected dependencies:
- org.springframework.data:spring-data-commons:3.5.0 (transitive via org.springframework.boot:spring-boot-starter-data-jpa; compile scope; pom.xml:46); affected range >= 3.5.0, <= 3.5.11

Recommended fix:
- Upgrade org.springframework.data:spring-data-commons to 3.5.12 or later.

Dependency presence is established; advisory-specific exploit preconditions require deployment review.

### CVE-2026-41841: Spring Framework Information Disclosure via Static Resource Cache in Spring MVC and WebFlux
- **Category:** CVE
- **Severity:** optional
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2026-41841](https://github.com/advisories/GHSA-mq64-j8f9-9gcj): Spring Framework Information Disclosure via Static Resource Cache in Spring MVC and WebFlux

Severity: MEDIUM

Affected dependencies:
- org.springframework:spring-webmvc:6.2.7 (transitive via org.springframework.boot:spring-boot-starter-web; compile scope; pom.xml:34); affected range >= 6.2.0, <= 6.2.18

Recommended fix:
- Upgrade org.springframework:spring-webmvc to 6.2.19 or later.

Dependency presence is established; advisory-specific exploit preconditions require deployment review.

### CVE-2026-41842: Spring Framework Denial of Service via Versioned Resources in Spring MVC and WebFlux
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2026-41842](https://github.com/advisories/GHSA-x23c-287f-qqv5): Spring Framework Denial of Service via Versioned Resources in Spring MVC and WebFlux

Severity: HIGH

Affected dependencies:
- org.springframework:spring-webmvc:6.2.7 (transitive via org.springframework.boot:spring-boot-starter-web; compile scope; pom.xml:34); affected range >= 6.2.0, <= 6.2.18

Recommended fix:
- Upgrade org.springframework:spring-webmvc to 6.2.19 or later.

Dependency presence is established; advisory-specific exploit preconditions require deployment review.

### CVE-2026-41843: Spring Framework Path Traversal via Versioned Static Resources in Spring MVC and WebFlux
- **Category:** CVE
- **Severity:** optional
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2026-41843](https://github.com/advisories/GHSA-72pg-x5f8-j25j): Spring Framework Path Traversal via Versioned Static Resources in Spring MVC and WebFlux

Severity: MEDIUM

Affected dependencies:
- org.springframework:spring-webmvc:6.2.7 (transitive via org.springframework.boot:spring-boot-starter-web; compile scope; pom.xml:34); affected range >= 6.2.0, <= 6.2.18

Recommended fix:
- Upgrade org.springframework:spring-webmvc to 6.2.19 or later.

Dependency presence is established; advisory-specific exploit preconditions require deployment review.

### CVE-2026-41844: Spring Framework Open Redirect in Spring MVC and WebFlux
- **Category:** CVE
- **Severity:** optional
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2026-41844](https://github.com/advisories/GHSA-h3qp-gqrc-q736): Spring Framework Open Redirect in Spring MVC and WebFlux

Severity: MEDIUM

Affected dependencies:
- org.springframework:spring-webmvc:6.2.7 (transitive via org.springframework.boot:spring-boot-starter-web; compile scope; pom.xml:34); affected range >= 6.2.0, <= 6.2.18

Recommended fix:
- Upgrade org.springframework:spring-webmvc to 6.2.19 or later.

Dependency presence is established; advisory-specific exploit preconditions require deployment review.

### CVE-2026-41845: Spring Framework Cross-site Scripting via JavaScriptUtils
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2026-41845](https://github.com/advisories/GHSA-3chg-m5w7-qfv5): Spring Framework Cross-site Scripting via JavaScriptUtils

Severity: HIGH

Affected dependencies:
- org.springframework:spring-webmvc:6.2.7 (transitive via org.springframework.boot:spring-boot-starter-web; compile scope; pom.xml:34); affected range >= 6.2.0, <= 6.2.18

Recommended fix:
- Upgrade org.springframework:spring-webmvc to 6.2.19 or later.

Dependency presence is established; advisory-specific exploit preconditions require deployment review.

### CVE-2026-41846: Spring Framework Cross-site Scripting via JSP Form Tags
- **Category:** CVE
- **Severity:** optional
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2026-41846](https://github.com/advisories/GHSA-957g-f97v-vppc): Spring Framework Cross-site Scripting via JSP Form Tags

Severity: MEDIUM

Affected dependencies:
- org.springframework:spring-webmvc:6.2.7 (transitive via org.springframework.boot:spring-boot-starter-web; compile scope; pom.xml:34); affected range >= 6.2.0, <= 6.2.18

Recommended fix:
- Upgrade org.springframework:spring-webmvc to 6.2.19 or later.

Dependency presence is established; advisory-specific exploit preconditions require deployment review.

### CVE-2026-41850: Spring Framework Algorithmic Denial of Service via SpEL Expressions
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2026-41850](https://github.com/advisories/GHSA-r5w3-xv2f-j59q): Spring Framework Algorithmic Denial of Service via SpEL Expressions

Severity: HIGH

Affected dependencies:
- org.springframework:spring-expression:6.2.7 (transitive via org.springframework.boot:spring-boot-starter-web; compile scope; pom.xml:34); affected range >= 6.2.0, <= 6.2.18

Recommended fix:
- Upgrade org.springframework:spring-expression to 6.2.19 or later.

Dependency presence is established; advisory-specific exploit preconditions require deployment review.

### CVE-2026-41851: Spring Framework Denial of Service via Unbounded Cache in SpEL
- **Category:** CVE
- **Severity:** optional
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2026-41851](https://github.com/advisories/GHSA-wxpp-56q6-5pcg): Spring Framework Denial of Service via Unbounded Cache in SpEL

Severity: MEDIUM

Affected dependencies:
- org.springframework:spring-expression:6.2.7 (transitive via org.springframework.boot:spring-boot-starter-web; compile scope; pom.xml:34); affected range >= 6.2.0, <= 6.2.18

Recommended fix:
- Upgrade org.springframework:spring-expression to 6.2.19 or later.

Dependency presence is established; advisory-specific exploit preconditions require deployment review.

### CVE-2026-41853: Spring Framework Multipart Request Smuggling in Spring MVC and WebFlux
- **Category:** CVE
- **Severity:** optional
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2026-41853](https://github.com/advisories/GHSA-cjpg-rgq5-fr37): Spring Framework Multipart Request Smuggling in Spring MVC and WebFlux

Severity: MEDIUM

Affected dependencies:
- org.springframework:spring-webmvc:6.2.7 (transitive via org.springframework.boot:spring-boot-starter-web; compile scope; pom.xml:34); affected range >= 6.2.0, <= 6.2.18

Recommended fix:
- Upgrade org.springframework:spring-webmvc to 6.2.19 or later.

Dependency presence is established; advisory-specific exploit preconditions require deployment review.

### CVE-2026-41854: Spring Framework Server-Side Request Forgery via UriComponentsBuilder
- **Category:** CVE
- **Severity:** optional
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2026-41854](https://github.com/advisories/GHSA-7m2p-62gw-p8qq): Spring Framework Server-Side Request Forgery via UriComponentsBuilder

Severity: MEDIUM

Affected dependencies:
- org.springframework:spring-web:6.2.7 (transitive via org.springframework.boot:spring-boot-starter-web; compile scope; pom.xml:34); affected range >= 6.2.0, <= 6.2.18

Recommended fix:
- Upgrade org.springframework:spring-web to 6.2.19 or later.

Dependency presence is established; advisory-specific exploit preconditions require deployment review.

### CVE-2026-41901: Sandboxed Thymeleaf expressions vulnerable to improper recognition of unauthorized syntax patterns
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:40

[CVE-2026-41901](https://github.com/advisories/GHSA-c9ph-gxww-7744): Sandboxed Thymeleaf expressions vulnerable to improper recognition of unauthorized syntax patterns

Severity: CRITICAL

Affected dependencies:
- org.thymeleaf:thymeleaf:3.1.3.RELEASE (transitive via org.springframework.boot:spring-boot-starter-thymeleaf; compile scope; pom.xml:40); affected range <= 3.1.4.RELEASE
- org.thymeleaf:thymeleaf-spring6:3.1.3.RELEASE (transitive via org.springframework.boot:spring-boot-starter-thymeleaf; compile scope; pom.xml:40); affected range <= 3.1.4.RELEASE

Recommended fix:
- Upgrade org.thymeleaf:thymeleaf to 3.1.5.RELEASE or later.
- Upgrade org.thymeleaf:thymeleaf-spring6 to 3.1.5.RELEASE or later.

Dependency presence is established; advisory-specific exploit preconditions require deployment review.

### CVE-2026-42498: Apache Tomcat - WebSocket authentication header exposure
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2026-42498](https://github.com/advisories/GHSA-fv25-8xcx-gqjc): Apache Tomcat - WebSocket authentication header exposure

Severity: HIGH

Affected dependencies:
- org.apache.tomcat.embed:tomcat-embed-core:10.1.41 (transitive via org.springframework.boot:spring-boot-starter-web; compile scope; pom.xml:34); affected range >= 10.1.0-M1, < 10.1.55

Recommended fix:
- Upgrade org.apache.tomcat.embed:tomcat-embed-core to 10.1.55 or later.

Dependency presence is established; advisory-specific exploit preconditions require deployment review.

### CVE-2026-43512: Apache Tomcat - Digest authenticator will authenticate any unknown user
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2026-43512](https://github.com/advisories/GHSA-h6fc-48rj-7qqh): Apache Tomcat - Digest authenticator will authenticate any unknown user

Severity: CRITICAL

Affected dependencies:
- org.apache.tomcat.embed:tomcat-embed-core:10.1.41 (transitive via org.springframework.boot:spring-boot-starter-web; compile scope; pom.xml:34); affected range >= 10.1.0-M1, < 10.1.55

Recommended fix:
- Upgrade org.apache.tomcat.embed:tomcat-embed-core to 10.1.55 or later.

Dependency presence is established; advisory-specific exploit preconditions require deployment review.

### CVE-2026-43513: Apache Tomcat: LockOutRealm treats user names as case-sensitive
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2026-43513](https://github.com/advisories/GHSA-5mp6-jrq3-r938): Apache Tomcat: LockOutRealm treats user names as case-sensitive

Severity: HIGH

Affected dependencies:
- org.apache.tomcat.embed:tomcat-embed-core:10.1.41 (transitive via org.springframework.boot:spring-boot-starter-web; compile scope; pom.xml:34); affected range >= 10.1.0-M1, < 10.1.55

Recommended fix:
- Upgrade org.apache.tomcat.embed:tomcat-embed-core to 10.1.55 or later.

Dependency presence is established; advisory-specific exploit preconditions require deployment review.

### CVE-2026-43515: Apache Tomcat - Security constraints not correctly applied
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2026-43515](https://github.com/advisories/GHSA-5m62-pw8w-7w9f): Apache Tomcat - Security constraints not correctly applied

Severity: CRITICAL

Affected dependencies:
- org.apache.tomcat.embed:tomcat-embed-core:10.1.41 (transitive via org.springframework.boot:spring-boot-starter-web; compile scope; pom.xml:34); affected range >= 10.1.0-M1, < 10.1.55

Recommended fix:
- Upgrade org.apache.tomcat.embed:tomcat-embed-core to 10.1.55 or later.

Dependency presence is established; advisory-specific exploit preconditions require deployment review.

### CVE-2026-47838: Spring Security Vulnerable to Unauthorized User Impersonation when Using X.509 Client Certificates
- **Category:** CVE
- **Severity:** optional
- **Story Points:** 1
- **Files:** pom.xml:65

[CVE-2026-47838](https://github.com/advisories/GHSA-293q-567p-wmwq): Spring Security Vulnerable to Unauthorized User Impersonation when Using X.509 Client Certificates

Severity: MEDIUM

Affected dependencies:
- org.springframework.security:spring-security-web:6.5.0 (transitive via org.springframework.boot:spring-boot-starter-security; compile scope; pom.xml:65); affected range >= 6.5.0, <= 6.5.10

Recommended fix:
- Upgrade org.springframework.security:spring-security-web to 6.5.11 or later.

Dependency presence is established; advisory-specific exploit preconditions require deployment review.

### CVE-2026-47884: Spring Framework Improper Path Limitation in XsltView
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2026-47884](https://github.com/advisories/GHSA-pc63-qcmh-9cmg): Spring Framework Improper Path Limitation in XsltView

Severity: CRITICAL

Affected dependencies:
- org.springframework:spring-webmvc:6.2.7 (transitive via org.springframework.boot:spring-boot-starter-web; compile scope; pom.xml:34); affected range >= 6.2.0, <= 6.2.19

Recommended fix:
- Upgrade org.springframework:spring-webmvc to a vendor-supported fixed version (no patched version listed) or later.

Dependency presence is established; advisory-specific exploit preconditions require deployment review.

### CVE-2026-47890: Spring Framework Server Sent Event stream corruption while rendering fragments
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2026-47890](https://github.com/advisories/GHSA-j9f9-w8pj-32f8): Spring Framework Server Sent Event stream corruption while rendering fragments

Severity: CRITICAL

Affected dependencies:
- org.springframework:spring-webmvc:6.2.7 (transitive via org.springframework.boot:spring-boot-starter-web; compile scope; pom.xml:34); affected range >= 6.2.0, <= 6.2.19

Recommended fix:
- Upgrade org.springframework:spring-webmvc to a vendor-supported fixed version (no patched version listed) or later.

Dependency presence is established; advisory-specific exploit preconditions require deployment review.

### CVE-2026-49844: Apache Log4j API: Improper encoding of non-finite floating-point values during MapMessage JSON serialization
- **Category:** CVE
- **Severity:** optional
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2026-49844](https://github.com/advisories/GHSA-qv9r-c865-cp47): Apache Log4j API: Improper encoding of non-finite floating-point values during MapMessage JSON serialization

Severity: MEDIUM

Affected dependencies:
- org.apache.logging.log4j:log4j-api:2.24.3 (transitive via org.springframework.boot:spring-boot-starter-web; compile scope; pom.xml:34); affected range >= 2.13.1, < 2.25.5

Recommended fix:
- Upgrade org.apache.logging.log4j:log4j-api to 2.25.5 or later.

Dependency presence is established; advisory-specific exploit preconditions require deployment review.

### CVE-2026-54512: jackson-databind has a PolymorphicTypeValidator bypass via generic type parameters that allows arbitrary class instantiation
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:78

[CVE-2026-54512](https://github.com/advisories/GHSA-j3rv-43j4-c7qm): jackson-databind has a PolymorphicTypeValidator bypass via generic type parameters that allows arbitrary class instantiation

Severity: HIGH

Affected dependencies:
- com.fasterxml.jackson.core:jackson-databind:2.19.0 (transitive via org.springframework.boot:spring-boot-starter-json; compile scope; pom.xml:78); affected range >= 2.19.0, <= 2.21.3

Recommended fix:
- Upgrade com.fasterxml.jackson.core:jackson-databind to 2.21.4 or later.

Dependency presence is established; advisory-specific exploit preconditions require deployment review.

### CVE-2026-54513: jackson-databind has an array subtype allowlist bypass in BasicPolymorphicTypeValidator (allowIfSubTypeIsArray)
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:78

[CVE-2026-54513](https://github.com/advisories/GHSA-rmj7-2vxq-3g9f): jackson-databind has an array subtype allowlist bypass in BasicPolymorphicTypeValidator (allowIfSubTypeIsArray)

Severity: HIGH

Affected dependencies:
- com.fasterxml.jackson.core:jackson-databind:2.19.0 (transitive via org.springframework.boot:spring-boot-starter-json; compile scope; pom.xml:78); affected range >= 2.19.0, < 2.21.4

Recommended fix:
- Upgrade com.fasterxml.jackson.core:jackson-databind to 2.21.4 or later.

Dependency presence is established; advisory-specific exploit preconditions require deployment review.

### CVE-2026-54514: jackson-databind: InetSocketAddress deserialization triggers eager DNS resolution (SSRF)
- **Category:** CVE
- **Severity:** optional
- **Story Points:** 1
- **Files:** pom.xml:78

[CVE-2026-54514](https://github.com/advisories/GHSA-hgj6-7826-r7m5): jackson-databind: InetSocketAddress deserialization triggers eager DNS resolution (SSRF)

Severity: MEDIUM

Affected dependencies:
- com.fasterxml.jackson.core:jackson-databind:2.19.0 (transitive via org.springframework.boot:spring-boot-starter-json; compile scope; pom.xml:78); affected range >= 2.19.0, < 2.21.4

Recommended fix:
- Upgrade com.fasterxml.jackson.core:jackson-databind to 2.21.4 or later.

Dependency presence is established; advisory-specific exploit preconditions require deployment review.

### CVE-2026-54515: jackson-databind has case-insensitive deserialization bypasses per-property @JsonIgnoreProperties
- **Category:** CVE
- **Severity:** optional
- **Story Points:** 1
- **Files:** pom.xml:78

[CVE-2026-54515](https://github.com/advisories/GHSA-5jmj-h7xm-6q6v): jackson-databind has case-insensitive deserialization bypasses per-property @JsonIgnoreProperties

Severity: MEDIUM

Affected dependencies:
- com.fasterxml.jackson.core:jackson-databind:2.19.0 (transitive via org.springframework.boot:spring-boot-starter-json; compile scope; pom.xml:78); affected range >= 2.19.0, < 2.21.5

Recommended fix:
- Upgrade com.fasterxml.jackson.core:jackson-databind to 2.21.5 or later.

Dependency presence is established; advisory-specific exploit preconditions require deployment review.

### CVE-2026-59888: jackson-databind: @JsonIgnore on a Record property is bypassed with a PropertyNamingStrategy
- **Category:** CVE
- **Severity:** optional
- **Story Points:** 1
- **Files:** pom.xml:78

[CVE-2026-59888](https://github.com/advisories/GHSA-3pjw-73gf-8qr5): jackson-databind: @JsonIgnore on a Record property is bypassed with a PropertyNamingStrategy

Severity: MEDIUM

Affected dependencies:
- com.fasterxml.jackson.core:jackson-databind:2.19.0 (transitive via org.springframework.boot:spring-boot-starter-json; compile scope; pom.xml:78); affected range >= 2.19.0, < 2.21.4

Recommended fix:
- Upgrade com.fasterxml.jackson.core:jackson-databind to 2.21.4 or later.

Dependency presence is established; advisory-specific exploit preconditions require deployment review.

### CVE-2026-59889: jackson-databind: @JsonView bypassed for @JsonUnwrapped container properties on deserialization
- **Category:** CVE
- **Severity:** optional
- **Story Points:** 1
- **Files:** pom.xml:78

[CVE-2026-59889](https://github.com/advisories/GHSA-5gvw-p9qm-jgwh): jackson-databind: @JsonView bypassed for @JsonUnwrapped container properties on deserialization

Severity: MEDIUM

Affected dependencies:
- com.fasterxml.jackson.core:jackson-databind:2.19.0 (transitive via org.springframework.boot:spring-boot-starter-json; compile scope; pom.xml:78); affected range >= 2.19.0, < 2.21.5

Recommended fix:
- Upgrade com.fasterxml.jackson.core:jackson-databind to 2.21.5 or later.

Dependency presence is established; advisory-specific exploit preconditions require deployment review.

### CVE-2026-65182: Apache Tomcat has an Improper Access Control, Incorrect Authorization vulnerability
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2026-65182](https://github.com/advisories/GHSA-gcx9-497g-6cp6): Apache Tomcat has an Improper Access Control, Incorrect Authorization vulnerability

Severity: CRITICAL

Affected dependencies:
- org.apache.tomcat.embed:tomcat-embed-core:10.1.41 (transitive via org.springframework.boot:spring-boot-starter-web; compile scope; pom.xml:34); affected range >= 10.1.0-M1, < 10.1.58

Recommended fix:
- Upgrade org.apache.tomcat.embed:tomcat-embed-core to 10.1.58 or later.

Dependency presence is established; advisory-specific exploit preconditions require deployment review.

### CVE-2026-65905: Apache Tomcat's DIGEST authenticator has an Authentication Bypass by Capture-replay vulnerability
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2026-65905](https://github.com/advisories/GHSA-9xv2-5v5q-p794): Apache Tomcat's DIGEST authenticator has an Authentication Bypass by Capture-replay vulnerability

Severity: CRITICAL

Affected dependencies:
- org.apache.tomcat.embed:tomcat-embed-core:10.1.41 (transitive via org.springframework.boot:spring-boot-starter-web; compile scope; pom.xml:34); affected range >= 10.1.0-M1, < 10.1.58

Recommended fix:
- Upgrade org.apache.tomcat.embed:tomcat-embed-core to 10.1.58 or later.

Dependency presence is established; advisory-specific exploit preconditions require deployment review.

### CVE-2026-68494: jackson-core: Async parser maxNumberLength bypass via chunked digit accumulation (incomplete fix for GHSA-72hv-8253-57qq)
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:78

[CVE-2026-68494](https://github.com/advisories/GHSA-r7wm-3cxj-wff9): jackson-core: Async parser maxNumberLength bypass via chunked digit accumulation (incomplete fix for GHSA-72hv-8253-57qq)

Severity: HIGH

Affected dependencies:
- com.fasterxml.jackson.core:jackson-core:2.19.0 (transitive via org.springframework.boot:spring-boot-starter-json; compile scope; pom.xml:78); affected range >= 2.19.0, < 2.21.4

Recommended fix:
- Upgrade com.fasterxml.jackson.core:jackson-core to 2.21.4 or later.

Dependency presence is established; advisory-specific exploit preconditions require deployment review.

### CVE-2026-68497: jackson-databind: Duration XMLGregorianCalendar Unbounded Number Parse DoS
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:78

[CVE-2026-68497](https://github.com/advisories/GHSA-q4xh-88c3-wmh7): jackson-databind: Duration XMLGregorianCalendar Unbounded Number Parse DoS

Severity: HIGH

Affected dependencies:
- com.fasterxml.jackson.core:jackson-databind:2.19.0 (transitive via org.springframework.boot:spring-boot-starter-json; compile scope; pom.xml:78); affected range >= 2.19.0, < 2.21.6

Recommended fix:
- Upgrade com.fasterxml.jackson.core:jackson-databind to 2.21.6 or later.

Dependency presence is established; advisory-specific exploit preconditions require deployment review.

### CVE-2026-68525: Apache Tomcat's FORM authentication process has an Incorrect Authorization vulnerability
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2026-68525](https://github.com/advisories/GHSA-h3x4-894j-xpx5): Apache Tomcat's FORM authentication process has an Incorrect Authorization vulnerability

Severity: CRITICAL

Affected dependencies:
- org.apache.tomcat.embed:tomcat-embed-core:10.1.41 (transitive via org.springframework.boot:spring-boot-starter-web; compile scope; pom.xml:34); affected range >= 10.1.0-M1, < 10.1.58

Recommended fix:
- Upgrade org.apache.tomcat.embed:tomcat-embed-core to 10.1.58 or later.

Dependency presence is established; advisory-specific exploit preconditions require deployment review.

### CVE-2026-77310: jackson-databind: Incomplete fix for CVE-2026-54514: eager DNS resolution (SSRF) still present in InetAddress deserialization
- **Category:** CVE
- **Severity:** optional
- **Story Points:** 1
- **Files:** pom.xml:78

[CVE-2026-77310](https://github.com/advisories/GHSA-vvgp-rfg2-7rr6): jackson-databind: Incomplete fix for CVE-2026-54514: eager DNS resolution (SSRF) still present in InetAddress deserialization

Severity: MEDIUM

Affected dependencies:
- com.fasterxml.jackson.core:jackson-databind:2.19.0 (transitive via org.springframework.boot:spring-boot-starter-json; compile scope; pom.xml:78); affected range >= 2.19.0, < 2.21.5

Recommended fix:
- Upgrade com.fasterxml.jackson.core:jackson-databind to 2.21.5 or later.

Dependency presence is established; advisory-specific exploit preconditions require deployment review.

### CVE-2026-83557: jackson-databind: Comparable missing from DefaultBaseTypeLimitingValidator's unsafe base types (incomplete PolymorphicTypeValidator denylist)
- **Category:** CVE
- **Severity:** optional
- **Story Points:** 1
- **Files:** pom.xml:78

[CVE-2026-83557](https://github.com/advisories/GHSA-gx83-3vf8-gh7j): jackson-databind: Comparable missing from DefaultBaseTypeLimitingValidator's unsafe base types (incomplete PolymorphicTypeValidator denylist)

Severity: MEDIUM

Affected dependencies:
- com.fasterxml.jackson.core:jackson-databind:2.19.0 (transitive via org.springframework.boot:spring-boot-starter-json; compile scope; pom.xml:78); affected range >= 2.19.0, < 2.21.6

Recommended fix:
- Upgrade com.fasterxml.jackson.core:jackson-databind to 2.21.6 or later.

Dependency presence is established; advisory-specific exploit preconditions require deployment review.

### CVE-2026-89407:  jackson-core: ReDoS: quadratic backtracking in NumberInput.PATTERN_FLOAT via looksLikeValidNumber()
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:78

[CVE-2026-89407](https://github.com/advisories/GHSA-p6pp-m3f8-5c89):  jackson-core: ReDoS: quadratic backtracking in NumberInput.PATTERN_FLOAT via looksLikeValidNumber()

Severity: HIGH

Affected dependencies:
- com.fasterxml.jackson.core:jackson-core:2.19.0 (transitive via org.springframework.boot:spring-boot-starter-json; compile scope; pom.xml:78); affected range >= 2.19.0, <= 2.21.6

Recommended fix:
- Upgrade com.fasterxml.jackson.core:jackson-core to 2.21.7 or later.

Dependency presence is established; advisory-specific exploit preconditions require deployment review.

### CVE-2026-89425: jackson-core: UTF8DataInputJsonParser._reportInvalidToken() missing maxErrorTokenLength limit -> unbounded StringBuilder growth (DoS)
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:78

[CVE-2026-89425](https://github.com/advisories/GHSA-7hhh-6rmp-j9qf): jackson-core: UTF8DataInputJsonParser._reportInvalidToken() missing maxErrorTokenLength limit -> unbounded StringBuilder growth (DoS)

Severity: HIGH

Affected dependencies:
- com.fasterxml.jackson.core:jackson-core:2.19.0 (transitive via org.springframework.boot:spring-boot-starter-json; compile scope; pom.xml:78); affected range >= 2.19.0, <= 2.21.6

Recommended fix:
- Upgrade com.fasterxml.jackson.core:jackson-core to 2.21.7 or later.

Dependency presence is established; advisory-specific exploit preconditions require deployment review.

### CVE-2026-91776: jackson-databind retains every unknown raw type ID 
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:78

[CVE-2026-91776](https://github.com/advisories/GHSA-wv8q-qhhj-9h54): jackson-databind retains every unknown raw type ID 

Severity: HIGH

Affected dependencies:
- com.fasterxml.jackson.core:jackson-databind:2.19.0 (transitive via org.springframework.boot:spring-boot-starter-json; compile scope; pom.xml:78); affected range >= 2.19.0, <= 2.21.6

Recommended fix:
- Upgrade com.fasterxml.jackson.core:jackson-databind to 2.21.7 or later.

Dependency presence is established; advisory-specific exploit preconditions require deployment review.

### CVE-2026-91777: jackson-databind quadratic forward-reference completion 
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:78

[CVE-2026-91777](https://github.com/advisories/GHSA-cxp5-3px4-pw24): jackson-databind quadratic forward-reference completion 

Severity: HIGH

Affected dependencies:
- com.fasterxml.jackson.core:jackson-databind:2.19.0 (transitive via org.springframework.boot:spring-boot-starter-json; compile scope; pom.xml:78); affected range >= 2.19.0, <= 2.21.6

Recommended fix:
- Upgrade com.fasterxml.jackson.core:jackson-databind to 2.21.7 or later.

Dependency presence is established; advisory-specific exploit preconditions require deployment review.

## CWE Findings (Code-Level Vulnerabilities)

### CWE-79: Improper Neutralization of Input During Web Page Generation ('Cross-site Scripting')
- **Category:** Injection Attacks
- **Severity:** optional
- **Story Points:** 8
- **Files:** src/main/resources/static/js/upload.js:73, src/main/resources/static/js/upload.js:215, src/main/resources/static/js/upload.js:185, src/main/java/com/photoalbum/controller/HomeController.java:78

DOM XSS: handleFiles() includes attacker-controlled file.name in validation errors (upload.js:73-75); showErrors() interpolates errors into innerHTML (215-218) without escaping. A user selecting/dropping a maliciously named file can execute attacker-controlled HTML event handlers in the gallery origin, even when the upload is rejected. Also HomeController.uploadPhotos() returns originalFileName unchanged (78), which createPhotoCard() interpolates into alt/text HTML (185-189) inserted by displayNewPhotos() at 157. Requires victim interaction with an attacker-supplied filename; not an anonymous stored gallery-view XSS. Thymeleaf server-rendered filenames are escaped.
