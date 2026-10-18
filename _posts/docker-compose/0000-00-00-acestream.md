---
title: AceStream
category: Docker-compose
date: 2020-02-05
---

---

*Stream AceStream content through a Docker Compose service.*

```yaml
services:
  acestream:
    restart: 'always'
    container_name: 'acestream'
    image: 'coresystem/acestream'
    command: './start.sh SZGHqCMt 1800'
    volumes:
      - './volumes/app:/fs/'
    ports:
      - '80:6878'
      - '8621:8621'
```

---

*UI:*

```text
http://your_server_ip/webui/app/SZGHqCMt/server
```

---

[Source](https://hub.docker.com/r/coresystem/acestream)

---
