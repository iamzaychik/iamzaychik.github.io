---
title: Check HTTP status code
category: Network
date: 2019-04-15
---

-----

```bash
$ curl -s -o /dev/null -w "%{http_code}" http://localhost | grep 200
Success: exitstatus 0
Fail: exitstatus 1
```

-----