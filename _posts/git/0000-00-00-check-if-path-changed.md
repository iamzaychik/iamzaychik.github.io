---
title: Check if path changed
category: Git
date: 2023-12-31
---

---

*Check whether a path changed between the current branch and origin/develop.*

* Check if specific path changed comparing current branch with the origin/develop:
```bash
$ git diff origin/develop --name-only --no-color | grep -e ^path_to_check/
```

---
