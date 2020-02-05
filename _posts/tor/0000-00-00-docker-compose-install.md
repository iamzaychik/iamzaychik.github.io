---
title: Docker-compose install
category: TOR
date: 2020-02-05
---

-----

* docker-compose.yml
```yaml
version: "3"
services:
  tor:
    restart: always
    container_name: tor
    build: .
    ports:
      - 127.0.0.1:9050:9050
```

* Dockerfile
```bash
FROM alpine:latest

RUN apk add --no-cache tor && \
    rm -rf /var/cache/apk/* /tmp/* /var/tmp/*

ADD torrc /etc/tor/torrc

CMD ["/usr/bin/tor"]
```

* torrc
```bash
SocksPort 0.0.0.0:9050
ExcludeExitNodes {ru}, {ua}, {by}
```

-----
