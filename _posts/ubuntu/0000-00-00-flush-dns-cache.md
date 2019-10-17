---
title: Flush DNS cache
category: Ubuntu
date: 2019-10-10
---

-----

* Flush dns cache:

```bash
$ sudo systemd-resolve --flush-caches
```

*OR*

```bash
$ sudo systemctl restart systemd-resolved
```

-----

* Check status:

```bash
$ sudo systemd-resolve --statistics
```

-----

[Source](https://linuxhint.com/flush_dns_cache_ubuntu/)

-----