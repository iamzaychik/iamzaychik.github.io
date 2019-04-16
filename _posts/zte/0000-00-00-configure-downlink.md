---
title: Configure downlink
category: Zte
date: 2019-04-15
---

-----

* Loopback:
```bash
set loopdetect port 25 enable
set loopdetect extend port 25 enable
```

* DHCP-snooping:
```bash
set dhcp port 25 cascade
```

* IPTV:
```bash
config nas
iptv port 25 service start
iptv port 25 package id-list 0
```

-----