Title: SNMPD. Monitored partitions
Pub date: 25.11.2016
Category: SNMP, 

Щоби мати по snmp інформацію про заповненість дисків, маємо на хості у файл `/etc/snmp/snmpd.conf` вписати таке:
`includeAllDisks`

Якшо ж воно не запрацює, то можна спробувати ще так:
`disk /`
`disk /usr`
`disk /var`

-----