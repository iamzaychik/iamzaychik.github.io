---
title: Duplicate entry for key PRIMARY
---

**Якшо в syslog маємо багато помилок:**
`nagios ndo2db: mysql_error: 'Duplicate entry '2147483647' for key 'PRIMARY''`

**В базі centreon_status виконуємо запит:**
`ALTER TABLE nagios_timedeventqueue MODIFY timedeventqueue_id SERIAL`
-----