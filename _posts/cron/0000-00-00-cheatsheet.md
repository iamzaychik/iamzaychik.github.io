---
title: Cheatsheet
category: Cron
date: 2020-07-07
---

-----

* Run every first Sunday:
```bash
00 09 * * 7 [ $(date +\%d) -le 07 ] && /run/your/script
```

-----

[Source](https://stackoverflow.com/a/3242169)

-----
