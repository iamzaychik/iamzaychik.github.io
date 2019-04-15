---
title: Update firmware
category: Alcatel
date: 2019-04-15
---

-----

1. [Download firmware](http://support.alcadis.nl/downloads/Alcatel-Lucent/OmniSwitch/OS6850%20-%20EOS/)
2. Configure [management interface]({% link /alcatel/cheatsheet.html#ip %})
3. Enable FTP:
```
ip service ftp
aaa authentication ftp local
```
3. Install FileZilla:
```
sudo apt-get install filezilla
```
4. Browse Alcatel with FileZilla and upload files to `/flash/working`
5. Reboot switch:
```
reload working no rollback-timeout
```
6. Synchronize stack:
```
copy working certified flash-synchro
```
7. Check firmware:
```
show microcode
```

-----