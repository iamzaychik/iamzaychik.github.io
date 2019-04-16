---
title: Update firmware
category: Zte
date: 2019-04-15
---

-----

* SI-series:
```bash
<FW>=kernel.z
```

* E-series:
```bash
<FW>=zImage
```

-----

* Via telnet:
```bash
conf tffs
cd /img
remove <FW>
tftp <SERVER_IP> download <FW>
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
serverip : <SERVER_IP>
netmask : 255.255.255.0
ipaddr : <SWITCH_IP>
bootfile : /img/<FW>
username : tftp_user
password : tftp_password
MAC : 00:22:93:65:36:64
[ZXR10 Boot]: zte
[BootManager]:cd /img
[BootManager]: ftp get <FW>
[BootManager]:reboot
```

-----