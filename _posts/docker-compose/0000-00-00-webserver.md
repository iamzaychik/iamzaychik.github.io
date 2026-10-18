---
title: Nginx PHP-FPM Webserver
category: Docker-compose
date: 2020-02-05
---

---

*Serve local PHP files through the Nginx PHP-FPM container.*

### Run the webserver

```yaml
services:
  webserver:
    restart: 'always'
    container_name: 'webserver'
    image: 'richarvey/nginx-php-fpm:latest'
    environment:
      PHP_MEM_LIMIT: '4096'
    volumes:
      - './data:/var/www/html'
    ports:
      - '80:80'
```

---
