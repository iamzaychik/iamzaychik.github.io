---
title: Localpics
category: Docker-compose
date: 2026-10-18
---

---

*Serve a local image directory with the Localpics container.*

### Run the image server

```yaml
services:
  localpics:
    container_name: 'localpics'
    restart: 'always'
    image: 'ghcr.io/tuxx/localpics:latest'
    environment:
      - 'USER_UID=1000'
      - 'USER_GID=1000'
    volumes:
      - './data/pics:/data'
      - './data/localpics.json:/app/.config/localpics/localpics.json'
      - '/etc/timezone:/etc/timezone:ro'
      - '/etc/localtime:/etc/localtime:ro'
    ports:
      - '80:80'
```

### Configure the image directory

- Store images in `./data/pics`.
- Store settings in `./data/localpics.json`.

---
