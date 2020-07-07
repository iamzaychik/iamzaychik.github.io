---
title: Create selfsigned cert
category: SSL
date: 2019-11-11
---

-----

```bash
$ openssl req -x509 -newkey rsa:4096 -keyout key.pem -out cert.pem -days 10000 -nodes
```

-----
