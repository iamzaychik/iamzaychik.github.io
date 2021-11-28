---
title: Check SSL certificate
category: Network
date: 2021-11-28
---

-----

* Check if cert is valid:

```bash
$ openssl s_client -showcerts -connect ${domain}:443 </dev/null | openssl x509 -noout -dates
$ curl --insecure -vvI https://${domain}  2>&1 | awk 'BEGIN { cert=0 } /^\* SSL connection/ { cert=1 } /^\*/ { if (cert) print }'
```

-----

* Check domain code in a loop:

```bash
$ while sleep 2; do time curl -s -L -o /dev/null -s -w "%{http_code}\n" https://${domain}; done
```

-----
