---
title: Basic commands
categories: Alcatel
date: 2019-04-15
---

-----
**Порт**
Показати всі:
`show interfaces port`

Показати конкретний:
`show interfaces 1/1 port`

Розширений статус:
`show interfaces 1/1`

Вкл/викл:
`interfaces 1/1 admin up/down`

Підписати:
`interfaces 1/1 alias dl:new:port:alias`

Подивитися маки:
`show mac-address-table 1/1`

Помилки на порту:
`show interfaces 1/1 counters errors `

Очистити статистику:
`interfaces 1/1 no l2 statistics`

-----

**VLAN**
Показати всі:
`show vlan`

Показати конкретний:
`show vlan 111`

Показати влани на порту:
`show vlan port 1/1`

Створити:
`vlan 111 1x1 stp disable flat stp disable name new_vlan`

Видалити:
`no vlan 111`

Видати в тегованому вигляді:
`vlan 111 802.1q 1/1`

Прибрати тегований:
`vlan 111 no 802.1q 1/1`

Видати в нетегованому вигляді:
`vlan 111 port default 1/1`

Прибрати нетегований:
`vlan 111 no port default 1/1`

Вкл/викл:
`vlan 111 enable/disable`

Подивитися маки у влані:
`show mac-address-table 111`

Вказати мак наса для влана на аплінкові:
`mac-address-table 11:11:11:11:11:11 1/25 111 `

-----

**IP**
Список IP комутатора:
`show ip interface`

Встановити IP для менеджмента:
`ip interface Management address 111.111.111.111 mask 255.255.255.0 vlan 111 no forward`

-----

**SNMP:**
Запустити сервіс:
`ip service snmp`

Дозволити підключення за допомогою локальних паролів:
`aaa authentication snmp "local"`

Встановити пароль:
`snmp security no security`
`user snmp password qwerty123 READ-ONLY all no auth`
`snmp community map qwerty123 user "snmp" on`

Дізнатися адресу сервера, на який комутатор відсилає трапи:
`show snmp station`

Вказати, куди відсилати трапи:
`snmp authentication trap disable`
`snmp station A.B.C.D 162 "snmp" v2 enable`

-----

**NTP**
Запустити службу:
`ntp client enable`

Вказати сервер часу:
`ntp server 111.111.111.111 prefer `

Встановити часовий пояс:
`system timezone eet
system daylight savings time enable`

-----

**Stacking**
Статус стека:
`show stack topology`

Перейменувати слот 2 в слот 4:
`stack set slot 2 saved-slot 4`

Перевести комутатор 6850Е в режим 6850:
`stack set slot 1 saved-mode os6850`

-----

**System**
**Якщо на виникає помилка нехватки пам'яті - видалити файл K2diag.img в папках working і certified.**

Подивитися конфіг:
`show configuration snapshot `

Подивитися навантаження на процесор:
`show health all cpu`

Логи:
`show log swlog`

Активні служби:
`show ip service`

Створити користувача:
`user admin password qwerty read-write all`

Подивитися мак комутатора:
`show chassis`

Перезавантаження:
`reload working no rollback-timeout `

Зберегти конфіг:
write memory

Скопіювати конфігурацію в резервний конфіг і синхронізувати стек:
`copy working certified flash-synchro`

-----

* <a title="Пишуть люди" href="http://habrahabr.ru/sandbox/64738/">Хабр пише</a>
* <a title="Пишуть люди" href="http://it-notepad.ru/%D0%B1%D0%B0%D0%B7%D0%BE%D0%B2%D1%8B%D0%B5-%D0%BA%D0%BE%D0%BC%D0%B0%D0%BD%D0%B4%D1%8B-%D0%BF%D1%80%D0%B8-%D1%80%D0%B0%D0%B1%D0%BE%D1%82%D0%B5-%D1%81-alcatel.html" target="_blank" rel="noopener noreferrer">Базові команди при роботі з Алкатель</a>
* <a title="Пишуть люди" href="http://www.latouche.info/admin/user_guides/omniswitch.html" target="_blank" rel="noopener noreferrer">Базові команди при роботі з Алкатель #2</a>
* <a title="Пишуть люди" href="http://aboutnetworkblog.blogspot.com/2013/05/alcatel-omniswitch.html" target="_blank" rel="noopener noreferrer">Базові команди при роботі з Алкатель #3</a>

-----