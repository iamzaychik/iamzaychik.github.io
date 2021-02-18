---
title: Cheatsheet
category: Docker
date: 2019-04-15
---

-----

* Show detailed image history:
```bash
$ docker history --no-trunc alpine:latest
```

-----

* Healthcheck in the Dockerfile:
```bash
HEALTHCHECK CMD curl --fail http://localhost:80 || exit 1
```

-----

* Logs rotation:
```yaml
logging:
        driver: "json-file"
        options:
            max-file: "5"
            max-size: "500m"
```

-----

* Resources limits:
But what you need to make that works is to run the docker-compose using `--compatibility` flag `docker-compose --compatibility up --build`
```yaml
version: "3.7"
services:
  mongodb_container:
    image: mongo:latest
    environment:
      MONGO_INITDB_ROOT_USERNAME: root
      MONGO_INITDB_ROOT_PASSWORD: psw
      MONGO_INITDB_DATABASE: admin
    ports:
      - 27017:27017
    command: mongod --auth
    volumes:
      - ./data-docker/mongo:/data
    deploy:
      resources:
        limits:
          cpus: '0.5'
          memory: 150M
```

-----

[Source](https://stackoverflow.com/a/61427151)

-----
