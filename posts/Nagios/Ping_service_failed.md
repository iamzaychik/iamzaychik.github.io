Title: Nagios. Ping service failed
Pub date: 14.08.2017
Category: Centreon, Nagios, 

**Якшо сервіс Ping видає помилку:**
`check_icmp: Failed to obtain ICMP socket: Operation not permitted`

**Застосовуємо до плагіна check_icmp такі права**
`chown root check_icmp`
`chgrp root check_icmp`
`chmod u+s check_icmp`
`chmod g+s check_icmp`
-----