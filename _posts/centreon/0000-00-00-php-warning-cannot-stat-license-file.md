---
title: PHP Warning Cannot stat license file
category: Centreon
date: 2019-04-15
---

---

*When clapi logs contains `"PHP Warning: Cannot stat license file"`*
*Fix the Centreon PHP warning about a missing license file.*

### Edit the PHP configuration

*/etc/php.d/zendguard.ini:*

- Remove or comment this line:

```text
/usr/share/centreon/www/modules/centreon-pp-manager/license
```

---
