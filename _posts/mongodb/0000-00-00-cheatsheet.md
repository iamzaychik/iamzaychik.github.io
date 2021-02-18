---
title: Cheatsheet
category: MongoDB
date: 2021-02-17
---

-----

* Fix mongod service after no space left:
```bash
$ mongod --repair --dbpath /var/lib/mongo
```

* Exclude condition from find:
```bash
{email: { \$not: {\$in: ["example@domain.com"]} }}
```

-----
