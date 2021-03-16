---
title: Check SSL cert on any port
category: SSL
date: 2020-07-07
---

-----

```bash
# Certs
$ openssl s_client -servername example.com -connect example.com:993 -showcerts

# Expiration dates
$ openssl s_client -servername example.com -connect example.com:443 | openssl x509 -noout -dates
```

-----
