---
title: Example
category: IPtables
date: 2019-04-15
---

**Створюємо файл /etc/iptables.rules, в ньому пишемо:**
`*filter`
`-A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT`
`-A INPUT -i lo -j ACCEPT`

`# SSH`
`-A INPUT -p tcp --dport 22 -s A.B.C.D/M -j ACCEPT`

`# FTP`
`-A INPUT -p tcp --dport 21 -s A.B.C.D/M -j ACCEPT`

`# TFTPD`
`-A INPUT -p udp --dport 69 -s A.B.C.D/M -j ACCEPT`

`# SNMPD`
`-A INPUT -p udp --dport 161 -s A.B.C.D/M -j ACCEPT`

`# HTTP, HTTPS`
`-A INPUT -p tcp -m multiport --dports 80,443 -j ACCEPT`

`# ICMP PING`
`-A INPUT -p icmp --icmp-type echo-request -j ACCEPT`

`# CLOSE ALL PORTS`
`-A INPUT -j DROP`
`-A FORWARD -j DROP`

`COMMIT`
_Тут має бути пустий рядок_

-----

**Для автозавантаження:**
**1. Створюємо файл:**
`mcedit /etc/network/if-pre-up.d/iptables`

**2. Вставляємо туди:**
`#!/bin/bash`
`/sbin/iptables-restore &lt; /etc/iptables.rules`

**3. Даємо права на виконання:**
`chmod +x /etc/network/if-pre-up.d/iptables`
-----