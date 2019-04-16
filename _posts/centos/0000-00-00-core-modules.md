---
title: Core modules
category: CentOS
date: 2019-04-15
---

-----

* Load in-flight:
```bash
$ modprobe 8021q
```

* Check load:
```bash
$ lsmod | grep 8021q
```

* For loading at boot need to add /etc/modules-load.d/`<MODULE>.conf`:
```bash
$ echo 8021q >> /etc/modules-load.d/8021q.conf
```

-----