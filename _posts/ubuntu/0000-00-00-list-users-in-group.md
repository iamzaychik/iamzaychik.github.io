---
title: List users in group
category: Ubuntu
date: 2019-04-15
---

---

*List users in group on Ubuntu.*

```bash
$ getent group GROUPNAME| awk -F: '{print $4}'
```

---
