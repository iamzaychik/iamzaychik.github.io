---
title: Drop outgoing traffic for client
category: Mikrotik
date: 2026-04-24
---

-----

```bash
/ip firewall filter add chain=forward src-address=192.168.1.100 action=drop comment="Block internet for 192.168.1.100"
```

-----
