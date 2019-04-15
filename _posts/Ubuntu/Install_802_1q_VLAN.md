---
title: Install 802 1q VLAN
categories: Ubuntu
date: 2019-04-15
---

_Добавляємо міліони вланів собі в комп’ютер, щоб було ісключітільно і все робило._

-----

*Ставимо пакет Vlan:
`sudo apt-get install vlan`
*Підгружаємо модуль Vlan (802.1q):
`sudo modprobe 8021q`
*Налаштовуємо автозавантаження модуля:
`sudo sh -c ‘grep -q 8021q /etc/modules || echo 8021q >> /etc/modules’`
*Споглядаємо список наших інтерфейсів:
`mcedit /etc/network/interfaces`
*І дописуємо туди потрібні влани:

`auto lo
iface lo inet loopback

auto eth0
iface eth0 inet manual

auto eth1
iface eth1 inet manual

auto eth1:0
iface eth1:0 inet static
address 192.168.1.2
netmask 255.255.255.0

auto eth0:0
iface eth0:0 inet static
address 10.90.90.2
netmask 255.0.0.0

auto eth1.15
iface eth1.15 inet static
address 172.16.15.2
netmask 255.255.255.0

auto eth1.22
iface eth1.22 inet static
address 172.24.0.2
netmask 255.255.0.0`