---
title: Create swap
category: Ubuntu
date: 2019-05-29
---

-----

```bash
$ fallocate -l <SWAP SIZE> /swapfile
$ chmod 600 /swapfile
$ mkswap /swapfile
$ swapon /swapfile
$ echo "/swapfile none swap sw 0 0" >> /etc/fstab
```

-----