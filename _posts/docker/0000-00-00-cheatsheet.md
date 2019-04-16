---
title: Cheatsheet
category: Docker
date: 2019-04-15
---

-----

* Show detailed image history:
```bash
docker history --no-trunc alpine:latest
```

-----

* Healthcheck in the Dockerfile:
```bash
HEALTHCHECK CMD curl --fail http://localhost:80 || exit 1
```

-----