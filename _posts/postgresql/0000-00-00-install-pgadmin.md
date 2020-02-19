---
title: Install pgAdmin
category: PostgreSQL
date: 2020-02-19
---

```bash
$ sudo curl https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
$ sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
$ sudo apt update && sudo apt install pgadmin4 -y
```

---

[Source](https://wiki.postgresql.org/wiki/Apt)

---