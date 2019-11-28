---
title: Cheatsheet
category: Ubuntu
date: 2019-04-15
---

-----

* Autostart:

```bash
$ apt install sysv-rc-conf
```

-----

* Remove old cores:

```bash
$ apt purge $(dpkg -l 'linux-*' | sed '/^ii/!d;/'"$(uname -r | sed "s/\(.*\)-\([^0-9]\+\)/\1/")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d' | head -n -1) -y
```

-----

* Removes old revisions of snaps:

```bash
# CLOSE ALL SNAPS BEFORE RUNNING THIS
set -eu

LANG=C snap list --all | awk '/disabled/{print $1, $3}' |
    while read snapname revision; do
        snap remove "$snapname" --revision="$revision"
    done
```

-----

* Add user to sudoers:
```bash
$ usermod -aG sudo,adm  USER
OR
$ gpasswd -a USER sudo
```

* List users in group:
```bash
$ getent group GROUPNAME| awk -F: '{print $4}'
```

-----

* Interactive console output:
```bash
watch -n 5 'ps -aux | sort -nrk 4 | head'
```

-----

* Dirs by used space
```bash
$ du -sch .[!.]* * |sort -rh | head -5
```

-----

**HARDWARE**

**HDD info:**
```bash
$ lsblk -io KNAME,TYPE,SIZE,MODEL
```

**Mount new disk:**
1. Create folder:
```bash
$ mkdir /data
```
2. Find HDD identifier:
```bash
$ fdisk -l
```
3. Open disk editor:
```bash
$ fdisk /dev/sdx
```
4. Select needed option:
```bash
d ...to delete the current partition
n ...to create a new partition
p ...to specify it as a PRIMARY partition
1 ...to set it as the 1ST primary partition
w ...to write the changes.
```
5. Check new partition:
```bash
$ fdisk -l
```
6. Format partition:
```bash
$ mkfs.ext4 /dev/sdx1
```
7. Find partition identifier:
```bash
$ blkid
```
8. Add partition to /etc/fstab for mount at boot:
```bash
UUID=XXXXX-XXXXX-XXX /data ext4  defaults 0 2
```
9. Mount:
```bash
$ mount -a
```
10. Check mounts:
```bash
$ df -h
```

-----

**Restore lost password:**
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

-----
