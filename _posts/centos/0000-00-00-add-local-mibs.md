---
title: Add local mibs
category: CentOS
date: 2019-04-15
---

-----

1. Download to `/usr/share/snmp/mibs`
2. Go to `/etc/snmp` and create `snmp.conf` (not `snmpd.conf`)
3. Add `mibs +ALL` to `snmp.conf` 

-----