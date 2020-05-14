---
title: Ask password for ubuntu user sudo
category: AWS
date: 2019-04-15
---

-----

**AWS instances not asking password, when users escalating to `root` using `sudo`**

-----

1. Configure password for user `ubuntu`:
```bash
$ passwd ubuntu
```

2. Change cloud provider settings:
```bash
$ cat /etc/sudoers.d/90-cloud-init-users
ubuntu ALL=(ALL) ALL
```

-----