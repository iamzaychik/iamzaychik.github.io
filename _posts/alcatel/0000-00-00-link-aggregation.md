---
title: Link aggregation
category: Alcatel
date: 2019-04-15
---

-----

https://en.wikipedia.org/wiki/Link_Aggregation_Control_Protocol
`LAG -  Link Aggregation Group`

-----

```
lacp linkagg 1 size 2 admin state enable
lacp linkagg 1 name "Link-1"
lacp linkagg 1 actor admin key 1
lacp agg 1/50 actor admin key 1
lacp agg 1/49 actor admin key 1
vlan *** 802.1q X - X = lagg id
```

-----