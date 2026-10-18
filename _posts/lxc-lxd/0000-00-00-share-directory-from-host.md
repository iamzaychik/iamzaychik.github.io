---
title: Share directory from host
category: LXC, LXD
date: 2019-05-12
---

---

*Share a host directory with an LXC or LXD container.*

* Create directory on the host:
```bash
$ mkdir /mnt/share
$ chmod 777 /mnt/share
```

* Add shared directory to container config:
```bash
$ lxc config edit CONTAINER
```

```yaml
devices:
  share:
    path: /home/ubuntu/share
    source: /mnt/share
    type: disk
```

---
