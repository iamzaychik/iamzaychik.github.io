---
title: Column count of mysql.user is wrong
category: MySQL
date: 2019-05-28
---

*It probably happens if you update directly bypassing the sequences of versions*

* Method one:
```bash
$ mysql_upgrade --force -uroot -p
```

* Method two:
```bash
$ mysql -u root -p
mysql> use mysql;
mysql> alter table mysql.user drop column default_role;
mysql> alter table mysql.user drop column max_statement_time;
mysql> alter table mysql.user drop column password_expired;
mysql> quit
```

-----