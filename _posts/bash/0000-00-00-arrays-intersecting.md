---
title: Arrays intersecting
category: Bash
date: 2019-05-29
---

---

*Find values shared by two Bash arrays.*

```bash
$ echo ${Array1[@]} ${Array2[@]} | tr ' ' '\n' | sort | uniq -d
```

---
