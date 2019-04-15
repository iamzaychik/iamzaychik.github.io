---
title: Basic commands
---

_Чого тільки не придумають Жонг Сінг і компанія, ой вей._
-----


**Reset to default**
1. При загрузці комутатора чекаємо надпису "Press any key to stop auto-boot...", нажимаємо будь-яку клавішу, потім:
`[ZXR10 Boot]:zte
[Password]zxr10`

2. Таким чином ми опинилися в бут-режимі. Дивимося, які файли у нас є:
`[BootManager]:ls`

3. Видаляємо файли конфігурації:

SI-серія:
`[BootManager]:del running.cfg
[BootManager]:del startcfg.txt
[BootManager]:reboot`

E-серія:
`[BootManager]:cd cfg
[BootManager]:ls
[BootManager]:rm startrun.dat
[BootManager]:reboot`

4. Після перезавантаження:
`login:admin
password:zhongxing`
-----

**Reset password from SNMP**
1. Ідемо * <a href="ftp://91.206.19.52/frimware/ZTE/" target="_blank">сюди</a>, качаємо архів мібів, Або понятно куди, там вже скачано.
2. Беремо чудофайл ES2900E.mib, вкидаємо в mibbrowser
3. Шукаємо loginUser/userTable
4. Робимо йому Table View
5. За допомогою SNMP SET міняємо значення полів priviledge i loginPass на наш парольчик
6. Ісключітільно!
<img class="aligncenter wp-image-1580 size-full" src="https://zaychik.info/wp-content/uploads/zte_reset_pass.jpg" width="1067" height="883" />
-----

**Upgrade firmware**
1. Через telnet:
`conf tffs
cd /img
remove zImage (E-серія)
remove kernel.z (SI-серія)
tftp ***.***.***.*** download zImage (E-серія)
tftp ***.***.***.*** download kernel.z (SI-серія)
exit
reboot`

2. Через BootManager:
При загрузці комутатора чекаємо надпису "Press any key to stop auto-boot...", нажимаємо будь-яку клавішу, потім:
`[ZXR10 Boot]: c
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
[BootManager]:reboot`
-----

**Change IP**
1. Создаем влан, включаем его, выдаем на порты:
`create vlan *** name root_***`
`set vlan *** enable
set vlan *** add port *** tag
`

2. Создаем новый интерфейс в нашем влане:
`conf router
set ipport 2 ipaddress A.B.C.D/M
set ipport 2 vlan ***
set ipport 2 enable`

3. Пингуем новый интерфейс. Заходим на него:
`conf router
show iproute
clear iproute 0.0.0.0 0.0.0.0 172.***.***.*** (удаляем дефолтный маршрут)
iproute 0.0.0.0 0.0.0.0 172.***.***.*** (задаем новый маршрут)
set ipport 1 dis (выключаем старый интерфейс)`
-----

**Speed**
1. На старому:
`set bandwidth feport *** ingress session 2 rate 512
set bandwidth feport *** ingress session 2 enable
set bandwidth feport *** egress on rate 512`

2. На новому:
`set qos traffic-limit fe-port *** data-rate 10000
set qos traffic-shaping fe-port *** data-rate 10000 burst-size 64`
-----

**Downlinks**
1. Проверка петли:
`set loopdetect port *** enable
set loopdetect extend port *** enable`

2. DHCP:
`set dhcp port *** cascade`

3. IPTV:
`config nas
iptv port *** service start
iptv port *** package id-list 0`
-----

**Команди собі всякі**
`show vct port 2 - міряємо довжину кабеля`
-----