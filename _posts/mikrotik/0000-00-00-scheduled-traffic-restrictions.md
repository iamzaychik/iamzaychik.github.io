---
title: Scheduled traffic restrictions
category: Mikrotik
date: 2019-04-15
---

---

*Schedule MikroTik traffic restrictions for a client.*

```bash
/ip firewall filter
add action=drop chain=input comment="Restrict access to Internet for %user% from 13:00 to 16:00" disabled=no src-address=192.168.0.100 time=\
13h-15h59m59s,sun,mon,tue,wed,thu,fri,sat
```

---
