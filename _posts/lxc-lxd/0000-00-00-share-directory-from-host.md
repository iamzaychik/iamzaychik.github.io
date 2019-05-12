---
title: Share directory from host
category: LXC, LXD
date: 2019-05-12
---

-----

* Create directory:
```bash
$ mkdir /home/ubuntu/share
$ chmod 777 /home/ubuntu/share
```

* Add shared directory to container config:
```bash
$ lxc config edit CONTAINER
devices:
  share:
    path: /home/ubuntu/share
    source: /mnt/share
    type: disk
```

-----