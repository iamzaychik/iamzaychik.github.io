---
title: Reset password
category: Elastix
date: 2019-04-15
---

**Для того, щоб змінити пароль для доступу в web-інтерфейс Elastix &lt; 3.0:**
1. Заходимо на сервер через ssh;
2. Міняємо пароль користувача "admin" на "password":
`sqlite3 /var/www/db/acl.db "UPDATE acl_user SET md5_password='5f4dcc3b5aa765d61d8327deb882cf99' WHERE name='admin'"`

**На Elastix 3.0 зміна паролів робиться так:**
`/usr/bin/elastix-admin-passwords --change`
-----