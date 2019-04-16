---
title: Error rpmdb open failed
category: CentOS
date: 2019-04-15
---

**`Error: rpmdb open failed` when trying to `yum update`**

-----

* Backup rpm database:
```
mv /var/lib/rpm/__db* /tmp
```

* Clear packages cache:
```
yum clean all
```

* Check:
```
yum update
```

-----

* [Source](https://www.ostechnix.com/solve-error-rpmdb-open-failed-error-centos)

-----