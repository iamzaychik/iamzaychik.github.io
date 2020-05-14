---
title: Mattermost
category: Docker-compose
date: 2020-02-05
---

-----

```bash
$ git clone https://github.com/mattermost/mattermost-docker.git
```

-----

```yaml
version: '3.4'

services:

  mattermost_db:
    restart: always
    build: mattermost_db
    read_only: true
    environment:
      - POSTGRES_USER=mmuser
      - POSTGRES_PASSWORD=mmuser_password
      - POSTGRES_DB=mattermost
    volumes:
      - ./volumes/db:/var/lib/postgresql/data
      - /etc/localtime:/etc/localtime:ro

  mattermost_app:
    restart: always
    container_name: mattermost_app
    build:
      context: mattermost_app
      args:
        - edition=team
    ports:
      - "127.0.0.1:8000:8000"
    volumes:
      - ./volumes/app/mattermost/config:/mattermost/config:rw
      - ./volumes/app/mattermost/data:/mattermost/data:rw
      - ./volumes/app/mattermost/logs:/mattermost/logs:rw
      - ./volumes/app/mattermost/plugins:/mattermost/plugins:rw
      - ./volumes/app/mattermost/client-plugins:/mattermost/client/plugins:rw
      - /etc/localtime:/etc/localtime:ro
    environment:
      # set same as db credentials and dbname
      - MM_USERNAME=mmuser
      - MM_PASSWORD=mmuser_password
      - MM_DBNAME=mattermost
      # in case your config is not in default location
      #- MM_CONFIG=/mattermost/config/config.json
```

-----
