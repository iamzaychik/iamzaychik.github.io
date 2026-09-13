---
title: Cheatsheet
category: Alcatel
date: 2019-04-15
---

---

* [Ports](#ports)
* [VLAN](#vlan)
* [IP](#ip)
* [SNMP](#snmp)
* [NTP](#ntp)
* [Stacking](#stacking)
* [System](#system)

---

### Ports

* Show all:

```text
show interfaces port
```

* Show port 1/1:
```text
show interfaces 1/1 port
```

* Full status:

```text
show interfaces 1/1
```

* On/off:

```text
interfaces 1/1 admin [up | down]
```

* Rename:

```text
interfaces 1/1 alias dl:new:port:alias
```

* Get MACs:

```text
show mac-address-table 1/1
```

* Get errors:

```text
show interfaces 1/1 counters errors
```

* Clear stats:

```text
interfaces 1/1 no l2 statistics
```

---

### VLAN

* Show all:

```text
show vlan
```

* Show vlan tag 111:

```text
show vlan 111
```

* Show vlans on port:

```text
show vlan port 1/1
```

* Create:

```text
vlan 111 1x1 stp disable flat stp disable name new_vlan
```

* Remove:

```text
no vlan 111
```

* On/off:

```text
vlan 111 [enable | disable]
```

* Set tagged:

```text
vlan 111 802.1q 1/1
```

* Remove tagged:

```text
vlan 111 no 802.1q 1/1
```

* Set untagged:

```text
vlan 111 port default 1/1
```

* Remove untagged:

```text
vlan 111 no port default 1/1
```

* Get MACs:

```text
show mac-address-table 111
```

* Bind NAS mac on UL:
```text
mac-address-table 11:11:11:11:11:11 1/25 111
```

---

### IP

* Show interfaces:

```text
show ip interface
```

* Set MNG interface:

```text
ip interface Management address 111.111.111.111 mask 255.255.255.0 vlan 111 no forward
```

---

### SNMP

* Start service:

```text
ip service snmp
```

* Accept local passwords:

```text
aaa authentication snmp "local"
```

* Set password:

```text
snmp security no security
user snmp password qwerty123 READ-ONLY all no auth
snmp community map qwerty123 user "snmp]on
```

* Get traps recipient:

```text
show snmp station
```

* Set traps recipient:

```text
snmp authentication trap disable
snmp station A.B.C.D 162 "snmp]v2 enable
```

---

### NTP

* Start service:

```text
ntp client enable
```

* Set server:

```text
ntp server 111.111.111.111 prefer
```

* Set timezone:

```text
system timezone eet
system daylight savings time enable
```

---

### Stacking

* Status:

```text
show stack topology
```

* Rename slot 2 to 4:

```text
stack set slot 2 saved-slot 4
```

* Mode 6850Е to 6850:

```text
stack set slot 1 saved-mode os6850
```

---

### System

*If you get `Out Of Memory` error - delete `K2diag.img` from `working/` and `certified/`.*

* Show config:

```text
show configuration snapshot
```

* Sync config:

```text
copy working certified flash-synchro
```

* Save config:

```text
write memory
```

* Show CPU usage:

```text
show health all cpu
```

* Show logs:

```text
show log swlog
```

* Show services:

```text
show ip service
```

* Create user:

```text
user admin password qwerty read-write all
```

* Get slot MAC:

```text
show chassis
```

* Reboot:

```text
reload working no rollback-timeout
```

---

[Basic 2](http://www.latouche.info/admin/user_guides/omniswitch.html)
[Basic 3](http://aboutnetworkblog.blogspot.com/2013/05/alcatel-omniswitch.html)

---
