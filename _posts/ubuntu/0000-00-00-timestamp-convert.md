---
title: Timestamp convert
category: Ubuntu
date: 2019-05-29
---

-----

* Unix timestamp convert:
```bash
$ date -d@1462949293
Wed May 11 02:48:13 EDT 2016
```

* dmesg timestamp convert:
```bash
$ dmesg | perl -pE '/\[\s*(\d+\.\d+)\]/; $t=scalar localtime time-$1/100; s/\[\s*(\d+\.\d+)\]/[$t]/;'
```

-----