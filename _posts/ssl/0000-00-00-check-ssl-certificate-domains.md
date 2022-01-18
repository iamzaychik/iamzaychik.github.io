---
title: Check SSL certificate domains
category: SSL
date: 2022-01-18
---

-----

```bash
# Certs
$ cat /etc/certs/cert.pem | openssl x509 -text -noout | grep "X509v3 Subject Alternative Name:" -A 1
```

-----
