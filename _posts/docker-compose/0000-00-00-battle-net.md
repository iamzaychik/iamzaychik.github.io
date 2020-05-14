---
title: BattleNet
category: Docker-compose
date: 2020-02-05
---

-----

```yaml
version: '3.4'

services:

  bnet:
    restart: always
    container_name: battle-net
    build:
      context: .
      dockerfile: Dockerfile_minimal
    ports:
      - 6112:6112/tcp
      - 6112:6112/udp
      - 6200:6200/tcp
    volumes:
      - ./pvpgn/:/usr/local/var/pvpgn/
```

-----

```bash
FROM ubuntu:18.04

WORKDIR /bnet

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -qq -y --no-install-recommends git ca-certificates build-essential cmake zlib1g-dev

RUN git clone https://github.com/pvpgn/pvpgn-server.git /bnet

RUN cmake -G "Unix Makefiles" -H./ -B./build && \
    cd build && \
    make && \
    make install

RUN apt-get clean && \
    apt-get autoclean -y && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

CMD ["bnetd", "-f"]
```

-----
