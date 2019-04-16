---
title: Basic commands
category: BDCOM
date: 2019-04-15
---

-----

* [ONU](#onu)
* [VLAN](#vlan)
* [Ports](#ports)
* [Templates](#templates)
* [Speed](#speed)
* [Optic diagnostics](#optic-diagnostics) 
* [SNMP](#snmp)
* [TFTP](#tftp)

-----

* Для того, щоб скинути пароль або повернутися до налаштувань за замовчуванням, необхідно підключитися через консольний порт і при завантаженні комутатора натиснути комбінацію Ctrl+P.

-----

### ONU

* List active:
```
show epon active-onu interface epON 0/1 1
```

* Get basic info:
```
show epon int epoN 0/1:1 onu ctc basic-info
```

* Settings database:
```
show run db-llid
```

* Deregister:
```
gepon_xxxx#config
gepon_xxxx_config#interface epon 0/1
gepon_xxxx_config_epon0/1#no epon bind-onu mac xxxx.xxxx.xxxx
```

* Enable traffic between ONU's in one PON:

```
gepon_xxxx# config
gepon_xxxx_config# interface EPON 0/1
gepon_xxxx_config_epon0/1# epon inner-onu-switch
gepon_xxxx_config_epon0/1# exit
gepon_xxxx_config# write
```

-----

### VLAN

* Tagged and untagged on the same port (xxxx - untagged, yyy - tagged):
```
epon onu port 1 ctc vlan mode trunk xxxx yyy
```

-----

### Ports

* Clear errors:
```
gepon_xxxx_config#clear mib
```

-----

### Templates

* Create:
```
gepon_xxxx#config
epon onu-config-template PON1
 cmd-sequence 1 spanning-tree guard loop
 cmd-sequence 2 epon onu all-port ctc vlan mode tag 1
 cmd-sequence 3 epon onu all-port ctc loopback detect
 cmd-sequence 4 epon onu all-port mac address-table dynamic maximum 2
 cmd-sequence 5 epon onu all-port ctc mcst tag-stripe enable
 cmd-sequence 6 epon onu all-port ctc mcst mc-vlan add 35
 cmd-sequence 7 switchport port-security dynamic maximum 2
 cmd-sequence 8 switchport port-security mode dynamic
```

* Remove:
```
no epon onu-config-template
```

* Bind to ONU:
```
epon pre-config-template xxxxxx binded-onu-llid xx
```

-----

### Speed
* Restrict speed to 512/512 Kbps:

```
epon onu port 1 ctc rate-limit 512 egress
epon onu port 1 ctc rate-limit 512 ingress
```

* Remove restriction from UL port:
```
epon sla upstream pir 1000000 cir 950000
epon sla downstream pir 1000000 cir 950000
```

-----

### Optic diagnostics

* From OLT:
```
show epon optical-transceiver-diagnosis interface epon 0/x
```

* From ONU:
```
show epon interface epON 0/x:x onu ctc optical-transceiver-diagnosis
```

-----

### SNMP

* Reboot OLT:
```
.1.3.6.1.4.1.3320.9.184.7.0
```

-----

### TFTP

* Download to OLT:
```
copy tftp:startup-config flash XXX.XXX.XXX.XXX [ENTER]
```

* Upload to TFTP:
```
copy flash:startup-config tftp XXX.XXX.XXX.XXX [ENTER]
```

-----

* [BDCOM basic](http://linuxsnippets.net/ru/snippet/%D0%B7%D0%B0%D0%BC%D0%B5%D1%82%D0%BA%D0%B8-%D0%BF%D0%BE-gpongepon-%D0%BD%D0%B0-%D0%BF%D1%80%D0%B8%D0%BC%D0%B5%D1%80%D0%B5-olt-bdcom-p3310b)
* [P3310B manual](/assets/pdf/bdcom/p3310b-manual-rus.pdf)
* [ONU tests](http://incosoft.ua/novosti/test-of-compatibility-onu-fora-na-1001c-with-olt-bdcom-p3310b.html)
* [UA.PON Dropbox](https://www.dropbox.com/sh/xwbmgzj2y26mstv/AAA9r-WYHVT0e8FKKwhVFfV_a?dl=0)

-----