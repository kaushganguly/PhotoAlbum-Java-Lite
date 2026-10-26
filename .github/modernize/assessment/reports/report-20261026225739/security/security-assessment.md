# Security Assessment Report

**Minimum CVE severity:** medium

## Summary

| Metric | Count |
|---|---|
| Total findings | 78 |
| CVE/GHSA advisories | 74 |
| CWE findings | 4 |
| CWE rules assessed | 59 |
| CWE rules without detected findings | 55 |

### By severity

| Severity | Count |
|---|---|
| mandatory | 43 |
| optional | 33 |
| potential | 2 |

## Scope and limitations

- Supplemental dependency analysis resolved 104 Maven coordinates across compile, runtime, and test scopes; the core scanner metadata retains its original direct-dependency setting.
- 85 unique advisory IDs matched resolved versions; 11 low-severity advisories are excluded from this merged report. Multi-component matches are grouped by advisory ID.
- All six CWE categories were assessed sequentially, covering 59 rules. NOT_FOUND means no qualifying finding in this static review, not proof of absence.
- No exploit execution, penetration testing, or production-environment validation was performed. No application fixes were made.
- Static dependency inventory includes all resolved scopes, not Maven build plugins, operating-system packages, or deployed environment drift. Advisory applicability is dependency-version matching, not proof of runtime exploitability.
- Raw category results, advisory findings, coverage metadata, and the resolved dependency inventory accompany this report. Credentials are redacted.

## CVE findings (dependency vulnerabilities)

### CVE-2026-47890: Spring Framework Server Sent Event stream corruption while rendering fragments
- **Category:** CVE
- **Severity:** mandatory
- **Story points:** 1
- **Files:** pom.xml:34

