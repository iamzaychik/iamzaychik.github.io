---
title: JSON Server
category: Docker-compose
date: 2026-10-18
---

---

*Expose a JSON document as a simple HTTP API for development tests.*

### Start the JSON API

```yaml
services:
  jsonserver:
    restart: 'always'
    container_name: 'jsonserver'
    image: 'clue/json-server'
    volumes:
      - './data:/data'
    ports:
      - '80:80'
```

### Prepare the data file

- Store the API document in `./data/db.json`.
- Mount the directory at `/data` inside the container.

---
