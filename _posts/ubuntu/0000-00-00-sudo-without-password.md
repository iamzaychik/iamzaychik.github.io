---
title: Sudo without password
category: Ubuntu
date: 2019-04-15
---

-----

* Start editing sudoers:
```bash
$ sudo visudo
```

* Insert at the end of the file:
```bash
<USER> ALL=(ALL:ALL) NOPASSWD:ALL
```

-----