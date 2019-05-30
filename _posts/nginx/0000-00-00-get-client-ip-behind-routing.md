---
title: Get client IP behind routing
category: Nginx
date: 2019-04-15
---

-----

**Add to `/etc/nginx.conf` as client header source:**

```bash
# Default install
real_ip_header X-Forwarded-For;
# Behind HAproxy
real_ip_header proxy_protocol;
set_real_ip_from 192.0.2.1;
```

-----