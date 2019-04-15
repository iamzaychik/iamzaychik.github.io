---
title: Error rpmdb open failed
---

**Якщо при виконанні `yum update` маємо помилку Error: rpmdb open failed:**

**Робимо бекап бази rpm:**
`mv /var/lib/rpm/__db* /tmp`

**Чистимо кеш пакетів:**
`yum clean all`

**Перевіряємо:**
`yum update`

* <a href="https://www.ostechnix.com/solve-error-rpmdb-open-failed-error-centos/">Пишуть люди</a>

-----