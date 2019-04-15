---
title: Sudo without password
category: Ubuntu
date: 2019-04-15
---

_Не можна просто так взяти, і вісудо!_
-----
1. Православно редагуємо файл /etc/sudoers :
`root@client1:~# visudo`

2. Вставляємо:
`user1 ALL=(ALL:ALL) NOPASSWD:ALL`

3. Але додавати користувача треба в самий кінець файла, бо рядки:
`%admin ALL=(ALL) ALL
%sudo   ALL=(ALL:ALL) ALL`

ламають нам всю хатку, якщо наш запис над ними!
-----