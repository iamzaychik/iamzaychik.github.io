---
title: Routing
category: DD-WRT
date: 2019-04-15
---

_В цій прошивці роутер за замовчуванням має адресу 192.168.1.1_

-----

1. Заходимо на веб-інтерфейс, на вкладці "Setup->Basic Setup" вибираємо Connection Type - PPPoE.

2. Вводимо username/password, отримані від провайдера. Натискаємо кнопку "Save":
<img class="wp-image-142 size-full aligncenter" src="https://zaychik.info/wp-content/uploads/basic-setup1.png" width="1024" height="648" />

3. Далі йдемо на вкладку Status->Sys-Info і запам'ятовуємо WAN MAC!
<img class="wp-image-143 size-full aligncenter" src="https://zaychik.info/wp-content/uploads/dd_wrtsystem_info_125.jpg" width="811" height="285" />

4. На вкладці Administration->Commands пишемо команду:
`ifconfig`

5. В отриманому списку знаходимо інтерфейс з нашим WAN MAC і запам'ятовуємо ім'я інтерфейсу (в моєму випадку - vlan1)

<img class="size-full wp-image-2584 aligncenter" src="https://zaychik.info/wp-content/uploads/dd-wrt_wan_mac.jpg" alt="" width="542" height="546" />

6. Тепер вставляємо наступний в наступний код свої параметри локальної мережі:
`ifconfig vlan1 down
ifconfig vlan1 ваш_локальный_іп netmask 255.255.252.0
ifconfig vlan1 up
route add -net 91.105.204.0 netmask 255.255.255.0 gw 10.x.x.5`
[*] Натискаємо кнопку "Save Startup".

7. Прокидаємо NAT з домашньої мережі на наш інтерфейс. Вводимо:
`iptables -A FORWARD -s 192.168.1.0/24 -j ACCEPT
iptables -A FORWARD -d 192.168.1.0/24 -j ACCEPT
iptables -t nat -A POSTROUTING -o vlan1 -s 192.168.1.0/24 -j MASQUERADE`

[*] Натискаємо кнопку "Save Firewall"!
[*] Потім "Managment--->Reboot Router"

**Увага! Роутер будет завантажуватися трошки довше, ніж звичайно!**.
[*] Налаштовуємо Wireless на свій розсуд.
-----