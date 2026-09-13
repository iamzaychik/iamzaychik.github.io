---
title: Running services
category: CentOS
date: 2019-04-15
---

---

* The syntax is as follows for CentOS/RHEL 6.x and older (pre systemd):

```bash
$ service --status-all
$ service --status-all | more
$ service --status-all | grep ntpd
$ service --status-all | less
```

---

* The syntax is as follows for CentOS/RHEL 7.x+:

```bash
$ systemctl
$ systemctl | more
$ systemctl | grep httpd
$ systemctl list-units --type service
$ systemctl list-units --type mount
```

* To list all services:

```bash
$ systemctl list-unit-files
```

---

[Source](https://www.cyberciti.biz/faq/check-running-services-in-rhel-redhat-fedora-centoslinux)

---
