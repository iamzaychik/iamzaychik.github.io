---
title: Knockd
category: etc
date: 2019-04-15
---

**Knockd** - це демон, який «слухає» мережевий інтерфейс і якщо «почув», що йдуть запити на визначені Вами порти, то дозволяє додати правило для вашого IP на визначений наперед порт в iptables.
-----
**1. Налаштовуємо порти, в які стукатимемо, протокол, по якому стукатимемо і таймаут стукання. А також команду, яку потрібно виконувати:**
`cat /etc/knockd.conf
[options]
UseSyslog
logfile = /var/log/knockd.log`

`[openSSH]
sequence = 111:udp,222:udp,333:udp
seq_timeout = 5
command = /path/to/script/open_ports_knock.sh %IP%
tcpflags = syn`

`#[closeSSH]
# sequence = 333:udp,222:udp,111:udp
# seq_timeout = 5
# command = /path/to/script/close_ports_knock.sh %IP%
# tcpflags = syn`

**2. Відкриваємо для ІР, з якого стукаємо, ssh i ftp:**
`cat open_ports_knock.sh
#!/bin/bash
/sbin/iptables -I INPUT 11 -s $1 -p tcp --dport 2022 -j ACCEPT
/sbin/iptables -I INPUT 12 -s $1 -p tcp --dport 21 -j ACCEPT`

**3. З клієнта стукаємо на сервер:**
`knock server.name 111:udp 222:udp 333:udp`
-----