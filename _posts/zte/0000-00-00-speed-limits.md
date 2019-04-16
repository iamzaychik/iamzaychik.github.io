---
title: Speed limits
category: Zte
date: 2019-04-15
---

-----

* SI-series:
```bash
set bandwidth feport [ 1-24 ] ingress session 2 rate 512
set bandwidth feport [ 1-24 ] ingress session 2 enable
set bandwidth feport [ 1-24 ] egress on rate 512
```

* E-series:
```bash
set qos traffic-limit fe-port [ 1-24 ] data-rate 10000
set qos traffic-shaping fe-port [ 1-24 ] data-rate 10000 burst-size 64
```

-----