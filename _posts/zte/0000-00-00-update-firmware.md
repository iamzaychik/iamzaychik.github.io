---
title: Update firmware
category: Zte
date: 2019-04-15
---

-----

* Via telnet:
```bash
conf tffs
cd /img
remove zImage (E-серія)
remove kernel.z (SI-серія)
tftp ***.***.***.*** download zImage (E-серія)
tftp ***.***.***.*** download kernel.z (SI-серія)
exit
reboot
```

-----

* Via BootManager:
After boot wait for `Press any key to stop auto-boot...` and press any key:
```bash
[ZXR10 Boot]: c
boot location [0:Net,1:Flash] : 1
actport : 1
serverip : 10.40.91.3
netmask : 255.255.255.0
ipaddr : 10.40.91.4
bootfile : /img/zImage
username : tftp_user
password : tftp_password
MAC : 00:22:93:65:36:64
[ZXR10 Boot]: zte
[BootManager]:cd /img
[BootManager]: ftp get zImage
[BootManager]:reboot
```

-----