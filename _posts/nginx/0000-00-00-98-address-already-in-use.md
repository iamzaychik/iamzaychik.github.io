---
title: 98 Address already in use
category: Nginx
date: 2019-04-15
---

-----

**If having next error, when starting Nginx:**
```bash
* [emerg]: bind() to 0.0.0.0:80 failed (98: Address already in use)
```

1. Kill proccess, which using port:
```bash
$ sudo fuser -k 80/tcp
 ```

2. Restart Nginx:
```bash
$ service nginx restart
```

-----