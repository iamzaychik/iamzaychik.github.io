---
title: PostgreSQL
category: Docker-compose
date: 2020-02-05
---

---

*Run PostgreSQL with persistent database storage.*

```yaml
services:
  database:
    restart: 'always'
    container_name: 'database'
    image: 'postgres:10.3-alpine'
    environment:
      POSTGRES_PASSWORD: 'example'
    volumes:
      - './volumes/db:/var/lib/postgresql/data'
```

---
