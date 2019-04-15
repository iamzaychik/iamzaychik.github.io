---
title: Public keys authorization
---

_Безпарольний доступ, по нашому._
-----
**Робимо там, звідки ми будемо заходити:**
1. Вводимо:
`user@client:~$ ssh-keygen -t rsa -b 4096`
2. Запам’ятовуємо папку з файлами:
`Your public key has been saved in /home/user/.ssh/id_rsa.pub.`
3. Клацаємо Enter кілька разів;
4. В папці, яку ми мали не забути, маємо 2 нові файли:
`id_rsa id_rsa.pub`
5. Перший - ніколи нікому не показуємо, з другим робимо:
`user@client:~$ cat /home/user/.ssh/id_rsa.pub`
6. Копіюємо вміст.

**Там, куди будемо заходити:**
1. Перевіряємо, чи є папка /home/user/.ssh/ та файл authorized_keys у ній;
2. Якщо ні:
`user@server:~$ mkdir -m 700 .ssh
user@server:~$ cd .ssh
user@server:~/.ssh$ touch authorized_keys
user@server:~/.ssh$ chmod 600 authorized_keys
user@server:~/.ssh$ mcedit authorized_keys`
3. Вставляємо наші дані;
(!) вони мають бути одним рядком у файлі
4. Перевіряємо, має пустити без парольчика:
`user@client:~$ ssh user@server`
-----

**P.S. **Якщо всеодно питає парольчик, обов’язково перевіряйте права на папки і файли, аж до /home/user!
**P.P.S.** Якщо заходити під рутом, то для рута теж потрібно згенерувати ключ і скопіювати його на сервер. А заходити під юзером:
`root@client:~$ ssh user@server`
-----