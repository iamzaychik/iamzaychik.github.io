---
title: Monitored partitions
categories: SNMPD
date: 2019-04-15
---

Щоби мати по snmp інформацію про заповненість дисків, маємо на хості у файл `/etc/snmp/snmpd.conf` вписати таке:
`includeAllDisks`

Якшо ж воно не запрацює, то можна спробувати ще так:
`disk /`
`disk /usr`
`disk /var`

-----