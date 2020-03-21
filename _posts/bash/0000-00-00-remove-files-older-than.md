---
title: Remove files older than
category: Bash
date: 2019-05-29
---

-----

```bash
$ find /mnt -type f -mtime +14 -print0 | xargs -0 rm -rf
```

-----
