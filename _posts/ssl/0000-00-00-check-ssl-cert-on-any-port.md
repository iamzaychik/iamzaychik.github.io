---
title: Check SSL cert on any port
category: SSL
date: 2020-07-07
---

-----

```bash
$ openssl s_client -showcerts -connect example.com:993 -servername example.com
```

-----
