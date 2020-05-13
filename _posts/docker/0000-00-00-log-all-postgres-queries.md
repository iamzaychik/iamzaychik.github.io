---
title: Log all postgres queries
category: Docker
date: 2020-05-13
---

-----

```yaml
version: "2.2"
services:
  db:
    image: postgres:12-alpine
    command: ["postgres", "-c", "log_statement=all", "-c", "log_destination=stderr"]
```

-----

[Source](https://stackoverflow.com/a/59313245)

-----
