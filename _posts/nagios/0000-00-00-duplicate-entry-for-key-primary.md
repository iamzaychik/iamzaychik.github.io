---
title: Duplicate entry for key PRIMARY
category: Nagios
date: 2019-04-15
---

**If your syslog contains a lot of errors like this:**
`nagios ndo2db: mysql_error: 'Duplicate entry '2147483647' for key 'PRIMARY''`

**Execute next query in your centreon database:**
`ALTER TABLE nagios_timedeventqueue MODIFY timedeventqueue_id SERIAL`

-----
