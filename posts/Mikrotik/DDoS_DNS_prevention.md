---
title: DDOS DNS prevention
---

_Anonymous на вас нема, шакали!_

-----

Якщо ми маємо гарний і потужний мікротік, а на ньому відкритий 53 порт, то бістро біжимо на нього і робимо правило фаєрвола:

* <a href="https://zaychik.info/wp-content/uploads/mikrotik_close_port_53_main1.png"><img class="aligncenter wp-image-924 size-full" src="https://zaychik.info/wp-content/uploads/mikrotik_close_port_53_main1.png" alt="" width="855" height="520" /></a>

* <a href="https://zaychik.info/wp-content/uploads/mikrotik_close_port_53_action1.png"><img class="aligncenter wp-image-923 size-full" src="https://zaychik.info/wp-content/uploads/mikrotik_close_port_53_action1.png" alt="" width="858" height="520" /></a>

Перевіряємо:
`nslookup ya.ru ***.***.***.*** - вводимо свій IP`

Якщо маємо `DNS request timed out` - все ісключітільно, закрили. Якщо ні - читаємо гугл далі.

* <a href="https://zaychik.info/wp-content/uploads/profit.jpeg"><img class="aligncenter wp-image-919 size-full" src="https://zaychik.info/wp-content/uploads/profit.jpeg" alt="" width="800" height="500" /></a>

-----