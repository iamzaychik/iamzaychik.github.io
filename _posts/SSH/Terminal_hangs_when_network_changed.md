---
title: Terminal hangs when network changed
categories: SSH
date: 2019-04-15
---

**Для того, щоб уникнути зависання терміналу з відкритою ssh сесією при відключенні або переключенні мережі, додаємо в аліаси:**
`ssh_conn_params='ssh -o ServerAliveInterval=5 -o ServerAliveCountMax=1'`
**І переписуємо аліас для підключення:**
`alias my_ssh_server='$ssh_conn_params root@my.ssh.server'`
-----