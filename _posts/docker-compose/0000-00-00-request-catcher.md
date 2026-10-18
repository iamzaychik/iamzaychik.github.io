---
title: HTTP Request Catcher
category: Docker-compose
date: 2026-10-18
---

---

*Capture outbound HTTP requests during webhook and integration testing.*

### Start the request catcher

```yaml
services:
  request_catcher:
    restart: 'always'
    container_name: 'request_catcher'
    image: 'smarterdm/http-request-catcher'
    ports:
      - '80:5000'
```

---
