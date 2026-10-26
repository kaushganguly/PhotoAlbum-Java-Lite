# Security Assessment Report

**Generated:** 2026-10-26T18:13:31.836992Z

## Scope and limitations

- 104 resolved Maven dependencies (11 direct), including compile, runtime, and test scopes.
- Advisory source: GitHub Global Security Advisories API; all lookup batches succeeded.
- Minimum CVE severity: **medium**. Of 85 version-range matches, 11 low-severity matches are excluded from the merged report.
- All 59 CWE checklist rules were reviewed sequentially across six categories.
- Findings are static-analysis results and version-range matches, not verified exploits. NOT_FOUND does not prove absence. See each finding for deployment and interaction prerequisites.
- No application changes, dynamic exploit testing, or production deployment validation were performed.

## Summary

| Metric | Count |
| --- | --- |
| TotalFindings | 80 |
| CveCount | 74 |
| CweCount | 6 |
| TotalRulesAssessed | 59 |
| RulesPassed | 53 |

### By Severity

| Severity | Count |
| --- | --- |
| mandatory | 44 |
| optional | 33 |
| potential | 3 |

## CVE Findings (Dependency Vulnerabilities)

### CVE-2026-47890: Spring Framework Server Sent Event stream corruption while rendering fragments
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2026-47890](https://github.com/advisories/GHSA-j9f9-w8pj-32f8)

Severity: CRITICAL

Affected dependencies:
- org.springframework:spring-webmvc:6.2.7 (compile; transitive via spring-boot-starter-web, declared at pom.xml:34); affected range >= 6.2.0, <= 6.2.19; recommended fix: select an unaffected supported release; advisory lists no patch for this branch

Version-based advisory match, not proof that exploit prerequisites are enabled in this application.

### CVE-2026-47884: Spring Framework Improper Path Limitation in XsltView
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2026-47884](https://github.com/advisories/GHSA-pc63-qcmh-9cmg)

Severity: CRITICAL

Affected dependencies:
- org.springframework:spring-webmvc:6.2.7 (compile; transitive via spring-boot-starter-web, declared at pom.xml:34); affected range >= 6.2.0, <= 6.2.19; recommended fix: select an unaffected supported release; advisory lists no patch for this branch

Version-based advisory match, not proof that exploit prerequisites are enabled in this application.

### CVE-2026-65905: Apache Tomcat's DIGEST authenticator has an Authentication Bypass by Capture-replay vulnerability
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2026-65905](https://github.com/advisories/GHSA-9xv2-5v5q-p794)

Severity: CRITICAL

Affected dependencies:
- org.apache.tomcat.embed:tomcat-embed-core:10.1.41 (compile; transitive via spring-boot-starter-web, declared at pom.xml:34); affected range >= 10.1.0-M1, < 10.1.58; recommended fix: upgrade to 10.1.58 or an unaffected supported release

Version-based advisory match, not proof that exploit prerequisites are enabled in this application.

### CVE-2026-65182: Apache Tomcat has an Improper Access Control, Incorrect Authorization vulnerability
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2026-65182](https://github.com/advisories/GHSA-gcx9-497g-6cp6)

Severity: CRITICAL

Affected dependencies:
- org.apache.tomcat.embed:tomcat-embed-core:10.1.41 (compile; transitive via spring-boot-starter-web, declared at pom.xml:34); affected range >= 10.1.0-M1, < 10.1.58; recommended fix: upgrade to 10.1.58 or an unaffected supported release

Version-based advisory match, not proof that exploit prerequisites are enabled in this application.

### CVE-2026-68525: Apache Tomcat's FORM authentication process has an Incorrect Authorization vulnerability
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2026-68525](https://github.com/advisories/GHSA-h3x4-894j-xpx5)

Severity: CRITICAL

Affected dependencies:
- org.apache.tomcat.embed:tomcat-embed-core:10.1.41 (compile; transitive via spring-boot-starter-web, declared at pom.xml:34); affected range >= 10.1.0-M1, < 10.1.58; recommended fix: upgrade to 10.1.58 or an unaffected supported release

Version-based advisory match, not proof that exploit prerequisites are enabled in this application.

### CVE-2026-49844: Apache Log4j API: Improper encoding of non-finite floating-point values during MapMessage JSON serialization
- **Category:** CVE
- **Severity:** optional
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2026-49844](https://github.com/advisories/GHSA-qv9r-c865-cp47)

Severity: MEDIUM

Affected dependencies:
- org.apache.logging.log4j:log4j-api:2.24.3 (compile; transitive via spring-boot-starter-web, declared at pom.xml:34); affected range >= 2.13.1, < 2.25.5; recommended fix: upgrade to 2.25.5 or an unaffected supported release

Version-based advisory match, not proof that exploit prerequisites are enabled in this application.

### CVE-2026-41854: Spring Framework Server-Side Request Forgery via UriComponentsBuilder
- **Category:** CVE
- **Severity:** optional
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2026-41854](https://github.com/advisories/GHSA-7m2p-62gw-p8qq)

Severity: MEDIUM

Affected dependencies:
- org.springframework:spring-web:6.2.7 (compile; transitive via spring-boot-starter-web, declared at pom.xml:34); affected range >= 6.2.0, <= 6.2.18; recommended fix: upgrade to 6.2.19 or an unaffected supported release

Version-based advisory match, not proof that exploit prerequisites are enabled in this application.

### CVE-2026-41853: Spring Framework Multipart Request Smuggling in Spring MVC and WebFlux
- **Category:** CVE
- **Severity:** optional
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2026-41853](https://github.com/advisories/GHSA-cjpg-rgq5-fr37)

Severity: MEDIUM

Affected dependencies:
- org.springframework:spring-webmvc:6.2.7 (compile; transitive via spring-boot-starter-web, declared at pom.xml:34); affected range >= 6.2.0, <= 6.2.18; recommended fix: upgrade to 6.2.19 or an unaffected supported release

Version-based advisory match, not proof that exploit prerequisites are enabled in this application.

### CVE-2026-41851: Spring Framework Denial of Service via Unbounded Cache in SpEL
- **Category:** CVE
- **Severity:** optional
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2026-41851](https://github.com/advisories/GHSA-wxpp-56q6-5pcg)

Severity: MEDIUM

Affected dependencies:
- org.springframework:spring-expression:6.2.7 (compile; transitive via spring-boot-starter-web, declared at pom.xml:34); affected range >= 6.2.0, <= 6.2.18; recommended fix: upgrade to 6.2.19 or an unaffected supported release

Version-based advisory match, not proof that exploit prerequisites are enabled in this application.

### CVE-2026-41850: Spring Framework Algorithmic Denial of Service via SpEL Expressions
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2026-41850](https://github.com/advisories/GHSA-r5w3-xv2f-j59q)

Severity: HIGH

Affected dependencies:
- org.springframework:spring-expression:6.2.7 (compile; transitive via spring-boot-starter-web, declared at pom.xml:34); affected range >= 6.2.0, <= 6.2.18; recommended fix: upgrade to 6.2.19 or an unaffected supported release

Version-based advisory match, not proof that exploit prerequisites are enabled in this application.

### CVE-2026-41846: Spring Framework Cross-site Scripting via JSP Form Tags
- **Category:** CVE
- **Severity:** optional
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2026-41846](https://github.com/advisories/GHSA-957g-f97v-vppc)

Severity: MEDIUM

Affected dependencies:
- org.springframework:spring-webmvc:6.2.7 (compile; transitive via spring-boot-starter-web, declared at pom.xml:34); affected range >= 6.2.0, <= 6.2.18; recommended fix: upgrade to 6.2.19 or an unaffected supported release

Version-based advisory match, not proof that exploit prerequisites are enabled in this application.

### CVE-2026-41843: Spring Framework Path Traversal via Versioned Static Resources in Spring MVC and WebFlux
- **Category:** CVE
- **Severity:** optional
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2026-41843](https://github.com/advisories/GHSA-72pg-x5f8-j25j)

Severity: MEDIUM

Affected dependencies:
- org.springframework:spring-webmvc:6.2.7 (compile; transitive via spring-boot-starter-web, declared at pom.xml:34); affected range >= 6.2.0, <= 6.2.18; recommended fix: upgrade to 6.2.19 or an unaffected supported release

Version-based advisory match, not proof that exploit prerequisites are enabled in this application.

### CVE-2026-41844: Spring Framework Open Redirect in Spring MVC and WebFlux
- **Category:** CVE
- **Severity:** optional
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2026-41844](https://github.com/advisories/GHSA-h3qp-gqrc-q736)

Severity: MEDIUM

Affected dependencies:
- org.springframework:spring-webmvc:6.2.7 (compile; transitive via spring-boot-starter-web, declared at pom.xml:34); affected range >= 6.2.0, <= 6.2.18; recommended fix: upgrade to 6.2.19 or an unaffected supported release

Version-based advisory match, not proof that exploit prerequisites are enabled in this application.

### CVE-2026-41845: Spring Framework Cross-site Scripting via JavaScriptUtils
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2026-41845](https://github.com/advisories/GHSA-3chg-m5w7-qfv5)

Severity: HIGH

Affected dependencies:
- org.springframework:spring-webmvc:6.2.7 (compile; transitive via spring-boot-starter-web, declared at pom.xml:34); affected range >= 6.2.0, <= 6.2.18; recommended fix: upgrade to 6.2.19 or an unaffected supported release

Version-based advisory match, not proof that exploit prerequisites are enabled in this application.

### CVE-2026-41841: Spring Framework Information Disclosure via Static Resource Cache in Spring MVC and WebFlux
- **Category:** CVE
- **Severity:** optional
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2026-41841](https://github.com/advisories/GHSA-mq64-j8f9-9gcj)

Severity: MEDIUM

Affected dependencies:
- org.springframework:spring-webmvc:6.2.7 (compile; transitive via spring-boot-starter-web, declared at pom.xml:34); affected range >= 6.2.0, <= 6.2.18; recommended fix: upgrade to 6.2.19 or an unaffected supported release

Version-based advisory match, not proof that exploit prerequisites are enabled in this application.

### CVE-2026-41842: Spring Framework Denial of Service via Versioned Resources in Spring MVC and WebFlux
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2026-41842](https://github.com/advisories/GHSA-x23c-287f-qqv5)

Severity: HIGH

Affected dependencies:
- org.springframework:spring-webmvc:6.2.7 (compile; transitive via spring-boot-starter-web, declared at pom.xml:34); affected range >= 6.2.0, <= 6.2.18; recommended fix: upgrade to 6.2.19 or an unaffected supported release

Version-based advisory match, not proof that exploit prerequisites are enabled in this application.

### CVE-2026-41284: Apache Tomcat: Unbounded read in WebDAV LOCK and  PROPFIND handling
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2026-41284](https://github.com/advisories/GHSA-gx5v-xp9w-j4cg)

Severity: HIGH

Affected dependencies:
- org.apache.tomcat.embed:tomcat-embed-core:10.1.41 (compile; transitive via spring-boot-starter-web, declared at pom.xml:34); affected range >= 10.1.0-M1, < 10.1.55; recommended fix: upgrade to 10.1.55 or an unaffected supported release

Version-based advisory match, not proof that exploit prerequisites are enabled in this application.

### CVE-2026-43512: Apache Tomcat - Digest authenticator will authenticate any unknown user
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2026-43512](https://github.com/advisories/GHSA-h6fc-48rj-7qqh)

Severity: CRITICAL

Affected dependencies:
- org.apache.tomcat.embed:tomcat-embed-core:10.1.41 (compile; transitive via spring-boot-starter-web, declared at pom.xml:34); affected range >= 10.1.0-M1, < 10.1.55; recommended fix: upgrade to 10.1.55 or an unaffected supported release

Version-based advisory match, not proof that exploit prerequisites are enabled in this application.

### CVE-2026-43513: Apache Tomcat: LockOutRealm treats user names as case-sensitive
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2026-43513](https://github.com/advisories/GHSA-5mp6-jrq3-r938)

Severity: HIGH

Affected dependencies:
- org.apache.tomcat.embed:tomcat-embed-core:10.1.41 (compile; transitive via spring-boot-starter-web, declared at pom.xml:34); affected range >= 10.1.0-M1, < 10.1.55; recommended fix: upgrade to 10.1.55 or an unaffected supported release

Version-based advisory match, not proof that exploit prerequisites are enabled in this application.

### CVE-2026-43515: Apache Tomcat - Security constraints not correctly applied
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2026-43515](https://github.com/advisories/GHSA-5m62-pw8w-7w9f)

Severity: CRITICAL

Affected dependencies:
- org.apache.tomcat.embed:tomcat-embed-core:10.1.41 (compile; transitive via spring-boot-starter-web, declared at pom.xml:34); affected range >= 10.1.0-M1, < 10.1.55; recommended fix: upgrade to 10.1.55 or an unaffected supported release

Version-based advisory match, not proof that exploit prerequisites are enabled in this application.

### CVE-2026-41293: Apache Tomcat - HTTP/2 request headers not validated
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2026-41293](https://github.com/advisories/GHSA-r29c-68gh-xp6x)

Severity: CRITICAL

Affected dependencies:
- org.apache.tomcat.embed:tomcat-embed-core:10.1.41 (compile; transitive via spring-boot-starter-web, declared at pom.xml:34); affected range >= 10.1.0-M1, < 10.1.55; recommended fix: upgrade to 10.1.55 or an unaffected supported release

Version-based advisory match, not proof that exploit prerequisites are enabled in this application.

### CVE-2026-42498: Apache Tomcat - WebSocket authentication header exposure
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2026-42498](https://github.com/advisories/GHSA-fv25-8xcx-gqjc)

Severity: HIGH

Affected dependencies:
- org.apache.tomcat.embed:tomcat-embed-core:10.1.41 (compile; transitive via spring-boot-starter-web, declared at pom.xml:34); affected range >= 10.1.0-M1, < 10.1.55; recommended fix: upgrade to 10.1.55 or an unaffected supported release

Version-based advisory match, not proof that exploit prerequisites are enabled in this application.

### CVE-2026-41901: Sandboxed Thymeleaf expressions vulnerable to improper recognition of unauthorized syntax patterns
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:40

[CVE-2026-41901](https://github.com/advisories/GHSA-c9ph-gxww-7744)

Severity: CRITICAL

Affected dependencies:
- org.thymeleaf:thymeleaf:3.1.3.RELEASE (compile; transitive via spring-boot-starter-thymeleaf, declared at pom.xml:40); affected range <= 3.1.4.RELEASE; recommended fix: upgrade to 3.1.5.RELEASE or an unaffected supported release
- org.thymeleaf:thymeleaf-spring6:3.1.3.RELEASE (compile; transitive via spring-boot-starter-thymeleaf, declared at pom.xml:40); affected range <= 3.1.4.RELEASE; recommended fix: upgrade to 3.1.5.RELEASE or an unaffected supported release

Version-based advisory match, not proof that exploit prerequisites are enabled in this application.

### CVE-2026-22745: Spring MVC and WebFlux applications are vulnerable to Denial of Service attacks when resolving static resources
- **Category:** CVE
- **Severity:** optional
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2026-22745](https://github.com/advisories/GHSA-6p4f-wcwh-5vvm)

Severity: MEDIUM

Affected dependencies:
- org.springframework:spring-webmvc:6.2.7 (compile; transitive via spring-boot-starter-web, declared at pom.xml:34); affected range >= 6.2.0, <= 6.2.17; recommended fix: upgrade to 6.2.18 or an unaffected supported release

Version-based advisory match, not proof that exploit prerequisites are enabled in this application.

### CVE-2026-40478: Improper neutralization of specific syntax patterns for unauthorized expressions in Thymeleaf
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:40

[CVE-2026-40478](https://github.com/advisories/GHSA-xjw8-8c5c-9r79)

Severity: CRITICAL

Affected dependencies:
- org.thymeleaf:thymeleaf:3.1.3.RELEASE (compile; transitive via spring-boot-starter-thymeleaf, declared at pom.xml:40); affected range <= 3.1.3.RELEASE; recommended fix: upgrade to 3.1.4.RELEASE or an unaffected supported release
- org.thymeleaf:thymeleaf-spring6:3.1.3.RELEASE (compile; transitive via spring-boot-starter-thymeleaf, declared at pom.xml:40); affected range <= 3.1.3.RELEASE; recommended fix: upgrade to 3.1.4.RELEASE or an unaffected supported release

Version-based advisory match, not proof that exploit prerequisites are enabled in this application.

### CVE-2026-40477: Improper restriction of the scope of accessible objects in Thymeleaf expressions
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:40

[CVE-2026-40477](https://github.com/advisories/GHSA-r4v4-5mwr-2fwr)

Severity: CRITICAL

Affected dependencies:
- org.thymeleaf:thymeleaf:3.1.3.RELEASE (compile; transitive via spring-boot-starter-thymeleaf, declared at pom.xml:40); affected range <= 3.1.3.RELEASE; recommended fix: upgrade to 3.1.4.RELEASE or an unaffected supported release
- org.thymeleaf:thymeleaf-spring6:3.1.3.RELEASE (compile; transitive via spring-boot-starter-thymeleaf, declared at pom.xml:40); affected range <= 3.1.3.RELEASE; recommended fix: upgrade to 3.1.4.RELEASE or an unaffected supported release

Version-based advisory match, not proof that exploit prerequisites are enabled in this application.

### CVE-2026-34483: Apache Tomcat has an Improper Encoding or Escaping of Output vulnerability in the JsonAccessLogValve
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2026-34483](https://github.com/advisories/GHSA-rv64-5gf8-9qq8)

Severity: HIGH

Affected dependencies:
- org.apache.tomcat.embed:tomcat-embed-core:10.1.41 (compile; transitive via spring-boot-starter-web, declared at pom.xml:34); affected range >= 10.1.0-M1, < 10.1.54; recommended fix: upgrade to 10.1.54 or an unaffected supported release

Version-based advisory match, not proof that exploit prerequisites are enabled in this application.

### CVE-2026-34487: Apache Tomcat vulnerable to Insertion of Sensitive Information into Log File
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2026-34487](https://github.com/advisories/GHSA-x4m4-345f-5h5g)

Severity: HIGH

Affected dependencies:
- org.apache.tomcat.embed:tomcat-embed-core:10.1.41 (compile; transitive via spring-boot-starter-web, declared at pom.xml:34); affected range >= 10.1.0-M1, < 10.1.54; recommended fix: upgrade to 10.1.54 or an unaffected supported release

Version-based advisory match, not proof that exploit prerequisites are enabled in this application.

### CVE-2026-25854: Apache Tomcat has an Open Redirect vulnerability
- **Category:** CVE
- **Severity:** optional
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2026-25854](https://github.com/advisories/GHSA-9m3c-qcxr-9x87)

Severity: MEDIUM

Affected dependencies:
- org.apache.tomcat.embed:tomcat-embed-core:10.1.41 (compile; transitive via spring-boot-starter-web, declared at pom.xml:34); affected range >= 10.1.0-M1, < 10.1.53; recommended fix: upgrade to 10.1.53 or an unaffected supported release

Version-based advisory match, not proof that exploit prerequisites are enabled in this application.

### CVE-2026-24880: Apache Tomcat has an HTTP Request/Response Smuggling vulnerability
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2026-24880](https://github.com/advisories/GHSA-563x-q5rq-57qp)

Severity: HIGH

Affected dependencies:
- org.apache.tomcat.embed:tomcat-embed-core:10.1.41 (compile; transitive via spring-boot-starter-web, declared at pom.xml:34); affected range >= 10.1.0-M1, < 10.1.52; recommended fix: upgrade to 10.1.52 or an unaffected supported release

Version-based advisory match, not proof that exploit prerequisites are enabled in this application.

### CVE-2026-22737: Spring Framework Improper Path Limitation with Script View Templates
- **Category:** CVE
- **Severity:** optional
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2026-22737](https://github.com/advisories/GHSA-4773-3jfm-qmx3)

Severity: MEDIUM

Affected dependencies:
- org.springframework:spring-webmvc:6.2.7 (compile; transitive via spring-boot-starter-web, declared at pom.xml:34); affected range >= 6.2.0, < 6.2.17; recommended fix: upgrade to 6.2.17 or an unaffected supported release

Version-based advisory match, not proof that exploit prerequisites are enabled in this application.

### CVE-2026-24734: Apache Tomcat has an Improper Input Validation vulnerability
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2026-24734](https://github.com/advisories/GHSA-mgp5-rv84-w37q)

Severity: HIGH

Affected dependencies:
- org.apache.tomcat.embed:tomcat-embed-core:10.1.41 (compile; transitive via spring-boot-starter-web, declared at pom.xml:34); affected range >= 10.1.0-M7, < 10.1.52; recommended fix: upgrade to 10.1.52 or an unaffected supported release

Version-based advisory match, not proof that exploit prerequisites are enabled in this application.

### CVE-2025-66614: Apache Tomcat - Client certificate verification bypass
- **Category:** CVE
- **Severity:** optional
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2025-66614](https://github.com/advisories/GHSA-fpj8-gq4v-p354)

Severity: MEDIUM

Affected dependencies:
- org.apache.tomcat.embed:tomcat-embed-core:10.1.41 (compile; transitive via spring-boot-starter-web, declared at pom.xml:34); affected range >= 10.1.0-M1, < 10.1.50; recommended fix: upgrade to 10.1.50 or an unaffected supported release

Version-based advisory match, not proof that exploit prerequisites are enabled in this application.

### CVE-2025-55752: Apache Tomcat Vulnerable to Relative Path Traversal
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2025-55752](https://github.com/advisories/GHSA-wmwf-9ccg-fff5)

Severity: HIGH

Affected dependencies:
- org.apache.tomcat.embed:tomcat-embed-core:10.1.41 (compile; transitive via spring-boot-starter-web, declared at pom.xml:34); affected range >= 10.1.0-M1, < 10.1.45; recommended fix: upgrade to 10.1.45 or an unaffected supported release

Version-based advisory match, not proof that exploit prerequisites are enabled in this application.

### CVE-2025-11226: QOS.CH logback-core is vulnerable to Arbitrary Code Execution through file processing
- **Category:** CVE
- **Severity:** optional
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2025-11226](https://github.com/advisories/GHSA-25qh-j22f-pwp8)

Severity: MEDIUM

Affected dependencies:
- ch.qos.logback:logback-core:1.5.18 (compile; transitive via spring-boot-starter-web, declared at pom.xml:34); affected range >= 1.4.0, < 1.5.19; recommended fix: upgrade to 1.5.19 or an unaffected supported release

Version-based advisory match, not proof that exploit prerequisites are enabled in this application.

### CVE-2025-41242: Spring Framework MVC Applications Path Traversal Vulnerability
- **Category:** CVE
- **Severity:** optional
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2025-41242](https://github.com/advisories/GHSA-r936-gwx5-v52f)

Severity: MEDIUM

Affected dependencies:
- org.springframework:spring-webmvc:6.2.7 (compile; transitive via spring-boot-starter-web, declared at pom.xml:34); affected range >= 6.2.0, < 6.2.10; recommended fix: upgrade to 6.2.10 or an unaffected supported release

Version-based advisory match, not proof that exploit prerequisites are enabled in this application.

### CVE-2025-48989: Apache Tomcat Improper Resource Shutdown or Release vulnerability
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2025-48989](https://github.com/advisories/GHSA-gqp3-2cvr-x8m3)

Severity: HIGH

Affected dependencies:
- org.apache.tomcat.embed:tomcat-embed-core:10.1.41 (compile; transitive via spring-boot-starter-web, declared at pom.xml:34); affected range >= 10.1.0-M1, < 10.1.44; recommended fix: upgrade to 10.1.44 or an unaffected supported release

Version-based advisory match, not proof that exploit prerequisites are enabled in this application.

### CVE-2025-55668: Apache Tomcat Session Fixation vulnerability
- **Category:** CVE
- **Severity:** optional
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2025-55668](https://github.com/advisories/GHSA-23hv-mwm6-g8jf)

Severity: MEDIUM

Affected dependencies:
- org.apache.tomcat.embed:tomcat-embed-core:10.1.41 (compile; transitive via spring-boot-starter-web, declared at pom.xml:34); affected range >= 10.1.0-M1, < 10.1.42; recommended fix: upgrade to 10.1.42 or an unaffected supported release

Version-based advisory match, not proof that exploit prerequisites are enabled in this application.

### CVE-2025-53506: Apache Tomcat Coyote vulnerable to Denial of Service via excessive HTTP/2 streams
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2025-53506](https://github.com/advisories/GHSA-25xr-qj8w-c4vf)

Severity: HIGH

Affected dependencies:
- org.apache.tomcat.embed:tomcat-embed-core:10.1.41 (compile; transitive via spring-boot-starter-web, declared at pom.xml:34); affected range >= 10.1.0-M1, < 10.1.43; recommended fix: upgrade to 10.1.43 or an unaffected supported release

Version-based advisory match, not proof that exploit prerequisites are enabled in this application.

### CVE-2025-52520: Apache Tomcat Catalina is vulnerable to DoS attack through bypassing of size limits
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2025-52520](https://github.com/advisories/GHSA-wr62-c79q-cv37)

Severity: HIGH

Affected dependencies:
- org.apache.tomcat.embed:tomcat-embed-core:10.1.41 (compile; transitive via spring-boot-starter-web, declared at pom.xml:34); affected range >= 10.1.0-M1, < 10.1.43; recommended fix: upgrade to 10.1.43 or an unaffected supported release

Version-based advisory match, not proof that exploit prerequisites are enabled in this application.

### CVE-2025-49124: Apache Tomcat installer for Windows has an untrusted search path vulnerability
- **Category:** CVE
- **Severity:** optional
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2025-49124](https://github.com/advisories/GHSA-42wg-hm62-jcwg)

Severity: MEDIUM

Affected dependencies:
- org.apache.tomcat.embed:tomcat-embed-core:10.1.41 (compile; transitive via spring-boot-starter-web, declared at pom.xml:34); affected range >= 10.1.0, < 10.1.42; recommended fix: upgrade to 10.1.42 or an unaffected supported release

Version-based advisory match, not proof that exploit prerequisites are enabled in this application.

### CVE-2025-49125: Apache Tomcat - Security constraint bypass for pre/post-resources
- **Category:** CVE
- **Severity:** optional
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2025-49125](https://github.com/advisories/GHSA-wc4r-xq3c-5cf3)

Severity: MEDIUM

Affected dependencies:
- org.apache.tomcat.embed:tomcat-embed-core:10.1.41 (compile; transitive via spring-boot-starter-web, declared at pom.xml:34); affected range >= 10.1.0-M1, <= 10.1.41; recommended fix: upgrade to 10.1.42 or an unaffected supported release

Version-based advisory match, not proof that exploit prerequisites are enabled in this application.

### CVE-2025-48988: Apache Tomcat - DoS in multipart upload
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2025-48988](https://github.com/advisories/GHSA-h3gc-qfqq-6h8f)

Severity: HIGH

Affected dependencies:
- org.apache.tomcat.embed:tomcat-embed-core:10.1.41 (compile; transitive via spring-boot-starter-web, declared at pom.xml:34); affected range >= 10.1.0-M1, <= 10.1.41; recommended fix: upgrade to 10.1.42 or an unaffected supported release

Version-based advisory match, not proof that exploit prerequisites are enabled in this application.

### CVE-2025-41234: Spring Framework vulnerable to a reflected file download (RFD)
- **Category:** CVE
- **Severity:** optional
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2025-41234](https://github.com/advisories/GHSA-6r3c-xf4w-jxjm)

Severity: MEDIUM

Affected dependencies:
- org.springframework:spring-web:6.2.7 (compile; transitive via spring-boot-starter-web, declared at pom.xml:34); affected range >= 6.2.0, < 6.2.8; recommended fix: upgrade to 6.2.8 or an unaffected supported release

Version-based advisory match, not proof that exploit prerequisites are enabled in this application.

### CVE-2026-41695: Spring Data: Unbounded property-path cache keyed by externally-supplied path string
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:46

[CVE-2026-41695](https://github.com/advisories/GHSA-88fw-v6x4-3f58)

Severity: HIGH

Affected dependencies:
- org.springframework.data:spring-data-commons:3.5.0 (compile; transitive via spring-boot-starter-data-jpa, declared at pom.xml:46); affected range >= 3.5.0, <= 3.5.11; recommended fix: upgrade to 3.5.12 or an unaffected supported release

Version-based advisory match, not proof that exploit prerequisites are enabled in this application.

### CVE-2026-41721: Spring Data Commons: Denial of Service via excessive memory allocation in projection binding
- **Category:** CVE
- **Severity:** optional
- **Story Points:** 1
- **Files:** pom.xml:46

[CVE-2026-41721](https://github.com/advisories/GHSA-5m4m-73w9-8433)

Severity: MEDIUM

Affected dependencies:
- org.springframework.data:spring-data-commons:3.5.0 (compile; transitive via spring-boot-starter-data-jpa, declared at pom.xml:46); affected range >= 3.5.0, <= 3.5.11; recommended fix: upgrade to 3.5.12 or an unaffected supported release

Version-based advisory match, not proof that exploit prerequisites are enabled in this application.

### CVE-2026-41711: Spring Data Commons: StackOverflowException when parsing Sort parameters (DoS)
- **Category:** CVE
- **Severity:** optional
- **Story Points:** 1
- **Files:** pom.xml:46

[CVE-2026-41711](https://github.com/advisories/GHSA-5vpf-xvv7-c8vh)

Severity: MEDIUM

Affected dependencies:
- org.springframework.data:spring-data-commons:3.5.0 (compile; transitive via spring-boot-starter-data-jpa, declared at pom.xml:46); affected range >= 3.5.0, <= 3.5.11; recommended fix: upgrade to 3.5.12 or an unaffected supported release

Version-based advisory match, not proof that exploit prerequisites are enabled in this application.

### CVE-2026-41716: Spring Data Commons: Heap exhaustion from unbounded property-lookup cache retaining crafted string keys
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:46

[CVE-2026-41716](https://github.com/advisories/GHSA-9fw2-h3hf-293r)

Severity: HIGH

Affected dependencies:
- org.springframework.data:spring-data-commons:3.5.0 (compile; transitive via spring-boot-starter-data-jpa, declared at pom.xml:46); affected range >= 3.5.0, <= 3.5.11; recommended fix: upgrade to 3.5.12 or an unaffected supported release

Version-based advisory match, not proof that exploit prerequisites are enabled in this application.

### CVE-2026-22751: Spring Security Core has a TOCTOU race condition when One-Time Token login with JdbcOneTimeTokenService is configured
- **Category:** CVE
- **Severity:** optional
- **Story Points:** 1
- **Files:** pom.xml:65

[CVE-2026-22751](https://github.com/advisories/GHSA-x2wq-9x2f-fhj7)

Severity: MEDIUM

Affected dependencies:
- org.springframework.security:spring-security-core:6.5.0 (compile; transitive via spring-boot-starter-security, declared at pom.xml:65); affected range >= 6.5.0, < 6.5.10; recommended fix: upgrade to 6.5.10 or an unaffected supported release

Version-based advisory match, not proof that exploit prerequisites are enabled in this application.

### CVE-2025-41248: Spring Security annotation detection mechanism has authorization bypass
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:65

[CVE-2025-41248](https://github.com/advisories/GHSA-8v5q-rhf3-jphm)

Severity: HIGH

Affected dependencies:
- org.springframework.security:spring-security-core:6.5.0 (compile; transitive via spring-boot-starter-security, declared at pom.xml:65); affected range >= 6.5.0, < 6.5.4; recommended fix: upgrade to 6.5.4 or an unaffected supported release

Version-based advisory match, not proof that exploit prerequisites are enabled in this application.

### CVE-2026-89425: jackson-core: UTF8DataInputJsonParser._reportInvalidToken() missing maxErrorTokenLength limit -> unbounded StringBuilder growth (DoS)
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:78

[CVE-2026-89425](https://github.com/advisories/GHSA-7hhh-6rmp-j9qf)

Severity: HIGH

Affected dependencies:
- com.fasterxml.jackson.core:jackson-core:2.19.0 (compile; transitive via spring-boot-starter-json, declared at pom.xml:78); affected range >= 2.19.0, <= 2.21.6; recommended fix: upgrade to 2.21.7 or an unaffected supported release

Version-based advisory match, not proof that exploit prerequisites are enabled in this application.

### CVE-2026-89407:  jackson-core: ReDoS: quadratic backtracking in NumberInput.PATTERN_FLOAT via looksLikeValidNumber()
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:78

[CVE-2026-89407](https://github.com/advisories/GHSA-p6pp-m3f8-5c89)

Severity: HIGH

Affected dependencies:
- com.fasterxml.jackson.core:jackson-core:2.19.0 (compile; transitive via spring-boot-starter-json, declared at pom.xml:78); affected range >= 2.19.0, <= 2.21.6; recommended fix: upgrade to 2.21.7 or an unaffected supported release

Version-based advisory match, not proof that exploit prerequisites are enabled in this application.

### CVE-2026-91777: jackson-databind quadratic forward-reference completion
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:78

[CVE-2026-91777](https://github.com/advisories/GHSA-cxp5-3px4-pw24)

Severity: HIGH

Affected dependencies:
- com.fasterxml.jackson.core:jackson-databind:2.19.0 (compile; transitive via spring-boot-starter-json, declared at pom.xml:78); affected range >= 2.19.0, <= 2.21.6; recommended fix: upgrade to 2.21.7 or an unaffected supported release

Version-based advisory match, not proof that exploit prerequisites are enabled in this application.

### CVE-2026-91776: jackson-databind retains every unknown raw type ID
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:78

[CVE-2026-91776](https://github.com/advisories/GHSA-wv8q-qhhj-9h54)

Severity: HIGH

Affected dependencies:
- com.fasterxml.jackson.core:jackson-databind:2.19.0 (compile; transitive via spring-boot-starter-json, declared at pom.xml:78); affected range >= 2.19.0, <= 2.21.6; recommended fix: upgrade to 2.21.7 or an unaffected supported release

Version-based advisory match, not proof that exploit prerequisites are enabled in this application.

### CVE-2026-83557: jackson-databind: Comparable missing from DefaultBaseTypeLimitingValidator's unsafe base types (incomplete PolymorphicTypeValidator denylist)
- **Category:** CVE
- **Severity:** optional
- **Story Points:** 1
- **Files:** pom.xml:78

[CVE-2026-83557](https://github.com/advisories/GHSA-gx83-3vf8-gh7j)

Severity: MEDIUM

Affected dependencies:
- com.fasterxml.jackson.core:jackson-databind:2.19.0 (compile; transitive via spring-boot-starter-json, declared at pom.xml:78); affected range >= 2.19.0, < 2.21.6; recommended fix: upgrade to 2.21.6 or an unaffected supported release

Version-based advisory match, not proof that exploit prerequisites are enabled in this application.

### CVE-2026-68497: jackson-databind: Duration XMLGregorianCalendar Unbounded Number Parse DoS
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:78

[CVE-2026-68497](https://github.com/advisories/GHSA-q4xh-88c3-wmh7)

Severity: HIGH

Affected dependencies:
- com.fasterxml.jackson.core:jackson-databind:2.19.0 (compile; transitive via spring-boot-starter-json, declared at pom.xml:78); affected range >= 2.19.0, < 2.21.6; recommended fix: upgrade to 2.21.6 or an unaffected supported release

Version-based advisory match, not proof that exploit prerequisites are enabled in this application.

### CVE-2026-19032: jackson-databind: Path Deserialization Missing Scheme Allowlist for FileSystemProvider Resolution
- **Category:** CVE
- **Severity:** optional
- **Story Points:** 1
- **Files:** pom.xml:78

[CVE-2026-19032](https://github.com/advisories/GHSA-wjgm-6hv5-3cvf)

Severity: MEDIUM

Affected dependencies:
- com.fasterxml.jackson.core:jackson-databind:2.19.0 (compile; transitive via spring-boot-starter-json, declared at pom.xml:78); affected range >= 2.19.0, < 2.21.6; recommended fix: upgrade to 2.21.6 or an unaffected supported release

Version-based advisory match, not proof that exploit prerequisites are enabled in this application.

### CVE-2026-77310: jackson-databind: Incomplete fix for CVE-2026-54514: eager DNS resolution (SSRF) still present in InetAddress deserialization
- **Category:** CVE
- **Severity:** optional
- **Story Points:** 1
- **Files:** pom.xml:78

[CVE-2026-77310](https://github.com/advisories/GHSA-vvgp-rfg2-7rr6)

Severity: MEDIUM

Affected dependencies:
- com.fasterxml.jackson.core:jackson-databind:2.19.0 (compile; transitive via spring-boot-starter-json, declared at pom.xml:78); affected range >= 2.19.0, < 2.21.5; recommended fix: upgrade to 2.21.5 or an unaffected supported release

Version-based advisory match, not proof that exploit prerequisites are enabled in this application.

### CVE-2026-59889: jackson-databind: @JsonView bypassed for @JsonUnwrapped container properties on deserialization
- **Category:** CVE
- **Severity:** optional
- **Story Points:** 1
- **Files:** pom.xml:78

[CVE-2026-59889](https://github.com/advisories/GHSA-5gvw-p9qm-jgwh)

Severity: MEDIUM

Affected dependencies:
- com.fasterxml.jackson.core:jackson-databind:2.19.0 (compile; transitive via spring-boot-starter-json, declared at pom.xml:78); affected range >= 2.19.0, < 2.21.5; recommended fix: upgrade to 2.21.5 or an unaffected supported release

Version-based advisory match, not proof that exploit prerequisites are enabled in this application.

### CVE-2026-68494: jackson-core: Async parser maxNumberLength bypass via chunked digit accumulation (incomplete fix for GHSA-72hv-8253-57qq)
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:78

[CVE-2026-68494](https://github.com/advisories/GHSA-r7wm-3cxj-wff9)

Severity: HIGH

Affected dependencies:
- com.fasterxml.jackson.core:jackson-core:2.19.0 (compile; transitive via spring-boot-starter-json, declared at pom.xml:78); affected range >= 2.19.0, < 2.21.4; recommended fix: upgrade to 2.21.4 or an unaffected supported release

Version-based advisory match, not proof that exploit prerequisites are enabled in this application.

### CVE-2026-59888: jackson-databind: @JsonIgnore on a Record property is bypassed with a PropertyNamingStrategy
- **Category:** CVE
- **Severity:** optional
- **Story Points:** 1
- **Files:** pom.xml:78

[CVE-2026-59888](https://github.com/advisories/GHSA-3pjw-73gf-8qr5)

Severity: MEDIUM

Affected dependencies:
- com.fasterxml.jackson.core:jackson-databind:2.19.0 (compile; transitive via spring-boot-starter-json, declared at pom.xml:78); affected range >= 2.19.0, < 2.21.4; recommended fix: upgrade to 2.21.4 or an unaffected supported release

Version-based advisory match, not proof that exploit prerequisites are enabled in this application.

### CVE-2026-54515: jackson-databind has case-insensitive deserialization bypasses per-property @JsonIgnoreProperties
- **Category:** CVE
- **Severity:** optional
- **Story Points:** 1
- **Files:** pom.xml:78

[CVE-2026-54515](https://github.com/advisories/GHSA-5jmj-h7xm-6q6v)

Severity: MEDIUM

Affected dependencies:
- com.fasterxml.jackson.core:jackson-databind:2.19.0 (compile; transitive via spring-boot-starter-json, declared at pom.xml:78); affected range >= 2.19.0, < 2.21.5; recommended fix: upgrade to 2.21.5 or an unaffected supported release

Version-based advisory match, not proof that exploit prerequisites are enabled in this application.

### CVE-2026-54514: jackson-databind: InetSocketAddress deserialization triggers eager DNS resolution (SSRF)
- **Category:** CVE
- **Severity:** optional
- **Story Points:** 1
- **Files:** pom.xml:78

[CVE-2026-54514](https://github.com/advisories/GHSA-hgj6-7826-r7m5)

Severity: MEDIUM

Affected dependencies:
- com.fasterxml.jackson.core:jackson-databind:2.19.0 (compile; transitive via spring-boot-starter-json, declared at pom.xml:78); affected range >= 2.19.0, < 2.21.4; recommended fix: upgrade to 2.21.4 or an unaffected supported release

Version-based advisory match, not proof that exploit prerequisites are enabled in this application.

### CVE-2026-54513: jackson-databind has an array subtype allowlist bypass in BasicPolymorphicTypeValidator (allowIfSubTypeIsArray)
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:78

[CVE-2026-54513](https://github.com/advisories/GHSA-rmj7-2vxq-3g9f)

Severity: HIGH

Affected dependencies:
- com.fasterxml.jackson.core:jackson-databind:2.19.0 (compile; transitive via spring-boot-starter-json, declared at pom.xml:78); affected range >= 2.19.0, < 2.21.4; recommended fix: upgrade to 2.21.4 or an unaffected supported release

Version-based advisory match, not proof that exploit prerequisites are enabled in this application.

### CVE-2026-54512: jackson-databind has a PolymorphicTypeValidator bypass via generic type parameters that allows arbitrary class instantiation
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:78

[CVE-2026-54512](https://github.com/advisories/GHSA-j3rv-43j4-c7qm)

Severity: HIGH

Affected dependencies:
- com.fasterxml.jackson.core:jackson-databind:2.19.0 (compile; transitive via spring-boot-starter-json, declared at pom.xml:78); affected range >= 2.19.0, <= 2.21.3; recommended fix: upgrade to 2.21.4 or an unaffected supported release

Version-based advisory match, not proof that exploit prerequisites are enabled in this application.

### CVE-2026-47838: Spring Security Vulnerable to Unauthorized User Impersonation when Using X.509 Client Certificates
- **Category:** CVE
- **Severity:** optional
- **Story Points:** 1
- **Files:** pom.xml:65

[CVE-2026-47838](https://github.com/advisories/GHSA-293q-567p-wmwq)

Severity: MEDIUM

Affected dependencies:
- org.springframework.security:spring-security-web:6.5.0 (compile; transitive via spring-boot-starter-security, declared at pom.xml:65); affected range >= 6.5.0, <= 6.5.10; recommended fix: upgrade to 6.5.11 or an unaffected supported release

Version-based advisory match, not proof that exploit prerequisites are enabled in this application.

### CVE-2026-41706: Spring Security: Open Redirect via Unvalidated Post-Login Redirect URL Stored in CookieRequestCache
- **Category:** CVE
- **Severity:** optional
- **Story Points:** 1
- **Files:** pom.xml:65

[CVE-2026-41706](https://github.com/advisories/GHSA-x2r2-rvhq-2mqv)

Severity: MEDIUM

Affected dependencies:
- org.springframework.security:spring-security-web:6.5.0 (compile; transitive via spring-boot-starter-security, declared at pom.xml:65); affected range >= 6.5.0, <= 6.5.10; recommended fix: upgrade to 6.5.11 or an unaffected supported release

Version-based advisory match, not proof that exploit prerequisites are enabled in this application.

### CVE-2026-22732: Spring Security HTTP Headers Are not Written Under Some Conditions
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:65

[CVE-2026-22732](https://github.com/advisories/GHSA-mf92-479x-3373)

Severity: CRITICAL

Affected dependencies:
- org.springframework.security:spring-security-web:6.5.0 (compile; transitive via spring-boot-starter-security, declared at pom.xml:65); affected range >= 6.5.0, < 6.5.9; recommended fix: upgrade to 6.5.9 or an unaffected supported release

Version-based advisory match, not proof that exploit prerequisites are enabled in this application.

### CVE-2026-18401: jackson-core: Number Length Constraint Bypass in Async Parser Leads to Potential DoS Condition
- **Category:** CVE
- **Severity:** optional
- **Story Points:** 1
- **Files:** pom.xml:78

[CVE-2026-18401](https://github.com/advisories/GHSA-72hv-8253-57qq)

Severity: MEDIUM

Affected dependencies:
- com.fasterxml.jackson.core:jackson-core:2.19.0 (compile; transitive via spring-boot-starter-json, declared at pom.xml:78); affected range >= 2.19.0, < 2.21.1; recommended fix: upgrade to 2.21.1 or an unaffected supported release

Version-based advisory match, not proof that exploit prerequisites are enabled in this application.

### CVE-2026-24400: AssertJ has XML External Entity (XXE) vulnerability when parsing untrusted XML via isXmlEqualTo assertion
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:84

[CVE-2026-24400](https://github.com/advisories/GHSA-rqfh-9r24-8c9r)

Severity: HIGH

Affected dependencies:
- org.assertj:assertj-core:3.27.3 (test; transitive via spring-boot-starter-test, declared at pom.xml:84); affected range >= 1.4.0, <= 3.27.6; recommended fix: upgrade to 3.27.7 or an unaffected supported release

Version-based advisory match, not proof that exploit prerequisites are enabled in this application.

### CVE-2026-41001: Spring Boot: Predictable Temp Directory in Artemis Auto-configuration
- **Category:** CVE
- **Severity:** optional
- **Story Points:** 1
- **Files:** pom.xml:98

[CVE-2026-41001](https://github.com/advisories/GHSA-ggg2-9786-hwc8)

Severity: MEDIUM

Affected dependencies:
- org.springframework.boot:spring-boot-autoconfigure:3.5.0 (compile; transitive via spring-boot-devtools, declared at pom.xml:98); affected range >= 3.5.0, <= 3.5.14; recommended fix: upgrade to 3.5.15 or an unaffected supported release

Version-based advisory match, not proof that exploit prerequisites are enabled in this application.

### CVE-2026-40973: Spring Boot accepts predictable temp directory without ownership verification
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:98

[CVE-2026-40973](https://github.com/advisories/GHSA-wwpq-f5c3-7hvx)

Severity: HIGH

Affected dependencies:
- org.springframework.boot:spring-boot:3.5.0 (compile; transitive via spring-boot-devtools, declared at pom.xml:98); affected range >= 3.5.0, < 3.5.14; recommended fix: upgrade to 3.5.14 or an unaffected supported release

Version-based advisory match, not proof that exploit prerequisites are enabled in this application.

### CVE-2026-40972: Spring Boot DevTools remote secret comparison is vulnerable to timing attacks
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:98

[CVE-2026-40972](https://github.com/advisories/GHSA-56v8-86gj-66jp)

Severity: HIGH

Affected dependencies:
- org.springframework.boot:spring-boot-devtools:3.5.0 (compile; direct, declared at pom.xml:98); affected range >= 3.5.0, < 3.5.14; recommended fix: upgrade to 3.5.14 or an unaffected supported release

Version-based advisory match, not proof that exploit prerequisites are enabled in this application.

### CVE-2025-41249: Spring Framework annotation detection mechanism may result in improper authorization
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:84

[CVE-2025-41249](https://github.com/advisories/GHSA-jmp9-x22r-554x)

Severity: HIGH

Affected dependencies:
- org.springframework:spring-core:6.2.7 (compile; transitive via spring-boot-starter-test, declared at pom.xml:84); affected range >= 6.2.0, <= 6.2.10; recommended fix: upgrade to 6.2.11 or an unaffected supported release

Version-based advisory match, not proof that exploit prerequisites are enabled in this application.

## CWE Findings (Code-Level Vulnerabilities)

### CWE-606: Unchecked Input for Loop Condition
- **Category:** Code Quality
- **Severity:** potential
- **Story Points:** 3
- **Files:** src/main/java/com/photoalbum/controller/HomeController.java:58-70, src/main/resources/application.properties:30

HomeController.uploadPhotos iterates the request-controlled List<MultipartFile> at line 69 without checking its element count. Each iteration performs image-header processing and database operations through uploadPhoto (70) and a subsequent read (73). The configured max-files-per-upload at application.properties:30 is never consumed by production Java. The 50 MB multipart request cap bounds bytes, not the number of small parts and database operations; exploiting this route requires upload authentication. No infinite loop is claimed.

### CWE-789: Memory Allocation with Excessive Size Value
- **Category:** Code Quality
- **Severity:** potential
- **Story Points:** 5
- **Files:** src/main/java/com/photoalbum/controller/HomeController.java:38-42, src/main/java/com/photoalbum/service/impl/PhotoServiceImpl.java:54-56, src/main/java/com/photoalbum/repository/PhotoRepository.java:23-29, src/main/java/com/photoalbum/model/Photo.java:39-41

The public gallery GET invokes getAllPhotos, which materializes an unbounded List<Photo> from a native SELECT including every photo_data BLOB (PhotoRepository:23-29); Photo.photoData is an eagerly loaded byte[] without lazy Basic loading. Aggregate allocation is proportional to all uploaded content, with no pagination or aggregate byte limit. Per-file upload limits do not bound the full dataset. Once authenticated uploads populate a sufficiently large gallery, an anonymous gallery request can cause heap exhaustion; repeated large-read requests increase pressure. This is database-driven aggregate allocation, not an unchecked new byte[requestSize] primitive.

### CWE-778: Insufficient Logging
- **Category:** Credentials & Secrets
- **Severity:** potential
- **Story Points:** 3
- **Files:** src/main/java/com/photoalbum/config/SecurityConfig.java:46-59, src/main/resources/application-docker.properties:30-31

SecurityConfig configures HTTP Basic authentication but installs no authentication success/failure audit handler or event listener. Authentication rejection occurs in Spring Security before HomeController/DetailController log calls; no application authentication-event listener or access-log configuration exists. In the Docker profile Spring web logs are WARN and Spring Security has no explicit audit logging configuration. Thus unsuccessful login attempts lack an application-configured security audit record identifying the attempted user and outcome. This is absence of configured authentication auditing, not a claim that all application actions are unlogged; upload/delete outcomes are logged.

### CWE-434: Unrestricted Upload of File with Dangerous Type
- **Category:** File & Path Security
- **Severity:** mandatory
- **Story Points:** 8
- **Files:** src/main/java/com/photoalbum/service/impl/PhotoServiceImpl.java:87, src/main/java/com/photoalbum/service/impl/PhotoServiceImpl.java:124-166

PhotoServiceImpl.uploadPhoto trusts the client-supplied Content-Type allowlist (line 87). If ImageIO finds no reader (lines 125-142), the method nevertheless saves the unvalidated bytes (lines 154-166); non-IO parsing exceptions also continue (149-152). Thus arbitrary non-image content labeled image/jpeg can be stored and publicly retrieved by PhotoFileController.servePhoto (75-83), without confirming an accepted image format. This confirms absent server-side file-content validation, not execution of uploaded code; response is restricted to configured image MIME types.

### CWE-79: Improper Neutralization of Input During Web Page Generation ('Cross-site Scripting')
- **Category:** Injection Attacks
- **Severity:** optional
- **Story Points:** 8
- **Files:** src/main/resources/static/js/upload.js:71-82, src/main/resources/static/js/upload.js:215-218

upload.js handleFiles incorporates attacker-influenced File.name into validation error strings (73,75), which showErrors inserts as HTML without escaping at 216-218. A crafted filename containing an HTML element/event handler is parsed in the gallery origin when a victim selects or drops it; this error path runs before any authenticated upload is required. This is a filename-triggered DOM XSS requiring victim file interaction, not evidence of automatic cross-user stored XSS on page reload. Server-returned filenames also reach unescaped createPhotoCard HTML at 185-189 and insertAdjacentHTML at 157.

### CWE-89: Improper Neutralization of Special Elements used in an SQL Command ('SQL Injection')
- **Category:** Injection Attacks
- **Severity:** mandatory
- **Story Points:** 13
- **Files:** oracle-init/01-create-user.sh:25-28, oracle-init/create-user.sh:27-30

The startup SQLPlus here-documents substitute environment-controlled APP_USER_UPPER into SQL string literals (01-create-user.sh:25) and a dynamic EXECUTE IMMEDIATE CREATE USER statement at line 28; the environment-supplied schema password is interpolated into the same dynamic SQL without SQL/PLSQL quote escaping. A quote-bearing configured value can alter the generated PL/SQL statement under the privileged bootstrap connection. Preconditions: control of deployment environment variables; no HTTP input reaches this bootstrap path. Application PhotoRepository queries themselves use fixed statements and bound parameters. Credential values intentionally omitted.
