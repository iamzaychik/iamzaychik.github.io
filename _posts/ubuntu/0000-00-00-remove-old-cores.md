---
title: Remove old cores
category: Ubuntu
date: 2019-04-15
---

---

*Remove old cores on Ubuntu.*

```bash
$ apt purge $(dpkg -l 'linux-*' | sed '/^ii/!d;/'"$(uname -r | sed "s/\(.*\)-\([^0-9]\+\)/\1/")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d' | head -n -1) -y
```

---
