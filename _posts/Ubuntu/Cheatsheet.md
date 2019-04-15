---
title: Cheatsheet
---

_Треба все класти в сухий і прохолодний бложик.
І довгими зимніми вечорами перечитувати._

-----

**Система**

**Інформація про версію системи:**
`cat /etc/*-release`
`lsb_release -a`
`cat /proc/version`

**Інформація про версію ядра і розрядність системи:**
`uname -a`

**Автозавантаження сервісів:**
`apt install sysv-rc-conf`

**Встановити відсутній пакет ifconfig:**
`apt install net-tools`

**Встановити утиліту ping:**
`apt install inetutils-ping`

**Timezone configuration:**
`dpkg-reconfigure tzdata`
`ln -fs /usr/share/zoneinfo/Europe/Kiev /etc/localtime`

**Видалити старі ядра:**
`apt purge $(dpkg -l 'linux-*' | sed '/^ii/!d;/'"$(uname -r | sed "s/\(.*\)-\([^0-9]\+\)/\1/")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d' | head -n -1) -y`

**Дізнатися свій зовнішній IP з консолі:**
`wget -O - -q icanhazip.com`

**Додати користувача Squid:**
`htpasswd /etc/squid3/users $1`

**Дозволити користувачу використання sudo:**
`usermod -aG sudo,adm  USER`
`gpasswd -a USER sudo`

**Дізнатися користувачів, які входять в групу:**
`getent group GROUPNAME| awk -F: '{print $4}'`

**Створити swap:**
`fallocate -l 2G /swapfile`
`chmod 600 /swapfile`
`mkswap /swapfile`
`swapon /swapfile`

`mcedit /etc/fstab`
`/swapfile none swap sw 0 0`

**Для перегляду console output в інтерактивному режимі:**
`watch -n 5 'ps -aux | sort -nrk 4 | head'`

-----

**HARDWARE**

**Інформація про встановлені жорсткі диски:**
`lsblk -io KNAME,TYPE,SIZE,MODEL`

**Додавання нового диску:**
1. Створюємо папку для монтування:
`mkdir /data`
2. Знаходимо ідентифікатор нашого диска:
`fdisk -l`
3. Відкриваємо редактор дисків:
`fdisk /dev/sdx`
4. Вводимо потрібне:
`d ...to delete the current partition
n ...to create a new partition
p ...to specify it as a PRIMARY partition
1 ...to set it as the 1ST primary partition
w ...to write the changes.`
5. Перевіряємо, чи розділ створився:
`fdisk -l`
6. Форматуємо:
`mkfs.ext4 /dev/sdx1`
7. Знаходимо ідентифікатор розділу:
`blkid`
8. Додаємо запис в /etc/fstab для автомонтування:
`UUID=XXXXX-XXXXX-XXX /data ext4  defaults 0 2`
9. Монтуємо:
`mount -a`
10. Перевіряємо:
`df -h`

-----

**Відновлення втраченого пароля:**
1. При завантаженні зажимаємо Shift, в меню вибору пунктів завантаження жмемо E для редагування
2. В кінці рядка kernel дописуємо:
`init=/bin/bash`
3. Після цього завантажиться shell, в якому монтуємо корінь системи для запису:
`mount -o remount,rw /`
4. Міняємо пароль:
`passwd`
5. Записуємо дані з кеша на диск:
`mount -o remount,ro /`

-----

**Bash**

**Вивести значення, які співпадають в масивах:**
`echo ${Array1[@]} ${Array2[@]} | tr ' ' '\n' | sort | uniq -d`

**Вивести користувача, від якого запущений файл:**
`name="$(whoami)";
echo $name;`

* <a href="http://nsk.lug.ru/system/10-seconds-guide-to-bash-shell/">10 секундное руководство по Bash</a>

-----

**Upload/Download:**

**FTP Download:**
`fetch ftp://user:password@A.B.C.D:21/path/to/file/file.ext`

**FTP Upload:**
`curl -T file.ext -u user:password ftp://A.B.C.D/path/to/file/file.ext`

**Завантажити всі файли зі сторінки, які мають розширення mp3:**
`wget -r -l1 -t1 -nd -N -np -A.mp3 -erobots=off http://site.address/page`

-----

**Файли, пошук**

**Вивести рядки, які є унікальнимиу файлі:**
`sort input.txt | uniq -u > output.txt`

**Пошук файлів по вмісту:**
`grep -rl 'text' /path`

**Знайти файл по вмісту і замінити щось в ньому:**
`grep 'text' -P -R -I -l * | xargs sed -i 's/text/replace/g'`

**Пошук файлів в дереві каталогів по типу і запис їх імен у файл (включно зі шляхом):**
`find /path -iname *.mp3 -print > /path/file.txt`

**Видалити файли/папки, які старіші, ніж 14 днів :**
`find /mnt -type f -mtime +14 -print0 | xargs -0 rm -rf`
_Для видалення файлів, які створені пізніше, ніж 14 днів тому: -mtime -14_

**Створити файл заданого розміру:**
`dd if=/dev/zero of=/path/to/file/filename bs=1M count=1024`
_if – звідки беремо дані;
of – де створити файл;
bs – розмір блоку даних, які будуть записані за один раз;
count – кількість блоків даних;
розмір файла = bs*count_

**Архівація файлів з паролем:**

`zip -er folder.zip file - архівувати
zip -P password -r folder.zip folder - видобути`

`
```This will prompt you for a password. Give it, and that will create a password-protected zip file from that folder.**``**
<ul>
 	***`-e`** enables encryption for your zip file. This is what makes it ask for the password.
 	***`-r`** makes the command recursive, meaning that all the files inside the folder will be added to the zip file.
 	***`folder.zip`** is the name of the output file.
 	***`folder`** is the folder you want to zip.
</ul>

-----

**Оператори порівняння:**
`-lt (&lt; )`
`-gt (>)`
`-le (&lt; =)`
`-ge (>=)`
`-eq (==)`
`-ne (!=)`

-----

**Логи**

**Dmesg**
**Unix timestamp convert:**
`$ date -d@1462949293`
`Срд Май 11 09:48:13 EEST 2016`

**dmesg timestamp convert:**
`dmesg|perl -pE '/\[\s*(\d+\.\d+)\]/; $t=scalar localtime time-$1/100; s/\[\s*(\d+\.\d+)\]/[$t]/;'`

-----

**Права**

**Встановити права доступу на запис у папку та на всі підпапки і файли:**
`chmod -R 755 /home/user`
_-R - давати права рекурсивно
Перша цифра - права користувача
Друга - права групи
Третя - права інших
7 - rwx - читати, писати, виконувати
6 - rw- - читати, писати
5 - r-x - читати, виконувати
4 - r-- - читати
3 - -wx - писати, виконувати
2 - -w- - писати
1 - --x - виконувати
0 - --- - неможливо виконувати дії_

**Для зміни власника файлів чи папок використовуємо chown:**
`chown -R user:users /home/user`

**Змінити права для всіх файлів і папок окремо:**
`find /var/www/nextcloud/ -type f -print0 | sudo xargs -0 chmod 0644`
`find /var/www/nextcloud/ -type d -print0 | sudo xargs -0 chmod 0755`

* <a href="http://www.woodwolf.ru/76/">Про права</a>

-----