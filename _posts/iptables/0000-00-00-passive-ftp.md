---
title: Passive FTP
category: IPtables
date: 2019-04-15
---

-----

```bash
iptables -A FORWARD -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
modprobe nf_conntrack_ftp
modprobe ip_conntrack_ftp
```

-----