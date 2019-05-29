---
title: Timezone configuration
category: Ubuntu
date: 2019-05-29
---

-----

* First:
```bash
$ dpkg-reconfigure tzdata
```

* Second:
```bash
$ ln -fs /usr/share/zoneinfo/Europe/Kiev /etc/localtime
```

-----