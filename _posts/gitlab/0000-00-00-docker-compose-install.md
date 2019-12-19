---
title: Docker-compose install
category: GitLab
date: 2019-12-19
---

-----

```bash
version: '3.4'

services:

 gitlab_app:
   container_name: gitlab_app
   image: gitlab/gitlab-ce:latest
   restart: always
   hostname: 'gitlab.example.com'
   environment:
     GITLAB_OMNIBUS_CONFIG: |
       external_url 'https://gitlab.example.com'
       registry_external_url 'https://registry.example.com'
   volumes:
     - ./volumes/app/config:/etc/gitlab
     - ./volumes/app/logs:/var/log/gitlab
     - ./volumes/app/data:/var/opt/gitlab
     - ./volumes/app/backups:/backups
   ports:
     - "3000:3000"
     - "5000:5000"
     - "2222:22"
```

-----
