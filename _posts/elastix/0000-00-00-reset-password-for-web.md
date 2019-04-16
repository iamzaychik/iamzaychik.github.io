---
title: Reset password for web
category: Elastix
date: 2019-04-15
---

-----

* Before v3.0:
1. Connect to ssh
2. Change `admin` password to `password`:
```bash
$ sqlite3 /var/www/db/acl.db "UPDATE acl_user SET md5_password='5f4dcc3b5aa765d61d8327deb882cf99' WHERE name='admin'"
```

* Version v3.0 and up:
```bash
$ /usr/bin/elastix-admin-passwords --change
```

-----