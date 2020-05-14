---
title: Webserver
category: Docker-compose
date: 2020-02-05
---

-----

```yaml
version: '3.4'

services:

  webserver:
    restart: always
    container_name: webserver
    image: richarvey/nginx-php-fpm:php5
    environment:
      PHP_MEM_LIMIT: 4096
    volumes:
      - ./volumes/data/:/var/www/html/
    ports:
      - 80:80
```

-----
