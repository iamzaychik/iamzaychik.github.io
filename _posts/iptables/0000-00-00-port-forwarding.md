---
title: Port forwarding
category: IPtables
date: 2019-04-15
---

```bash
iptables -t nat -A PREROUTING -d EXTERNAL_IP -p tcp -m tcp --dport EXTERNAL_PORT -j DNAT --to-destination LOCAL_IP:LOCAL_PORT
iptables -t nat -A POSTROUTING -d LOCAL_IP -p tcp -m tcp --dport LOCAL_PORT -j SNAT --to-source EXTERNAL_IP`
```

-----