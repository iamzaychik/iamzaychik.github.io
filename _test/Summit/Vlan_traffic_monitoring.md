---
title: Vlan traffic monitoring
category: Summit
date: 2019-04-15
---

_Потім оподатковуємо і маємо профіт та повагу._
-----


Starting in EXOS 12.5  there is support for VLAN statistics and for that there is a separate private SNMP table (extremePortVlanStatsTable)

As soon you have enabled VLAN statistics on a VLAN /port combination you can collect that using the following OID:

`1.3.6.1.4.1.1916.1.2.8.2`

You can use below command for vlan statistics

**configure ports ** [_port_list_ | _all_] **monitor vlan **vlan_name **{_rx-only_ | _tx-only_}

But another point to be noted is , vlan statistics will occupy your ACL slice so configuring too many ports can lead to in-sufficient resources . While implementing have a check on your ACL slice resources.

-----