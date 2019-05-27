---
title: Table storage engine for TABLE doesnt have this option
category: MySQL
date: 2019-04-15
---

*This error appears, when DB type was changed from MyISAM to InnoDB. After that option ROW_FORMAT is wrong*
```bash
$ sed -ie 's/ROW_FORMAT=FIXED//g' dump.sql
```

-----