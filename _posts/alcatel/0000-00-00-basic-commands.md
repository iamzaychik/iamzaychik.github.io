---
title: Basic commands
category: Alcatel
date: 2019-04-15
---

-----

* [Ports](###Ports)
* [ports1](#ports1)
* [ports2](#ports2)
* [ports3](#ports3)
* [VLAN](###VLAN)
* [IP](###IP)
* [SNMP](###SNMP)
* [NTP](###NTP)
* [Stacking](###Stacking)
* [System](###System)

-----

### Ports
# ports1
##ports2
### ports3

* Show all:     
```
show interfaces port
```

* Show port 1/1:
```
show interfaces 1/1 port
```

* Full status:  
```
show interfaces 1/1
```

* On/off:       
```
interfaces 1/1 admin [up | down]
```

* Rename:       
```
interfaces 1/1 alias dl:new:port:alias
```

* Get MACs:     
```
show mac-address-table 1/1
```

* Get errors:   
```
show interfaces 1/1 counters errors
```

* Clear stats:  
```
interfaces 1/1 no l2 statistics
```

-----

### VLAN

* Show all:          
```
show vlan
```

* Show vlan tag 111: 
```
show vlan 111
```

* Show vlans on port:
```
show vlan port 1/1
```

* Create:            
```
vlan 111 1x1 stp disable flat stp disable name new_vlan
```

* Remove:            
```
no vlan 111
```

* On/off:            
```
vlan 111 [enable | disable]
```

* Set tagged:        
```
vlan 111 802.1q 1/1
```

* Remove tagged:     
```
vlan 111 no 802.1q 1/1
```

* Set untagged:      
```
vlan 111 port default 1/1
```

* Remove untagged:   
```
vlan 111 no port default 1/1
```

* Get MACs:          
```
show mac-address-table 111
```

* Bind NAS mac on UL:
```
mac-address-table 11:11:11:11:11:11 1/25 111
```

-----

### IP

* Show interfaces:  
```
show ip interface
```

* Set MNG interface:
```
ip interface Management address 111.111.111.111 mask 255.255.255.0 vlan 111 no forward
```

-----

### SNMP:

* Start service:         
```
ip service snmp
```

* Accept local passwords:
```
aaa authentication snmp "local"
```

* Set password:
```
snmp security no security
user snmp password qwerty123 READ-ONLY all no auth
snmp community map qwerty123 user "snmp]on
```

* Get traps recipient:
```
show snmp station
```

* Set traps recipient:
```
snmp authentication trap disable
snmp station A.B.C.D 162 "snmp]v2 enable
```

-----

### NTP

* Start service:
```
ntp client enable
```

* Set server:   
```
ntp server 111.111.111.111 prefer
```

* Set timezone:
```
system timezone eet
system daylight savings time enable
```

-----

### Stacking

* Status:            
```
show stack topology
```

* Rename slot 2 to 4:
```
stack set slot 2 saved-slot 4
```

* Mode 6850Е to 6850:
```
stack set slot 1 saved-mode os6850
```

-----

### System

**If you get Out Of Memory error - delete K2diag.img from working/ and certified/.**

* Show config:   
```
show configuration snapshot
```

* Sync config:   
```
copy working certified flash-synchro
```

* Save config:   
```
write memory
```

* Show CPU usage:
```
show health all cpu
```

* Show logs:     
```
show log swlog
```

* Show services: 
```
show ip service
```

* Create user:   
```
user admin password qwerty read-write all
```

* Get slot MAC:  
```
show chassis
```

* Reboot:        
```
reload working no rollback-timeout
```

-----

### Links

* [Habr](http://habrahabr.ru/sandbox/64738/)
* [Basic 1](http://it-notepad.ru/%D0%B1%D0%B0%D0%B7%D0%BE%D0%B2%D1%8B%D0%B5-%D0%BA%D0%BE%D0%BC%D0%B0%D0%BD%D0%B4%D1%8B-%D0%BF%D1%80%D0%B8-%D1%80%D0%B0%D0%B1%D0%BE%D1%82%D0%B5-%D1%81-alcatel.html)
* [Basic 2](http://www.latouche.info/admin/user_guides/omniswitch.html)
* [Basic 3](http://aboutnetworkblog.blogspot.com/2013/05/alcatel-omniswitch.html)

-----