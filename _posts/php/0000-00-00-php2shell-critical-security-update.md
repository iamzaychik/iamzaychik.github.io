---
title: PHP2Shell: critical PHP security update
category: PHP
date: 2026-10-21
---

*Update Internet-facing PHP immediately; configuration changes only reduce exposure.*

---

PHP fixed two critical unauthenticated remote-code-execution vulnerabilities:

- CVE-2026-109618: out-of-memory corruption.
- CVE-2026-109619: stale global state after freed memory.

Affected web-serving deployments include PHP-FPM, Apache with mod_php, php-cgi, FrankenPHP, and LiteSpeed. Risk is highest with mod_php.

### Fixed versions

- PHP 8.5: 8.5.12 or later.
- PHP 8.4: 8.4.27 or later.
- PHP 8.3: 8.3.36 or later.
- PHP 8.2: 8.2.35 or later.

Check distribution, container-image, and appliance updates. PHP 8.1 and older are unsupported upstream; use a vendor backport or upgrade to a supported branch.

### Temporary mitigation

Updating is the only complete solution. Until then, disable session upload progress before request parsing and restart all PHP workers:

```ini
session.upload_progress.enabled = 0
```

For PHP-FPM, set it in the pool or server configuration rather than with `ini_set()` or `.user.ini`.

This blocks confirmed session paths for CVE-2026-109619 but does not make a vulnerable installation safe. It also disables PHP's built-in upload-progress feature.

Do not confuse this setting with CVE-2026-115560. That later issue needs an unusual combination of session configuration and application behavior; the same setting is its interim mitigation.

---

[PHP security advisory](https://www.php.net/?p=6419) · [Canadian Centre for Cyber Security alert](https://www.cyber.gc.ca/en/alerts-advisories/al26-026-critical-vulnerabilities-impacting-php-cve-2026-109618-and-cve-2026-109619)

---
