---
title: Log rotate
category: Docker
date: 2021-02-17
---

-----

```bash
$ sudo nano /etc/logrotate.d/docker_logs

/var/lib/docker/containers/*/*.log {
  rotate 10
  daily
  compress
  size=200M
  missingok
  delaycompress
  copytruncate
}
```

-----
