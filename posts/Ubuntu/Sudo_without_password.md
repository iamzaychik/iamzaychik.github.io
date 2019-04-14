Title: Ubuntu. Sudo without password
Pub date: 20.07.2016
Category: Ubuntu, 

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