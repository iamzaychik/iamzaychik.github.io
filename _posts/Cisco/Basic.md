---
title: Basic
---

**Створити користувача:**
`username admin secret 1234`
`enable secret admin`
`line vty 0 4`
`logging synchronous`
`login local`

**Установка пароля для консолі:**
`R1(config)#line console 0`
`R1(config-line)#password cisco`
`R1(config-line)#login`

**Установка пароля для telnet:**
`R1(config)#line vty 0 4`
`R1(config-line)#password cisco`
`R1(config-line)#login`

**Видалення консольного пароля:**
`router(config)#line console 0`
`router(config-line)#no login`
`router(config-line)#no password`

**Видалення пароля Secret:**
`router(config)#no enable secret`

**Перевірка параметра Register:**
`router#show version`

**Задание адреса-маски и административное включение интерфейса:**
`R1(config)#interface Serial0/0/0`
`R1(config-if)#ip address 192.168.2.1 255.255.255.0`

**Административное выключение интерфейса маршрутизатора:**
`router(config)#int s0/0`
`router(config-if)#shutdown`

**Включение интерфейса Serial:**
`router#configure terminal`
`router(config)#interface s0/0`
`router(config-if)#no shutdown`

**Установка тактовой частоты для интерфейса Serial:**
`router(config-if)#clock rate 64000`

**Проверка интерфейса Serial:**
`router(config)#show interfaces s0/0`

**Добавить статическую запись в таблицу маршрутизации:**
`Router(config)#ip route 10.10.10.0 255.255.255.0 {ip-address | exit-interface }`

**Посмотреть таблицу маршрутизации:**
`R1#show ip route`

**Посмотреть интерфейсы:**
`R1#show interfaces`

**Посмотреть интерфейсы и их статистику в табличном виде:**
`R1#show ip interface brief`

**Посмотреть соседей устройства:**
**Router#show cdp neighbors**
**Router#show cdp neighbors detail**

**Глобальное выключение CDP (cisco discovery protocol):**
`Router(config)#no cdp run`

**Выключение CDP (cisco discovery protocol) на интерфейсе:**
`Router(config-if)#no cdp enable`

**Статус DTE/DCE:**
`router#show controllers s0/0`

**Сохранение конфигурации:**
`router#copy running-config startup-config`

**Загрузка файла (например IOS) с TFTP сервера:**
`R#copy tftp flash:`

**Резервное копирование Startup конфига на TFTP:**
`router#copy startup-config tftp`

**Сохранение Running конфига:**
`router#write memory`
`router#copy run st`

Удаление конфигурации NVRAM
router#write erase

Проверка конфигурации NVRAM
router#show startup-config

Посмотреть таблицу MAC адресов свитча
show mac-address-table

Статически прописать MAC адрес в таблицу адресов свитча
#mac-address-table static MAC address vlan {1-4096, ALL} interface interface-id command

Создать VLAN
S1(config)#vlan 20
S1(config-vlan)#name students

Создаем интерфейс для управления VLAN
S1(config)#interface vlan 20
S1(config-if)#ip address 10.2.2.1 255.255.255.0
S1(config-if)#no shutdown

Назначить порт для доступа к VLAN
S1(config)#interface fa0/18
S1(config-if)#switchport mode access
S1(config-if)#switchport access vlan 20

Назначить порт для транка Cisco Dynamic Trunking protocol
S1(config)#interface fa0/18
или S1(config-if)#switchport mode trunk
ли S1(config-if)#switchport mode dynamic auto
или S1(config-if)#switchport mode dynamic desirable
или S1(config-if)#switchport mode nonegotiate

какие vlan пропускать через trunk
S1(config-if)#switchport trunk allowed vlan 18 (можно указывать диапазоны или all)

Переключиться обратно из trunk в режим доступа
S1(config-if)#no switchport trunk allowed vlan
S1(config-if)#no switchport trunk native vlan
S1(config-if)#switchport mode access

Разрешить трафик местного (native) VLAN через порт транка
S1(config)#interface fa0/18
S1(config-if)#switchport mode trunk
S1(config-if)#switchport trunk native vlan 18
S1#show interfaces fa0/18 switchport

Посмотреть статистику VLAN
или show vlan brief
или show vlan id 20
или show vlan name students
или show vlan summary

Посмотреть статистику портов свитча
show interfaces vlan 20
show interfaces fa0/18 switchport

Назначить шлюз по умолчанию
S1(config)#ip default gateway 1.2.3.4

Включить протокол динамической маршрутизации
R1(config)#router протокол (rip, eigrp и т.д.)
R1(config-router)#network network_number [wildcard_mask]
R1(config-if)#bandwidth 64

R1(config-router)#passive-interface s 0/0/0 Выключить динамическую маршрутизацию на интерфейсе
или
R1(config-router)#passive-interface default Выключить динамическую маршрутизацию на всех интерфейсах
а потом на некоторых включить:
R1(config-router)#no passive-interface s 0/0/0
-----
* <a title="Пишуть люди" href="http://network.xsp.ru/4_10.php">Всякі команди</a>
-----