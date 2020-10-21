---
title: Fix VPN local resolving on 20.04
category: Ubuntu
date: 2020-10-21
---

-----

```bash
# Install good resolver
$ sudo apt install resolvconf

# Disable default resolver
$ systemctl disable systemd-resolved

# Add new one to configs
$ nano /etc/NetworkManager/NetworkManager.conf:
[main]
dns=default
rc-manager=resolvconf
```

-----

[Source](https://cdnnow.ru/blog/dnslocal/)

-----
