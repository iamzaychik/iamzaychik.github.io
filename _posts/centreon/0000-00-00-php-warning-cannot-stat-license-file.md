---
title: PHP Warning "Cannot stat license file"
category: Centreon
date: 2019-04-15
---

**When clapi logs contains `"PHP Warning: Cannot stat license file"`**

-----

From `/etc/php.d/zendguard.ini` remove/comment line:
```bash
/usr/share/centreon/www/modules/centreon-pp-manager/license
```

-----