[CVE-2026-47890](https://github.com/advisories/GHSA-j9f9-w8pj-32f8)

Severity: CRITICAL

Affected dependencies (each range independently reconciled against the resolved version):
- org.springframework:spring-webmvc:6.2.7 (compile; transitive via spring-boot-starter-web; pom.xml:34); confirmed affected range: >= 6.2.0, <= 6.2.19. Recommended fix: No first patched version listed for this affected branch; consult advisory and move to a supported unaffected branch.

Dependency presence is confirmed; exploitability depends on advisory-specific runtime configuration. Test-only dependencies are explicitly labeled. Assessment covers all resolved Maven scopes; not build-plugin or OS dependencies.

### CVE-2026-47884: Spring Framework Improper Path Limitation in XsltView
- **Category:** CVE
- **Severity:** mandatory
- **Story points:** 1
- **Files:** pom.xml:34

[CVE-2026-47884](https://github.com/advisories/GHSA-pc63-qcmh-9cmg)

Severity: CRITICAL

Affected dependencies (each range independently reconciled against the resolved version):
- org.springframework:spring-webmvc:6.2.7 (compile; transitive via spring-boot-starter-web; pom.xml:34); confirmed affected range: >= 6.2.0, <= 6.2.19. Recommended fix: No first patched version listed for this affected branch; consult advisory and move to a supported unaffected branch.

Dependency presence is confirmed; exploitability depends on advisory-specific runtime configuration. Test-only dependencies are explicitly labeled. Assessment covers all resolved Maven scopes; not build-plugin or OS dependencies.

### CVE-2026-65905: Apache Tomcat's DIGEST authenticator has an Authentication Bypass by Capture-replay vulnerability
- **Category:** CVE
- **Severity:** mandatory
- **Story points:** 1
- **Files:** pom.xml:34

[CVE-2026-65905](https://github.com/advisories/GHSA-9xv2-5v5q-p794)

Severity: CRITICAL

Affected dependencies (each range independently reconciled against the resolved version):
- org.apache.tomcat.embed:tomcat-embed-core:10.1.41 (compile; transitive via spring-boot-starter-web; pom.xml:34); confirmed affected range: >= 10.1.0-M1, < 10.1.58. Recommended fix: upgrade to 10.1.58 or a later supported patched release.

Dependency presence is confirmed; exploitability depends on advisory-specific runtime configuration. Test-only dependencies are explicitly labeled. Assessment covers all resolved Maven scopes; not build-plugin or OS dependencies.

### CVE-2026-65182: Apache Tomcat has an Improper Access Control, Incorrect Authorization vulnerability
- **Category:** CVE
- **Severity:** mandatory
- **Story points:** 1
- **Files:** pom.xml:34

[CVE-2026-65182](https://github.com/advisories/GHSA-gcx9-497g-6cp6)

Severity: CRITICAL

Affected dependencies (each range independently reconciled against the resolved version):
- org.apache.tomcat.embed:tomcat-embed-core:10.1.41 (compile; transitive via spring-boot-starter-web; pom.xml:34); confirmed affected range: >= 10.1.0-M1, < 10.1.58. Recommended fix: upgrade to 10.1.58 or a later supported patched release.

Dependency presence is confirmed; exploitability depends on advisory-specific runtime configuration. Test-only dependencies are explicitly labeled. Assessment covers all resolved Maven scopes; not build-plugin or OS dependencies.

### CVE-2026-68525: Apache Tomcat's FORM authentication process has an Incorrect Authorization vulnerability
- **Category:** CVE
- **Severity:** mandatory
- **Story points:** 1
- **Files:** pom.xml:34

[CVE-2026-68525](https://github.com/advisories/GHSA-h3x4-894j-xpx5)

Severity: CRITICAL

Affected dependencies (each range independently reconciled against the resolved version):
- org.apache.tomcat.embed:tomcat-embed-core:10.1.41 (compile; transitive via spring-boot-starter-web; pom.xml:34); confirmed affected range: >= 10.1.0-M1, < 10.1.58. Recommended fix: upgrade to 10.1.58 or a later supported patched release.

Dependency presence is confirmed; exploitability depends on advisory-specific runtime configuration. Test-only dependencies are explicitly labeled. Assessment covers all resolved Maven scopes; not build-plugin or OS dependencies.

### CVE-2026-49844: Apache Log4j API: Improper encoding of non-finite floating-point values during MapMessage JSON serialization
- **Category:** CVE
- **Severity:** optional
- **Story points:** 1
- **Files:** pom.xml:34

[CVE-2026-49844](https://github.com/advisories/GHSA-qv9r-c865-cp47)

Severity: MEDIUM

Affected dependencies (each range independently reconciled against the resolved version):
- org.apache.logging.log4j:log4j-api:2.24.3 (compile; transitive via spring-boot-starter-web; pom.xml:34); confirmed affected range: >= 2.13.1, < 2.25.5. Recommended fix: upgrade to 2.25.5 or a later supported patched release.

Dependency presence is confirmed; exploitability depends on advisory-specific runtime configuration. Test-only dependencies are explicitly labeled. Assessment covers all resolved Maven scopes; not build-plugin or OS dependencies.

### CVE-2026-41854: Spring Framework Server-Side Request Forgery via UriComponentsBuilder
- **Category:** CVE
- **Severity:** optional
- **Story points:** 1
- **Files:** pom.xml:34

[CVE-2026-41854](https://github.com/advisories/GHSA-7m2p-62gw-p8qq)

Severity: MEDIUM

Affected dependencies (each range independently reconciled against the resolved version):
- org.springframework:spring-web:6.2.7 (compile; transitive via spring-boot-starter-web; pom.xml:34); confirmed affected range: >= 6.2.0, <= 6.2.18. Recommended fix: upgrade to 6.2.19 or a later supported patched release.

Dependency presence is confirmed; exploitability depends on advisory-specific runtime configuration. Test-only dependencies are explicitly labeled. Assessment covers all resolved Maven scopes; not build-plugin or OS dependencies.

### CVE-2026-41853: Spring Framework Multipart Request Smuggling in Spring MVC and WebFlux
- **Category:** CVE
- **Severity:** optional
- **Story points:** 1
- **Files:** pom.xml:34

[CVE-2026-41853](https://github.com/advisories/GHSA-cjpg-rgq5-fr37)

Severity: MEDIUM

Affected dependencies (each range independently reconciled against the resolved version):
- org.springframework:spring-webmvc:6.2.7 (compile; transitive via spring-boot-starter-web; pom.xml:34); confirmed affected range: >= 6.2.0, <= 6.2.18. Recommended fix: upgrade to 6.2.19 or a later supported patched release.

Dependency presence is confirmed; exploitability depends on advisory-specific runtime configuration. Test-only dependencies are explicitly labeled. Assessment covers all resolved Maven scopes; not build-plugin or OS dependencies.

### CVE-2026-41851: Spring Framework Denial of Service via Unbounded Cache in SpEL
- **Category:** CVE
- **Severity:** optional
- **Story points:** 1
- **Files:** pom.xml:34

[CVE-2026-41851](https://github.com/advisories/GHSA-wxpp-56q6-5pcg)

Severity: MEDIUM

Affected dependencies (each range independently reconciled against the resolved version):
- org.springframework:spring-expression:6.2.7 (compile; transitive via spring-boot-starter-web; pom.xml:34); confirmed affected range: >= 6.2.0, <= 6.2.18. Recommended fix: upgrade to 6.2.19 or a later supported patched release.

Dependency presence is confirmed; exploitability depends on advisory-specific runtime configuration. Test-only dependencies are explicitly labeled. Assessment covers all resolved Maven scopes; not build-plugin or OS dependencies.

### CVE-2026-41850: Spring Framework Algorithmic Denial of Service via SpEL Expressions
- **Category:** CVE
- **Severity:** mandatory
- **Story points:** 1
- **Files:** pom.xml:34

[CVE-2026-41850](https://github.com/advisories/GHSA-r5w3-xv2f-j59q)

Severity: HIGH

Affected dependencies (each range independently reconciled against the resolved version):
- org.springframework:spring-expression:6.2.7 (compile; transitive via spring-boot-starter-web; pom.xml:34); confirmed affected range: >= 6.2.0, <= 6.2.18. Recommended fix: upgrade to 6.2.19 or a later supported patched release.

Dependency presence is confirmed; exploitability depends on advisory-specific runtime configuration. Test-only dependencies are explicitly labeled. Assessment covers all resolved Maven scopes; not build-plugin or OS dependencies.

### CVE-2026-41846: Spring Framework Cross-site Scripting via JSP Form Tags
- **Category:** CVE
- **Severity:** optional
- **Story points:** 1
- **Files:** pom.xml:34

[CVE-2026-41846](https://github.com/advisories/GHSA-957g-f97v-vppc)

Severity: MEDIUM

Affected dependencies (each range independently reconciled against the resolved version):
- org.springframework:spring-webmvc:6.2.7 (compile; transitive via spring-boot-starter-web; pom.xml:34); confirmed affected range: >= 6.2.0, <= 6.2.18. Recommended fix: upgrade to 6.2.19 or a later supported patched release.

Dependency presence is confirmed; exploitability depends on advisory-specific runtime configuration. Test-only dependencies are explicitly labeled. Assessment covers all resolved Maven scopes; not build-plugin or OS dependencies.

### CVE-2026-41843: Spring Framework Path Traversal via Versioned Static Resources in Spring MVC and WebFlux
- **Category:** CVE
- **Severity:** optional
- **Story points:** 1
- **Files:** pom.xml:34

[CVE-2026-41843](https://github.com/advisories/GHSA-72pg-x5f8-j25j)

Severity: MEDIUM

Affected dependencies (each range independently reconciled against the resolved version):
- org.springframework:spring-webmvc:6.2.7 (compile; transitive via spring-boot-starter-web; pom.xml:34); confirmed affected range: >= 6.2.0, <= 6.2.18. Recommended fix: upgrade to 6.2.19 or a later supported patched release.

Dependency presence is confirmed; exploitability depends on advisory-specific runtime configuration. Test-only dependencies are explicitly labeled. Assessment covers all resolved Maven scopes; not build-plugin or OS dependencies.

### CVE-2026-41844: Spring Framework Open Redirect in Spring MVC and WebFlux
- **Category:** CVE
- **Severity:** optional
- **Story points:** 1
- **Files:** pom.xml:34

[CVE-2026-41844](https://github.com/advisories/GHSA-h3qp-gqrc-q736)

Severity: MEDIUM

Affected dependencies (each range independently reconciled against the resolved version):
- org.springframework:spring-webmvc:6.2.7 (compile; transitive via spring-boot-starter-web; pom.xml:34); confirmed affected range: >= 6.2.0, <= 6.2.18. Recommended fix: upgrade to 6.2.19 or a later supported patched release.

Dependency presence is confirmed; exploitability depends on advisory-specific runtime configuration. Test-only dependencies are explicitly labeled. Assessment covers all resolved Maven scopes; not build-plugin or OS dependencies.

### CVE-2026-41845: Spring Framework Cross-site Scripting via JavaScriptUtils
- **Category:** CVE
- **Severity:** mandatory
- **Story points:** 1
- **Files:** pom.xml:34

[CVE-2026-41845](https://github.com/advisories/GHSA-3chg-m5w7-qfv5)

Severity: HIGH

Affected dependencies (each range independently reconciled against the resolved version):
- org.springframework:spring-webmvc:6.2.7 (compile; transitive via spring-boot-starter-web; pom.xml:34); confirmed affected range: >= 6.2.0, <= 6.2.18. Recommended fix: upgrade to 6.2.19 or a later supported patched release.

Dependency presence is confirmed; exploitability depends on advisory-specific runtime configuration. Test-only dependencies are explicitly labeled. Assessment covers all resolved Maven scopes; not build-plugin or OS dependencies.

### CVE-2026-41841: Spring Framework Information Disclosure via Static Resource Cache in Spring MVC and WebFlux
- **Category:** CVE
- **Severity:** optional
- **Story points:** 1
- **Files:** pom.xml:34

[CVE-2026-41841](https://github.com/advisories/GHSA-mq64-j8f9-9gcj)

Severity: MEDIUM

Affected dependencies (each range independently reconciled against the resolved version):
- org.springframework:spring-webmvc:6.2.7 (compile; transitive via spring-boot-starter-web; pom.xml:34); confirmed affected range: >= 6.2.0, <= 6.2.18. Recommended fix: upgrade to 6.2.19 or a later supported patched release.

Dependency presence is confirmed; exploitability depends on advisory-specific runtime configuration. Test-only dependencies are explicitly labeled. Assessment covers all resolved Maven scopes; not build-plugin or OS dependencies.

### CVE-2026-41842: Spring Framework Denial of Service via Versioned Resources in Spring MVC and WebFlux
- **Category:** CVE
- **Severity:** mandatory
- **Story points:** 1
- **Files:** pom.xml:34

[CVE-2026-41842](https://github.com/advisories/GHSA-x23c-287f-qqv5)

Severity: HIGH

Affected dependencies (each range independently reconciled against the resolved version):
- org.springframework:spring-webmvc:6.2.7 (compile; transitive via spring-boot-starter-web; pom.xml:34); confirmed affected range: >= 6.2.0, <= 6.2.18. Recommended fix: upgrade to 6.2.19 or a later supported patched release.

Dependency presence is confirmed; exploitability depends on advisory-specific runtime configuration. Test-only dependencies are explicitly labeled. Assessment covers all resolved Maven scopes; not build-plugin or OS dependencies.

### CVE-2026-41284: Apache Tomcat: Unbounded read in WebDAV LOCK and  PROPFIND handling
- **Category:** CVE
- **Severity:** mandatory
- **Story points:** 1
- **Files:** pom.xml:34

[CVE-2026-41284](https://github.com/advisories/GHSA-gx5v-xp9w-j4cg)

Severity: HIGH

Affected dependencies (each range independently reconciled against the resolved version):
- org.apache.tomcat.embed:tomcat-embed-core:10.1.41 (compile; transitive via spring-boot-starter-web; pom.xml:34); confirmed affected range: >= 10.1.0-M1, < 10.1.55. Recommended fix: upgrade to 10.1.55 or a later supported patched release.

Dependency presence is confirmed; exploitability depends on advisory-specific runtime configuration. Test-only dependencies are explicitly labeled. Assessment covers all resolved Maven scopes; not build-plugin or OS dependencies.

### CVE-2026-43512: Apache Tomcat - Digest authenticator will authenticate any unknown user
- **Category:** CVE
- **Severity:** mandatory
- **Story points:** 1
- **Files:** pom.xml:34

[CVE-2026-43512](https://github.com/advisories/GHSA-h6fc-48rj-7qqh)

Severity: CRITICAL

Affected dependencies (each range independently reconciled against the resolved version):
- org.apache.tomcat.embed:tomcat-embed-core:10.1.41 (compile; transitive via spring-boot-starter-web; pom.xml:34); confirmed affected range: >= 10.1.0-M1, < 10.1.55. Recommended fix: upgrade to 10.1.55 or a later supported patched release.

Dependency presence is confirmed; exploitability depends on advisory-specific runtime configuration. Test-only dependencies are explicitly labeled. Assessment covers all resolved Maven scopes; not build-plugin or OS dependencies.

### CVE-2026-43513: Apache Tomcat: LockOutRealm treats user names as case-sensitive
- **Category:** CVE
- **Severity:** mandatory
- **Story points:** 1
- **Files:** pom.xml:34

[CVE-2026-43513](https://github.com/advisories/GHSA-5mp6-jrq3-r938)

Severity: HIGH

Affected dependencies (each range independently reconciled against the resolved version):
- org.apache.tomcat.embed:tomcat-embed-core:10.1.41 (compile; transitive via spring-boot-starter-web; pom.xml:34); confirmed affected range: >= 10.1.0-M1, < 10.1.55. Recommended fix: upgrade to 10.1.55 or a later supported patched release.

Dependency presence is confirmed; exploitability depends on advisory-specific runtime configuration. Test-only dependencies are explicitly labeled. Assessment covers all resolved Maven scopes; not build-plugin or OS dependencies.

### CVE-2026-43515: Apache Tomcat - Security constraints not correctly applied
- **Category:** CVE
- **Severity:** mandatory
- **Story points:** 1
- **Files:** pom.xml:34

[CVE-2026-43515](https://github.com/advisories/GHSA-5m62-pw8w-7w9f)

Severity: CRITICAL

Affected dependencies (each range independently reconciled against the resolved version):
- org.apache.tomcat.embed:tomcat-embed-core:10.1.41 (compile; transitive via spring-boot-starter-web; pom.xml:34); confirmed affected range: >= 10.1.0-M1, < 10.1.55. Recommended fix: upgrade to 10.1.55 or a later supported patched release.

Dependency presence is confirmed; exploitability depends on advisory-specific runtime configuration. Test-only dependencies are explicitly labeled. Assessment covers all resolved Maven scopes; not build-plugin or OS dependencies.

### CVE-2026-41293: Apache Tomcat - HTTP/2 request headers not validated
- **Category:** CVE
- **Severity:** mandatory
- **Story points:** 1
- **Files:** pom.xml:34

[CVE-2026-41293](https://github.com/advisories/GHSA-r29c-68gh-xp6x)

Severity: CRITICAL

Affected dependencies (each range independently reconciled against the resolved version):
- org.apache.tomcat.embed:tomcat-embed-core:10.1.41 (compile; transitive via spring-boot-starter-web; pom.xml:34); confirmed affected range: >= 10.1.0-M1, < 10.1.55. Recommended fix: upgrade to 10.1.55 or a later supported patched release.

Dependency presence is confirmed; exploitability depends on advisory-specific runtime configuration. Test-only dependencies are explicitly labeled. Assessment covers all resolved Maven scopes; not build-plugin or OS dependencies.

### CVE-2026-42498: Apache Tomcat - WebSocket authentication header exposure
- **Category:** CVE
- **Severity:** mandatory
- **Story points:** 1
- **Files:** pom.xml:34

[CVE-2026-42498](https://github.com/advisories/GHSA-fv25-8xcx-gqjc)

Severity: HIGH

Affected dependencies (each range independently reconciled against the resolved version):
- org.apache.tomcat.embed:tomcat-embed-core:10.1.41 (compile; transitive via spring-boot-starter-web; pom.xml:34); confirmed affected range: >= 10.1.0-M1, < 10.1.55. Recommended fix: upgrade to 10.1.55 or a later supported patched release.

Dependency presence is confirmed; exploitability depends on advisory-specific runtime configuration. Test-only dependencies are explicitly labeled. Assessment covers all resolved Maven scopes; not build-plugin or OS dependencies.

### CVE-2026-41901: Sandboxed Thymeleaf expressions vulnerable to improper recognition of unauthorized syntax patterns
- **Category:** CVE
- **Severity:** mandatory
- **Story points:** 1
- **Files:** pom.xml:40

[CVE-2026-41901](https://github.com/advisories/GHSA-c9ph-gxww-7744)

Severity: CRITICAL

Affected dependencies (each range independently reconciled against the resolved version):
- org.thymeleaf:thymeleaf:3.1.3.RELEASE (compile; transitive via spring-boot-starter-thymeleaf; pom.xml:40); confirmed affected range: <= 3.1.4.RELEASE. Recommended fix: upgrade to 3.1.5.RELEASE or a later supported patched release.
- org.thymeleaf:thymeleaf-spring6:3.1.3.RELEASE (compile; transitive via spring-boot-starter-thymeleaf; pom.xml:40); confirmed affected range: <= 3.1.4.RELEASE. Recommended fix: upgrade to 3.1.5.RELEASE or a later supported patched release.

Dependency presence is confirmed; exploitability depends on advisory-specific runtime configuration. Test-only dependencies are explicitly labeled. Assessment covers all resolved Maven scopes; not build-plugin or OS dependencies.

### CVE-2026-22745: Spring MVC and WebFlux applications are vulnerable to Denial of Service attacks when resolving static resources
- **Category:** CVE
- **Severity:** optional
- **Story points:** 1
- **Files:** pom.xml:34

[CVE-2026-22745](https://github.com/advisories/GHSA-6p4f-wcwh-5vvm)

Severity: MEDIUM

Affected dependencies (each range independently reconciled against the resolved version):
- org.springframework:spring-webmvc:6.2.7 (compile; transitive via spring-boot-starter-web; pom.xml:34); confirmed affected range: >= 6.2.0, <= 6.2.17. Recommended fix: upgrade to 6.2.18 or a later supported patched release.

Dependency presence is confirmed; exploitability depends on advisory-specific runtime configuration. Test-only dependencies are explicitly labeled. Assessment covers all resolved Maven scopes; not build-plugin or OS dependencies.

### CVE-2026-40478: Improper neutralization of specific syntax patterns for unauthorized expressions in Thymeleaf
- **Category:** CVE
- **Severity:** mandatory
- **Story points:** 1
- **Files:** pom.xml:40

[CVE-2026-40478](https://github.com/advisories/GHSA-xjw8-8c5c-9r79)

Severity: CRITICAL

Affected dependencies (each range independently reconciled against the resolved version):
- org.thymeleaf:thymeleaf:3.1.3.RELEASE (compile; transitive via spring-boot-starter-thymeleaf; pom.xml:40); confirmed affected range: <= 3.1.3.RELEASE. Recommended fix: upgrade to 3.1.4.RELEASE or a later supported patched release.
- org.thymeleaf:thymeleaf-spring6:3.1.3.RELEASE (compile; transitive via spring-boot-starter-thymeleaf; pom.xml:40); confirmed affected range: <= 3.1.3.RELEASE. Recommended fix: upgrade to 3.1.4.RELEASE or a later supported patched release.

Dependency presence is confirmed; exploitability depends on advisory-specific runtime configuration. Test-only dependencies are explicitly labeled. Assessment covers all resolved Maven scopes; not build-plugin or OS dependencies.

### CVE-2026-40477: Improper restriction of the scope of accessible objects in Thymeleaf expressions
- **Category:** CVE
- **Severity:** mandatory
- **Story points:** 1
- **Files:** pom.xml:40

[CVE-2026-40477](https://github.com/advisories/GHSA-r4v4-5mwr-2fwr)

Severity: CRITICAL

Affected dependencies (each range independently reconciled against the resolved version):
- org.thymeleaf:thymeleaf:3.1.3.RELEASE (compile; transitive via spring-boot-starter-thymeleaf; pom.xml:40); confirmed affected range: <= 3.1.3.RELEASE. Recommended fix: upgrade to 3.1.4.RELEASE or a later supported patched release.
- org.thymeleaf:thymeleaf-spring6:3.1.3.RELEASE (compile; transitive via spring-boot-starter-thymeleaf; pom.xml:40); confirmed affected range: <= 3.1.3.RELEASE. Recommended fix: upgrade to 3.1.4.RELEASE or a later supported patched release.

Dependency presence is confirmed; exploitability depends on advisory-specific runtime configuration. Test-only dependencies are explicitly labeled. Assessment covers all resolved Maven scopes; not build-plugin or OS dependencies.

### CVE-2026-34483: Apache Tomcat has an Improper Encoding or Escaping of Output vulnerability in the JsonAccessLogValve
- **Category:** CVE
- **Severity:** mandatory
- **Story points:** 1
- **Files:** pom.xml:34

[CVE-2026-34483](https://github.com/advisories/GHSA-rv64-5gf8-9qq8)

Severity: HIGH

Affected dependencies (each range independently reconciled against the resolved version):
- org.apache.tomcat.embed:tomcat-embed-core:10.1.41 (compile; transitive via spring-boot-starter-web; pom.xml:34); confirmed affected range: >= 10.1.0-M1, < 10.1.54. Recommended fix: upgrade to 10.1.54 or a later supported patched release.

Dependency presence is confirmed; exploitability depends on advisory-specific runtime configuration. Test-only dependencies are explicitly labeled. Assessment covers all resolved Maven scopes; not build-plugin or OS dependencies.

### CVE-2026-34487: Apache Tomcat vulnerable to Insertion of Sensitive Information into Log File
- **Category:** CVE
- **Severity:** mandatory
- **Story points:** 1
- **Files:** pom.xml:34

[CVE-2026-34487](https://github.com/advisories/GHSA-x4m4-345f-5h5g)

Severity: HIGH

Affected dependencies (each range independently reconciled against the resolved version):
- org.apache.tomcat.embed:tomcat-embed-core:10.1.41 (compile; transitive via spring-boot-starter-web; pom.xml:34); confirmed affected range: >= 10.1.0-M1, < 10.1.54. Recommended fix: upgrade to 10.1.54 or a later supported patched release.

Dependency presence is confirmed; exploitability depends on advisory-specific runtime configuration. Test-only dependencies are explicitly labeled. Assessment covers all resolved Maven scopes; not build-plugin or OS dependencies.

### CVE-2026-25854: Apache Tomcat has an Open Redirect vulnerability
- **Category:** CVE
- **Severity:** optional
- **Story points:** 1
- **Files:** pom.xml:34

[CVE-2026-25854](https://github.com/advisories/GHSA-9m3c-qcxr-9x87)

Severity: MEDIUM

Affected dependencies (each range independently reconciled against the resolved version):
- org.apache.tomcat.embed:tomcat-embed-core:10.1.41 (compile; transitive via spring-boot-starter-web; pom.xml:34); confirmed affected range: >= 10.1.0-M1, < 10.1.53. Recommended fix: upgrade to 10.1.53 or a later supported patched release.

Dependency presence is confirmed; exploitability depends on advisory-specific runtime configuration. Test-only dependencies are explicitly labeled. Assessment covers all resolved Maven scopes; not build-plugin or OS dependencies.

### CVE-2026-24880: Apache Tomcat has an HTTP Request/Response Smuggling vulnerability
- **Category:** CVE
- **Severity:** mandatory
- **Story points:** 1
- **Files:** pom.xml:34

[CVE-2026-24880](https://github.com/advisories/GHSA-563x-q5rq-57qp)

Severity: HIGH

Affected dependencies (each range independently reconciled against the resolved version):
- org.apache.tomcat.embed:tomcat-embed-core:10.1.41 (compile; transitive via spring-boot-starter-web; pom.xml:34); confirmed affected range: >= 10.1.0-M1, < 10.1.52. Recommended fix: upgrade to 10.1.52 or a later supported patched release.

Dependency presence is confirmed; exploitability depends on advisory-specific runtime configuration. Test-only dependencies are explicitly labeled. Assessment covers all resolved Maven scopes; not build-plugin or OS dependencies.

### CVE-2026-22737: Spring Framework Improper Path Limitation with Script View Templates
- **Category:** CVE
- **Severity:** optional
- **Story points:** 1
- **Files:** pom.xml:34

[CVE-2026-22737](https://github.com/advisories/GHSA-4773-3jfm-qmx3)

Severity: MEDIUM

Affected dependencies (each range independently reconciled against the resolved version):
- org.springframework:spring-webmvc:6.2.7 (compile; transitive via spring-boot-starter-web; pom.xml:34); confirmed affected range: >= 6.2.0, < 6.2.17. Recommended fix: upgrade to 6.2.17 or a later supported patched release.

Dependency presence is confirmed; exploitability depends on advisory-specific runtime configuration. Test-only dependencies are explicitly labeled. Assessment covers all resolved Maven scopes; not build-plugin or OS dependencies.

### CVE-2026-24734: Apache Tomcat has an Improper Input Validation vulnerability
- **Category:** CVE
- **Severity:** mandatory
- **Story points:** 1
- **Files:** pom.xml:34

[CVE-2026-24734](https://github.com/advisories/GHSA-mgp5-rv84-w37q)

Severity: HIGH

Affected dependencies (each range independently reconciled against the resolved version):
- org.apache.tomcat.embed:tomcat-embed-core:10.1.41 (compile; transitive via spring-boot-starter-web; pom.xml:34); confirmed affected range: >= 10.1.0-M7, < 10.1.52. Recommended fix: upgrade to 10.1.52 or a later supported patched release.

Dependency presence is confirmed; exploitability depends on advisory-specific runtime configuration. Test-only dependencies are explicitly labeled. Assessment covers all resolved Maven scopes; not build-plugin or OS dependencies.

### CVE-2025-66614: Apache Tomcat - Client certificate verification bypass
- **Category:** CVE
- **Severity:** optional
- **Story points:** 1
- **Files:** pom.xml:34

[CVE-2025-66614](https://github.com/advisories/GHSA-fpj8-gq4v-p354)

Severity: MEDIUM

Affected dependencies (each range independently reconciled against the resolved version):
- org.apache.tomcat.embed:tomcat-embed-core:10.1.41 (compile; transitive via spring-boot-starter-web; pom.xml:34); confirmed affected range: >= 10.1.0-M1, < 10.1.50. Recommended fix: upgrade to 10.1.50 or a later supported patched release.

Dependency presence is confirmed; exploitability depends on advisory-specific runtime configuration. Test-only dependencies are explicitly labeled. Assessment covers all resolved Maven scopes; not build-plugin or OS dependencies.

### CVE-2025-55752: Apache Tomcat Vulnerable to Relative Path Traversal
- **Category:** CVE
- **Severity:** mandatory
- **Story points:** 1
- **Files:** pom.xml:34

[CVE-2025-55752](https://github.com/advisories/GHSA-wmwf-9ccg-fff5)

Severity: HIGH

Affected dependencies (each range independently reconciled against the resolved version):
- org.apache.tomcat.embed:tomcat-embed-core:10.1.41 (compile; transitive via spring-boot-starter-web; pom.xml:34); confirmed affected range: >= 10.1.0-M1, < 10.1.45. Recommended fix: upgrade to 10.1.45 or a later supported patched release.

Dependency presence is confirmed; exploitability depends on advisory-specific runtime configuration. Test-only dependencies are explicitly labeled. Assessment covers all resolved Maven scopes; not build-plugin or OS dependencies.

### CVE-2025-11226: QOS.CH logback-core is vulnerable to Arbitrary Code Execution through file processing
- **Category:** CVE
- **Severity:** optional
- **Story points:** 1
- **Files:** pom.xml:34

[CVE-2025-11226](https://github.com/advisories/GHSA-25qh-j22f-pwp8)

Severity: MEDIUM

Affected dependencies (each range independently reconciled against the resolved version):
- ch.qos.logback:logback-core:1.5.18 (compile; transitive via spring-boot-starter-web; pom.xml:34); confirmed affected range: >= 1.4.0, < 1.5.19. Recommended fix: upgrade to 1.5.19 or a later supported patched release.

Dependency presence is confirmed; exploitability depends on advisory-specific runtime configuration. Test-only dependencies are explicitly labeled. Assessment covers all resolved Maven scopes; not build-plugin or OS dependencies.

### CVE-2025-41242: Spring Framework MVC Applications Path Traversal Vulnerability
- **Category:** CVE
- **Severity:** optional
- **Story points:** 1
- **Files:** pom.xml:34

[CVE-2025-41242](https://github.com/advisories/GHSA-r936-gwx5-v52f)

Severity: MEDIUM

Affected dependencies (each range independently reconciled against the resolved version):
- org.springframework:spring-webmvc:6.2.7 (compile; transitive via spring-boot-starter-web; pom.xml:34); confirmed affected range: >= 6.2.0, < 6.2.10. Recommended fix: upgrade to 6.2.10 or a later supported patched release.

Dependency presence is confirmed; exploitability depends on advisory-specific runtime configuration. Test-only dependencies are explicitly labeled. Assessment covers all resolved Maven scopes; not build-plugin or OS dependencies.

### CVE-2025-48989: Apache Tomcat Improper Resource Shutdown or Release vulnerability
- **Category:** CVE
- **Severity:** mandatory
- **Story points:** 1
- **Files:** pom.xml:34

[CVE-2025-48989](https://github.com/advisories/GHSA-gqp3-2cvr-x8m3)

Severity: HIGH

Affected dependencies (each range independently reconciled against the resolved version):
- org.apache.tomcat.embed:tomcat-embed-core:10.1.41 (compile; transitive via spring-boot-starter-web; pom.xml:34); confirmed affected range: >= 10.1.0-M1, < 10.1.44. Recommended fix: upgrade to 10.1.44 or a later supported patched release.

Dependency presence is confirmed; exploitability depends on advisory-specific runtime configuration. Test-only dependencies are explicitly labeled. Assessment covers all resolved Maven scopes; not build-plugin or OS dependencies.

### CVE-2025-55668: Apache Tomcat Session Fixation vulnerability
- **Category:** CVE
- **Severity:** optional
- **Story points:** 1
- **Files:** pom.xml:34

[CVE-2025-55668](https://github.com/advisories/GHSA-23hv-mwm6-g8jf)

Severity: MEDIUM

Affected dependencies (each range independently reconciled against the resolved version):
- org.apache.tomcat.embed:tomcat-embed-core:10.1.41 (compile; transitive via spring-boot-starter-web; pom.xml:34); confirmed affected range: >= 10.1.0-M1, < 10.1.42. Recommended fix: upgrade to 10.1.42 or a later supported patched release.

Dependency presence is confirmed; exploitability depends on advisory-specific runtime configuration. Test-only dependencies are explicitly labeled. Assessment covers all resolved Maven scopes; not build-plugin or OS dependencies.

### CVE-2025-53506: Apache Tomcat Coyote vulnerable to Denial of Service via excessive HTTP/2 streams
- **Category:** CVE
- **Severity:** mandatory
- **Story points:** 1
- **Files:** pom.xml:34

[CVE-2025-53506](https://github.com/advisories/GHSA-25xr-qj8w-c4vf)

Severity: HIGH

Affected dependencies (each range independently reconciled against the resolved version):
- org.apache.tomcat.embed:tomcat-embed-core:10.1.41 (compile; transitive via spring-boot-starter-web; pom.xml:34); confirmed affected range: >= 10.1.0-M1, < 10.1.43. Recommended fix: upgrade to 10.1.43 or a later supported patched release.

Dependency presence is confirmed; exploitability depends on advisory-specific runtime configuration. Test-only dependencies are explicitly labeled. Assessment covers all resolved Maven scopes; not build-plugin or OS dependencies.

### CVE-2025-52520: Apache Tomcat Catalina is vulnerable to DoS attack through bypassing of size limits
- **Category:** CVE
- **Severity:** mandatory
- **Story points:** 1
- **Files:** pom.xml:34

[CVE-2025-52520](https://github.com/advisories/GHSA-wr62-c79q-cv37)

Severity: HIGH

Affected dependencies (each range independently reconciled against the resolved version):
- org.apache.tomcat.embed:tomcat-embed-core:10.1.41 (compile; transitive via spring-boot-starter-web; pom.xml:34); confirmed affected range: >= 10.1.0-M1, < 10.1.43. Recommended fix: upgrade to 10.1.43 or a later supported patched release.

Dependency presence is confirmed; exploitability depends on advisory-specific runtime configuration. Test-only dependencies are explicitly labeled. Assessment covers all resolved Maven scopes; not build-plugin or OS dependencies.

### CVE-2025-49124: Apache Tomcat installer for Windows has an untrusted search path vulnerability
- **Category:** CVE
- **Severity:** optional
- **Story points:** 1
- **Files:** pom.xml:34

[CVE-2025-49124](https://github.com/advisories/GHSA-42wg-hm62-jcwg)

Severity: MEDIUM

Affected dependencies (each range independently reconciled against the resolved version):
- org.apache.tomcat.embed:tomcat-embed-core:10.1.41 (compile; transitive via spring-boot-starter-web; pom.xml:34); confirmed affected range: >= 10.1.0, < 10.1.42. Recommended fix: upgrade to 10.1.42 or a later supported patched release.

Dependency presence is confirmed; exploitability depends on advisory-specific runtime configuration. Test-only dependencies are explicitly labeled. Assessment covers all resolved Maven scopes; not build-plugin or OS dependencies.

### CVE-2025-49125: Apache Tomcat - Security constraint bypass for pre/post-resources
- **Category:** CVE
- **Severity:** optional
- **Story points:** 1
- **Files:** pom.xml:34

[CVE-2025-49125](https://github.com/advisories/GHSA-wc4r-xq3c-5cf3)

Severity: MEDIUM

Affected dependencies (each range independently reconciled against the resolved version):
- org.apache.tomcat.embed:tomcat-embed-core:10.1.41 (compile; transitive via spring-boot-starter-web; pom.xml:34); confirmed affected range: >= 10.1.0-M1, <= 10.1.41. Recommended fix: upgrade to 10.1.42 or a later supported patched release.

Dependency presence is confirmed; exploitability depends on advisory-specific runtime configuration. Test-only dependencies are explicitly labeled. Assessment covers all resolved Maven scopes; not build-plugin or OS dependencies.

### CVE-2025-48988: Apache Tomcat - DoS in multipart upload
- **Category:** CVE
- **Severity:** mandatory
- **Story points:** 1
- **Files:** pom.xml:34

[CVE-2025-48988](https://github.com/advisories/GHSA-h3gc-qfqq-6h8f)

Severity: HIGH

Affected dependencies (each range independently reconciled against the resolved version):
- org.apache.tomcat.embed:tomcat-embed-core:10.1.41 (compile; transitive via spring-boot-starter-web; pom.xml:34); confirmed affected range: >= 10.1.0-M1, <= 10.1.41. Recommended fix: upgrade to 10.1.42 or a later supported patched release.

Dependency presence is confirmed; exploitability depends on advisory-specific runtime configuration. Test-only dependencies are explicitly labeled. Assessment covers all resolved Maven scopes; not build-plugin or OS dependencies.

### CVE-2025-41234: Spring Framework vulnerable to a reflected file download (RFD)
- **Category:** CVE
- **Severity:** optional
- **Story points:** 1
- **Files:** pom.xml:34

[CVE-2025-41234](https://github.com/advisories/GHSA-6r3c-xf4w-jxjm)

Severity: MEDIUM

Affected dependencies (each range independently reconciled against the resolved version):
- org.springframework:spring-web:6.2.7 (compile; transitive via spring-boot-starter-web; pom.xml:34); confirmed affected range: >= 6.2.0, < 6.2.8. Recommended fix: upgrade to 6.2.8 or a later supported patched release.

Dependency presence is confirmed; exploitability depends on advisory-specific runtime configuration. Test-only dependencies are explicitly labeled. Assessment covers all resolved Maven scopes; not build-plugin or OS dependencies.

### CVE-2026-41695: Spring Data: Unbounded property-path cache keyed by externally-supplied path string
- **Category:** CVE
- **Severity:** mandatory
- **Story points:** 1
- **Files:** pom.xml:46

[CVE-2026-41695](https://github.com/advisories/GHSA-88fw-v6x4-3f58)

Severity: HIGH

Affected dependencies (each range independently reconciled against the resolved version):
- org.springframework.data:spring-data-commons:3.5.0 (compile; transitive via spring-boot-starter-data-jpa; pom.xml:46); confirmed affected range: >= 3.5.0, <= 3.5.11. Recommended fix: upgrade to 3.5.12 or a later supported patched release.

Dependency presence is confirmed; exploitability depends on advisory-specific runtime configuration. Test-only dependencies are explicitly labeled. Assessment covers all resolved Maven scopes; not build-plugin or OS dependencies.

### CVE-2026-41721: Spring Data Commons: Denial of Service via excessive memory allocation in projection binding
- **Category:** CVE
- **Severity:** optional
- **Story points:** 1
- **Files:** pom.xml:46

[CVE-2026-41721](https://github.com/advisories/GHSA-5m4m-73w9-8433)

Severity: MEDIUM

Affected dependencies (each range independently reconciled against the resolved version):
- org.springframework.data:spring-data-commons:3.5.0 (compile; transitive via spring-boot-starter-data-jpa; pom.xml:46); confirmed affected range: >= 3.5.0, <= 3.5.11. Recommended fix: upgrade to 3.5.12 or a later supported patched release.

Dependency presence is confirmed; exploitability depends on advisory-specific runtime configuration. Test-only dependencies are explicitly labeled. Assessment covers all resolved Maven scopes; not build-plugin or OS dependencies.

### CVE-2026-41711: Spring Data Commons: StackOverflowException when parsing Sort parameters (DoS)
- **Category:** CVE
- **Severity:** optional
- **Story points:** 1
- **Files:** pom.xml:46

[CVE-2026-41711](https://github.com/advisories/GHSA-5vpf-xvv7-c8vh)

Severity: MEDIUM

Affected dependencies (each range independently reconciled against the resolved version):
- org.springframework.data:spring-data-commons:3.5.0 (compile; transitive via spring-boot-starter-data-jpa; pom.xml:46); confirmed affected range: >= 3.5.0, <= 3.5.11. Recommended fix: upgrade to 3.5.12 or a later supported patched release.

Dependency presence is confirmed; exploitability depends on advisory-specific runtime configuration. Test-only dependencies are explicitly labeled. Assessment covers all resolved Maven scopes; not build-plugin or OS dependencies.

### CVE-2026-41716: Spring Data Commons: Heap exhaustion from unbounded property-lookup cache retaining crafted string keys
- **Category:** CVE
- **Severity:** mandatory
- **Story points:** 1
- **Files:** pom.xml:46

[CVE-2026-41716](https://github.com/advisories/GHSA-9fw2-h3hf-293r)

Severity: HIGH

Affected dependencies (each range independently reconciled against the resolved version):
- org.springframework.data:spring-data-commons:3.5.0 (compile; transitive via spring-boot-starter-data-jpa; pom.xml:46); confirmed affected range: >= 3.5.0, <= 3.5.11. Recommended fix: upgrade to 3.5.12 or a later supported patched release.

Dependency presence is confirmed; exploitability depends on advisory-specific runtime configuration. Test-only dependencies are explicitly labeled. Assessment covers all resolved Maven scopes; not build-plugin or OS dependencies.

### CVE-2026-22751: Spring Security Core has a TOCTOU race condition when One-Time Token login with JdbcOneTimeTokenService is configured
- **Category:** CVE
- **Severity:** optional
- **Story points:** 1
- **Files:** pom.xml:65

[CVE-2026-22751](https://github.com/advisories/GHSA-x2wq-9x2f-fhj7)

Severity: MEDIUM

Affected dependencies (each range independently reconciled against the resolved version):
- org.springframework.security:spring-security-core:6.5.0 (compile; transitive via spring-boot-starter-security; pom.xml:65); confirmed affected range: >= 6.5.0, < 6.5.10. Recommended fix: upgrade to 6.5.10 or a later supported patched release.

Dependency presence is confirmed; exploitability depends on advisory-specific runtime configuration. Test-only dependencies are explicitly labeled. Assessment covers all resolved Maven scopes; not build-plugin or OS dependencies.

### CVE-2025-41248: Spring Security annotation detection mechanism has authorization bypass
- **Category:** CVE
- **Severity:** mandatory
- **Story points:** 1
- **Files:** pom.xml:65

[CVE-2025-41248](https://github.com/advisories/GHSA-8v5q-rhf3-jphm)

Severity: HIGH

Affected dependencies (each range independently reconciled against the resolved version):
- org.springframework.security:spring-security-core:6.5.0 (compile; transitive via spring-boot-starter-security; pom.xml:65); confirmed affected range: >= 6.5.0, < 6.5.4. Recommended fix: upgrade to 6.5.4 or a later supported patched release.

Dependency presence is confirmed; exploitability depends on advisory-specific runtime configuration. Test-only dependencies are explicitly labeled. Assessment covers all resolved Maven scopes; not build-plugin or OS dependencies.

### CVE-2026-89425: jackson-core: UTF8DataInputJsonParser._reportInvalidToken() missing maxErrorTokenLength limit -> unbounded StringBuilder growth (DoS)
- **Category:** CVE
- **Severity:** mandatory
- **Story points:** 1
- **Files:** pom.xml:78

[CVE-2026-89425](https://github.com/advisories/GHSA-7hhh-6rmp-j9qf)

Severity: HIGH

Affected dependencies (each range independently reconciled against the resolved version):
- com.fasterxml.jackson.core:jackson-core:2.19.0 (compile; transitive via spring-boot-starter-json; pom.xml:78); confirmed affected range: >= 2.19.0, <= 2.21.6. Recommended fix: upgrade to 2.21.7 or a later supported patched release.

Dependency presence is confirmed; exploitability depends on advisory-specific runtime configuration. Test-only dependencies are explicitly labeled. Assessment covers all resolved Maven scopes; not build-plugin or OS dependencies.

### CVE-2026-89407:  jackson-core: ReDoS: quadratic backtracking in NumberInput.PATTERN_FLOAT via looksLikeValidNumber()
- **Category:** CVE
- **Severity:** mandatory
- **Story points:** 1
- **Files:** pom.xml:78

[CVE-2026-89407](https://github.com/advisories/GHSA-p6pp-m3f8-5c89)

Severity: HIGH

Affected dependencies (each range independently reconciled against the resolved version):
- com.fasterxml.jackson.core:jackson-core:2.19.0 (compile; transitive via spring-boot-starter-json; pom.xml:78); confirmed affected range: >= 2.19.0, <= 2.21.6. Recommended fix: upgrade to 2.21.7 or a later supported patched release.

Dependency presence is confirmed; exploitability depends on advisory-specific runtime configuration. Test-only dependencies are explicitly labeled. Assessment covers all resolved Maven scopes; not build-plugin or OS dependencies.

### CVE-2026-91777: jackson-databind quadratic forward-reference completion 
- **Category:** CVE
- **Severity:** mandatory
- **Story points:** 1
- **Files:** pom.xml:78

[CVE-2026-91777](https://github.com/advisories/GHSA-cxp5-3px4-pw24)

Severity: HIGH

Affected dependencies (each range independently reconciled against the resolved version):
- com.fasterxml.jackson.core:jackson-databind:2.19.0 (compile; transitive via spring-boot-starter-json; pom.xml:78); confirmed affected range: >= 2.19.0, <= 2.21.6. Recommended fix: upgrade to 2.21.7 or a later supported patched release.

Dependency presence is confirmed; exploitability depends on advisory-specific runtime configuration. Test-only dependencies are explicitly labeled. Assessment covers all resolved Maven scopes; not build-plugin or OS dependencies.

### CVE-2026-91776: jackson-databind retains every unknown raw type ID 
- **Category:** CVE
- **Severity:** mandatory
- **Story points:** 1
- **Files:** pom.xml:78

[CVE-2026-91776](https://github.com/advisories/GHSA-wv8q-qhhj-9h54)

Severity: HIGH

Affected dependencies (each range independently reconciled against the resolved version):
- com.fasterxml.jackson.core:jackson-databind:2.19.0 (compile; transitive via spring-boot-starter-json; pom.xml:78); confirmed affected range: >= 2.19.0, <= 2.21.6. Recommended fix: upgrade to 2.21.7 or a later supported patched release.

Dependency presence is confirmed; exploitability depends on advisory-specific runtime configuration. Test-only dependencies are explicitly labeled. Assessment covers all resolved Maven scopes; not build-plugin or OS dependencies.

### CVE-2026-83557: jackson-databind: Comparable missing from DefaultBaseTypeLimitingValidator's unsafe base types (incomplete PolymorphicTypeValidator denylist)
- **Category:** CVE
- **Severity:** optional
- **Story points:** 1
- **Files:** pom.xml:78

[CVE-2026-83557](https://github.com/advisories/GHSA-gx83-3vf8-gh7j)

Severity: MEDIUM

Affected dependencies (each range independently reconciled against the resolved version):
- com.fasterxml.jackson.core:jackson-databind:2.19.0 (compile; transitive via spring-boot-starter-json; pom.xml:78); confirmed affected range: >= 2.19.0, < 2.21.6. Recommended fix: upgrade to 2.21.6 or a later supported patched release.

Dependency presence is confirmed; exploitability depends on advisory-specific runtime configuration. Test-only dependencies are explicitly labeled. Assessment covers all resolved Maven scopes; not build-plugin or OS dependencies.

### CVE-2026-68497: jackson-databind: Duration XMLGregorianCalendar Unbounded Number Parse DoS
- **Category:** CVE
- **Severity:** mandatory
- **Story points:** 1
- **Files:** pom.xml:78

[CVE-2026-68497](https://github.com/advisories/GHSA-q4xh-88c3-wmh7)

Severity: HIGH

Affected dependencies (each range independently reconciled against the resolved version):
- com.fasterxml.jackson.core:jackson-databind:2.19.0 (compile; transitive via spring-boot-starter-json; pom.xml:78); confirmed affected range: >= 2.19.0, < 2.21.6. Recommended fix: upgrade to 2.21.6 or a later supported patched release.

Dependency presence is confirmed; exploitability depends on advisory-specific runtime configuration. Test-only dependencies are explicitly labeled. Assessment covers all resolved Maven scopes; not build-plugin or OS dependencies.

### CVE-2026-19032: jackson-databind: Path Deserialization Missing Scheme Allowlist for FileSystemProvider Resolution
- **Category:** CVE
- **Severity:** optional
- **Story points:** 1
- **Files:** pom.xml:78

[CVE-2026-19032](https://github.com/advisories/GHSA-wjgm-6hv5-3cvf)

Severity: MEDIUM

Affected dependencies (each range independently reconciled against the resolved version):
- com.fasterxml.jackson.core:jackson-databind:2.19.0 (compile; transitive via spring-boot-starter-json; pom.xml:78); confirmed affected range: >= 2.19.0, < 2.21.6. Recommended fix: upgrade to 2.21.6 or a later supported patched release.

Dependency presence is confirmed; exploitability depends on advisory-specific runtime configuration. Test-only dependencies are explicitly labeled. Assessment covers all resolved Maven scopes; not build-plugin or OS dependencies.

### CVE-2026-77310: jackson-databind: Incomplete fix for CVE-2026-54514: eager DNS resolution (SSRF) still present in InetAddress deserialization
- **Category:** CVE
- **Severity:** optional
- **Story points:** 1
- **Files:** pom.xml:78

[CVE-2026-77310](https://github.com/advisories/GHSA-vvgp-rfg2-7rr6)

Severity: MEDIUM

Affected dependencies (each range independently reconciled against the resolved version):
- com.fasterxml.jackson.core:jackson-databind:2.19.0 (compile; transitive via spring-boot-starter-json; pom.xml:78); confirmed affected range: >= 2.19.0, < 2.21.5. Recommended fix: upgrade to 2.21.5 or a later supported patched release.

Dependency presence is confirmed; exploitability depends on advisory-specific runtime configuration. Test-only dependencies are explicitly labeled. Assessment covers all resolved Maven scopes; not build-plugin or OS dependencies.

### CVE-2026-59889: jackson-databind: @JsonView bypassed for @JsonUnwrapped container properties on deserialization
- **Category:** CVE
- **Severity:** optional
- **Story points:** 1
- **Files:** pom.xml:78

[CVE-2026-59889](https://github.com/advisories/GHSA-5gvw-p9qm-jgwh)

Severity: MEDIUM

Affected dependencies (each range independently reconciled against the resolved version):
- com.fasterxml.jackson.core:jackson-databind:2.19.0 (compile; transitive via spring-boot-starter-json; pom.xml:78); confirmed affected range: >= 2.19.0, < 2.21.5. Recommended fix: upgrade to 2.21.5 or a later supported patched release.

Dependency presence is confirmed; exploitability depends on advisory-specific runtime configuration. Test-only dependencies are explicitly labeled. Assessment covers all resolved Maven scopes; not build-plugin or OS dependencies.

### CVE-2026-68494: jackson-core: Async parser maxNumberLength bypass via chunked digit accumulation (incomplete fix for GHSA-72hv-8253-57qq)
- **Category:** CVE
- **Severity:** mandatory
- **Story points:** 1
- **Files:** pom.xml:78

[CVE-2026-68494](https://github.com/advisories/GHSA-r7wm-3cxj-wff9)

Severity: HIGH

Affected dependencies (each range independently reconciled against the resolved version):
- com.fasterxml.jackson.core:jackson-core:2.19.0 (compile; transitive via spring-boot-starter-json; pom.xml:78); confirmed affected range: >= 2.19.0, < 2.21.4. Recommended fix: upgrade to 2.21.4 or a later supported patched release.

Dependency presence is confirmed; exploitability depends on advisory-specific runtime configuration. Test-only dependencies are explicitly labeled. Assessment covers all resolved Maven scopes; not build-plugin or OS dependencies.

### CVE-2026-59888: jackson-databind: @JsonIgnore on a Record property is bypassed with a PropertyNamingStrategy
- **Category:** CVE
- **Severity:** optional
- **Story points:** 1
- **Files:** pom.xml:78

[CVE-2026-59888](https://github.com/advisories/GHSA-3pjw-73gf-8qr5)

Severity: MEDIUM

Affected dependencies (each range independently reconciled against the resolved version):
- com.fasterxml.jackson.core:jackson-databind:2.19.0 (compile; transitive via spring-boot-starter-json; pom.xml:78); confirmed affected range: >= 2.19.0, < 2.21.4. Recommended fix: upgrade to 2.21.4 or a later supported patched release.

Dependency presence is confirmed; exploitability depends on advisory-specific runtime configuration. Test-only dependencies are explicitly labeled. Assessment covers all resolved Maven scopes; not build-plugin or OS dependencies.

### CVE-2026-54515: jackson-databind has case-insensitive deserialization bypasses per-property @JsonIgnoreProperties
- **Category:** CVE
- **Severity:** optional
- **Story points:** 1
- **Files:** pom.xml:78

[CVE-2026-54515](https://github.com/advisories/GHSA-5jmj-h7xm-6q6v)

Severity: MEDIUM

Affected dependencies (each range independently reconciled against the resolved version):
- com.fasterxml.jackson.core:jackson-databind:2.19.0 (compile; transitive via spring-boot-starter-json; pom.xml:78); confirmed affected range: >= 2.19.0, < 2.21.5. Recommended fix: upgrade to 2.21.5 or a later supported patched release.

Dependency presence is confirmed; exploitability depends on advisory-specific runtime configuration. Test-only dependencies are explicitly labeled. Assessment covers all resolved Maven scopes; not build-plugin or OS dependencies.

### CVE-2026-54514: jackson-databind: InetSocketAddress deserialization triggers eager DNS resolution (SSRF)
- **Category:** CVE
- **Severity:** optional
- **Story points:** 1
- **Files:** pom.xml:78

[CVE-2026-54514](https://github.com/advisories/GHSA-hgj6-7826-r7m5)

Severity: MEDIUM

Affected dependencies (each range independently reconciled against the resolved version):
- com.fasterxml.jackson.core:jackson-databind:2.19.0 (compile; transitive via spring-boot-starter-json; pom.xml:78); confirmed affected range: >= 2.19.0, < 2.21.4. Recommended fix: upgrade to 2.21.4 or a later supported patched release.

Dependency presence is confirmed; exploitability depends on advisory-specific runtime configuration. Test-only dependencies are explicitly labeled. Assessment covers all resolved Maven scopes; not build-plugin or OS dependencies.

### CVE-2026-54513: jackson-databind has an array subtype allowlist bypass in BasicPolymorphicTypeValidator (allowIfSubTypeIsArray)
- **Category:** CVE
- **Severity:** mandatory
- **Story points:** 1
- **Files:** pom.xml:78

[CVE-2026-54513](https://github.com/advisories/GHSA-rmj7-2vxq-3g9f)

Severity: HIGH

Affected dependencies (each range independently reconciled against the resolved version):
- com.fasterxml.jackson.core:jackson-databind:2.19.0 (compile; transitive via spring-boot-starter-json; pom.xml:78); confirmed affected range: >= 2.19.0, < 2.21.4. Recommended fix: upgrade to 2.21.4 or a later supported patched release.

Dependency presence is confirmed; exploitability depends on advisory-specific runtime configuration. Test-only dependencies are explicitly labeled. Assessment covers all resolved Maven scopes; not build-plugin or OS dependencies.

### CVE-2026-54512: jackson-databind has a PolymorphicTypeValidator bypass via generic type parameters that allows arbitrary class instantiation
- **Category:** CVE
- **Severity:** mandatory
- **Story points:** 1
- **Files:** pom.xml:78

[CVE-2026-54512](https://github.com/advisories/GHSA-j3rv-43j4-c7qm)

Severity: HIGH

Affected dependencies (each range independently reconciled against the resolved version):
- com.fasterxml.jackson.core:jackson-databind:2.19.0 (compile; transitive via spring-boot-starter-json; pom.xml:78); confirmed affected range: >= 2.19.0, <= 2.21.3. Recommended fix: upgrade to 2.21.4 or a later supported patched release.

Dependency presence is confirmed; exploitability depends on advisory-specific runtime configuration. Test-only dependencies are explicitly labeled. Assessment covers all resolved Maven scopes; not build-plugin or OS dependencies.

### CVE-2026-47838: Spring Security Vulnerable to Unauthorized User Impersonation when Using X.509 Client Certificates
- **Category:** CVE
- **Severity:** optional
- **Story points:** 1
- **Files:** pom.xml:65

[CVE-2026-47838](https://github.com/advisories/GHSA-293q-567p-wmwq)

Severity: MEDIUM

Affected dependencies (each range independently reconciled against the resolved version):
- org.springframework.security:spring-security-web:6.5.0 (compile; transitive via spring-boot-starter-security; pom.xml:65); confirmed affected range: >= 6.5.0, <= 6.5.10. Recommended fix: upgrade to 6.5.11 or a later supported patched release.

Dependency presence is confirmed; exploitability depends on advisory-specific runtime configuration. Test-only dependencies are explicitly labeled. Assessment covers all resolved Maven scopes; not build-plugin or OS dependencies.

### CVE-2026-41706: Spring Security: Open Redirect via Unvalidated Post-Login Redirect URL Stored in CookieRequestCache
- **Category:** CVE
- **Severity:** optional
- **Story points:** 1
- **Files:** pom.xml:65

[CVE-2026-41706](https://github.com/advisories/GHSA-x2r2-rvhq-2mqv)

Severity: MEDIUM

Affected dependencies (each range independently reconciled against the resolved version):
- org.springframework.security:spring-security-web:6.5.0 (compile; transitive via spring-boot-starter-security; pom.xml:65); confirmed affected range: >= 6.5.0, <= 6.5.10. Recommended fix: upgrade to 6.5.11 or a later supported patched release.

Dependency presence is confirmed; exploitability depends on advisory-specific runtime configuration. Test-only dependencies are explicitly labeled. Assessment covers all resolved Maven scopes; not build-plugin or OS dependencies.

### CVE-2026-22732: Spring Security HTTP Headers Are not Written Under Some Conditions
- **Category:** CVE
- **Severity:** mandatory
- **Story points:** 1
- **Files:** pom.xml:65

[CVE-2026-22732](https://github.com/advisories/GHSA-mf92-479x-3373)

Severity: CRITICAL

Affected dependencies (each range independently reconciled against the resolved version):
- org.springframework.security:spring-security-web:6.5.0 (compile; transitive via spring-boot-starter-security; pom.xml:65); confirmed affected range: >= 6.5.0, < 6.5.9. Recommended fix: upgrade to 6.5.9 or a later supported patched release.

Dependency presence is confirmed; exploitability depends on advisory-specific runtime configuration. Test-only dependencies are explicitly labeled. Assessment covers all resolved Maven scopes; not build-plugin or OS dependencies.

### CVE-2026-18401: jackson-core: Number Length Constraint Bypass in Async Parser Leads to Potential DoS Condition
- **Category:** CVE
- **Severity:** optional
- **Story points:** 1
- **Files:** pom.xml:78

[CVE-2026-18401](https://github.com/advisories/GHSA-72hv-8253-57qq)

Severity: MEDIUM

Affected dependencies (each range independently reconciled against the resolved version):
- com.fasterxml.jackson.core:jackson-core:2.19.0 (compile; transitive via spring-boot-starter-json; pom.xml:78); confirmed affected range: >= 2.19.0, < 2.21.1. Recommended fix: upgrade to 2.21.1 or a later supported patched release.

Dependency presence is confirmed; exploitability depends on advisory-specific runtime configuration. Test-only dependencies are explicitly labeled. Assessment covers all resolved Maven scopes; not build-plugin or OS dependencies.

### CVE-2026-24400: AssertJ has XML External Entity (XXE) vulnerability when parsing untrusted XML via isXmlEqualTo assertion
- **Category:** CVE
- **Severity:** mandatory
- **Story points:** 1
- **Files:** pom.xml:84

[CVE-2026-24400](https://github.com/advisories/GHSA-rqfh-9r24-8c9r)

Severity: HIGH

Affected dependencies (each range independently reconciled against the resolved version):
- org.assertj:assertj-core:3.27.3 (test; transitive via spring-boot-starter-test; pom.xml:84); confirmed affected range: >= 1.4.0, <= 3.27.6. Recommended fix: upgrade to 3.27.7 or a later supported patched release.

Dependency presence is confirmed; exploitability depends on advisory-specific runtime configuration. Test-only dependencies are explicitly labeled. Assessment covers all resolved Maven scopes; not build-plugin or OS dependencies.

### CVE-2026-41001: Spring Boot: Predictable Temp Directory in Artemis Auto-configuration
- **Category:** CVE
- **Severity:** optional
- **Story points:** 1
- **Files:** pom.xml:98

[CVE-2026-41001](https://github.com/advisories/GHSA-ggg2-9786-hwc8)

Severity: MEDIUM

Affected dependencies (each range independently reconciled against the resolved version):
- org.springframework.boot:spring-boot-autoconfigure:3.5.0 (compile; transitive via spring-boot-devtools; pom.xml:98); confirmed affected range: >= 3.5.0, <= 3.5.14. Recommended fix: upgrade to 3.5.15 or a later supported patched release.

Dependency presence is confirmed; exploitability depends on advisory-specific runtime configuration. Test-only dependencies are explicitly labeled. Assessment covers all resolved Maven scopes; not build-plugin or OS dependencies.

### CVE-2026-40973: Spring Boot accepts predictable temp directory without ownership verification
- **Category:** CVE
- **Severity:** mandatory
- **Story points:** 1
- **Files:** pom.xml:98

[CVE-2026-40973](https://github.com/advisories/GHSA-wwpq-f5c3-7hvx)

Severity: HIGH

Affected dependencies (each range independently reconciled against the resolved version):
- org.springframework.boot:spring-boot:3.5.0 (compile; transitive via spring-boot-devtools; pom.xml:98); confirmed affected range: >= 3.5.0, < 3.5.14. Recommended fix: upgrade to 3.5.14 or a later supported patched release.

Dependency presence is confirmed; exploitability depends on advisory-specific runtime configuration. Test-only dependencies are explicitly labeled. Assessment covers all resolved Maven scopes; not build-plugin or OS dependencies.

### CVE-2026-40972: Spring Boot DevTools remote secret comparison is vulnerable to timing attacks
- **Category:** CVE
- **Severity:** mandatory
- **Story points:** 1
- **Files:** pom.xml:98

[CVE-2026-40972](https://github.com/advisories/GHSA-56v8-86gj-66jp)

Severity: HIGH

Affected dependencies (each range independently reconciled against the resolved version):
- org.springframework.boot:spring-boot-devtools:3.5.0 (compile; direct; pom.xml:98); confirmed affected range: >= 3.5.0, < 3.5.14. Recommended fix: upgrade to 3.5.14 or a later supported patched release.

Dependency presence is confirmed; exploitability depends on advisory-specific runtime configuration. Test-only dependencies are explicitly labeled. Assessment covers all resolved Maven scopes; not build-plugin or OS dependencies.

### CVE-2025-41249: Spring Framework annotation detection mechanism may result in improper authorization
- **Category:** CVE
- **Severity:** mandatory
- **Story points:** 1
- **Files:** pom.xml:84

[CVE-2025-41249](https://github.com/advisories/GHSA-jmp9-x22r-554x)

Severity: HIGH

Affected dependencies (each range independently reconciled against the resolved version):
- org.springframework:spring-core:6.2.7 (compile; transitive via spring-boot-starter-test; pom.xml:84); confirmed affected range: >= 6.2.0, <= 6.2.10. Recommended fix: upgrade to 6.2.11 or a later supported patched release.

Dependency presence is confirmed; exploitability depends on advisory-specific runtime configuration. Test-only dependencies are explicitly labeled. Assessment covers all resolved Maven scopes; not build-plugin or OS dependencies.

## CWE findings (code-level vulnerabilities)

### CWE-789: Memory Allocation with Excessive Size Value
- **Category:** Code Quality
- **Severity:** potential
- **Story points:** 5
- **Files:** src/main/java/com/photoalbum/controller/HomeController.java:38-44, src/main/java/com/photoalbum/service/impl/PhotoServiceImpl.java:53-56, src/main/java/com/photoalbum/repository/PhotoRepository.java:23-29, src/main/java/com/photoalbum/model/Photo.java:39-41, Dockerfile:28

Anonymous GET / calls getAllPhotos and a native query selecting every row including photo_data into List<Photo>. The byte[] LOB has default eager fetching and the query has neither pagination nor total-byte limit. Uploaded BLOB count and aggregate size are not bounded; an uploader can grow stored content and any public gallery request materializes that aggregate in the JVM heap (container default maximum 512 MB), permitting excessive allocation and denial of service. Per-file 10 MB and per-request 50 MB upload limits do not bound accumulated gallery allocation.

### CWE-778: Insufficient Logging
- **Category:** Credentials & Secrets
- **Severity:** potential
- **Story points:** 3
- **Files:** src/main/java/com/photoalbum/controller/DetailController.java:64-75, src/main/java/com/photoalbum/service/impl/PhotoServiceImpl.java:171-179, src/main/java/com/photoalbum/config/SecurityConfig.java:45-59

Security-critical photo upload and deletion logs record file/record identifiers and outcomes but omit authenticated principal and request source/correlation information. DetailController.deletePhoto and PhotoServiceImpl.uploadPhoto have no principal/request audit context; SecurityConfig configures HTTP Basic without an application audit handler or authentication-event log listener. Existing mutation logs cannot identify the requesting actor/source for investigation. This is insufficient audit context, not a claim that all application logging is absent; infrastructure access/audit logging was not supplied.

### CWE-434: Unrestricted Upload of File with Dangerous Type
- **Category:** File & Path Security
- **Severity:** mandatory
- **Story points:** 8
- **Files:** src/main/java/com/photoalbum/service/impl/PhotoServiceImpl.java:85-159, src/main/java/com/photoalbum/controller/PhotoFileController.java:74-83

PhotoServiceImpl.uploadPhoto trusts caller-supplied Content-Type. If ImageIO finds no reader, the code still stores original arbitrary bytes as a photo; a non-IOException decoder failure is also ignored. An authenticated uploader can submit non-image or polyglot content labeled image/png and it is persisted and publicly returned by servePhoto. No content/declared-type consistency check is enforced. This confirms upload-type validation bypass, not server-side script execution; browser execution is not established (Spring Security supplies nosniff).

### CWE-79: Improper Neutralization of Input During Web Page Generation ('Cross-site Scripting')
- **Category:** Injection Attacks
- **Severity:** optional
- **Story points:** 8
- **Files:** src/main/resources/static/js/upload.js:155-189, src/main/resources/static/js/upload.js:215-218, src/main/java/com/photoalbum/controller/HomeController.java:75-89

createPhotoCard interpolates originalFileName from upload JSON without HTML or attribute escaping into img alt, title and element content, and displayNewPhotos passes the resulting markup to insertAdjacentHTML. showErrors likewise interpolates user-controlled local or returned filenames into innerHTML. A crafted filename containing markup or an attribute breakout is interpreted as DOM content in the uploading browser. Normal server-rendered Thymeleaf views use escaped th:text; persistent execution on another viewer is not established.
