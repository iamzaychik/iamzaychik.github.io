---
title: Permissions
category: Ubuntu
date: 2019-11-29
---

-----

```
0	—	No access.
1	–x	Execute access.
2	-w-	Write access.
3	-wx	Write and execute access.
4	r–	Read access.
5	r-x	Read and execute access.
6	rw-	Read and write access.
7	rwx	Read, write and execute access.
```

-----

* Set different permissions for files and dirs
```bash
$ find /var/www/nextcloud/ -type f -print0 | sudo xargs -0 chmod 0644
$ find /var/www/nextcloud/ -type d -print0 | sudo xargs -0 chmod 0755
```

-----

[Source](http://www.woodwolf.ru/76/)

-----