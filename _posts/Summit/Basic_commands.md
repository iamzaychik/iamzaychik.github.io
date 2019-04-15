---
title: Basic commands
category: Summit
date: 2019-04-15
---

<ul>
 	*show ports **:** information detail - детальна інформація порта
 	*disable/enable port *:* - вкл/викл порт
 	*configure ports *:* display-string ****** - підпис порта
 	*show fdb **:**:**:**:**:** - дивимося мак на порту
 	*show vlan ports **:** - дивимося влан на порту
 	*show ports *:* rxerrors - помилки (ткнуть 0 для очищення помилок)
 	*show ports *:* txerrors - помилки (ткнуть 0 для очищення помилок)
 	*create vlan *** - створити влан
 	*configure vlan *** tag *** - вішаємо id на влан
 	*configure vlan  *** add ports **:** tagged/untagged - видаємо влан
 	*configure vlan  *** delete ports **:** - прибираємо влан
 	*disable igmp snooping vlan *** - для транспортних вланів
 	*show vlan tag *** - находимо влан по тегові
 	*show cpu-monitoring - CPU usage
 	*unconfigure switch all - reset to default
 	*show configuration | inc *** - grep
</ul>
-----

**VMAN:**
Змінюємо тип заголовка:
`configure vman ethertype 0x8100`
Створити VMAN:
`create vman user_*** tag ***`
Прийняти:
`configure vman user_*** add port *:* tagged``
Вимикаємо снупінг, бо IPTV працює через MVR:
``disable igmp snooping vlan user_***``
-----

**SNMP-traps:**
Видалення старих даних:
``configure snmpv3 delete target-addr all
configure snmpv3 delete target-params all`
Вкажемо нову адресу сервера і його SNMP:
`configure snmp add trapreceiver xxx.xxx.xxx.xxx community ******`
-----

**Pending AAA Authentication:**
Потрібно ввести в рядку логіна `REBOOT AS MASTER-CAPABLE`
Свіч перезавантажиться і можна буде зайти під логіном admin і без пароля.
-----

**Дізнатися рівень ліцензій слотів стека**
**1. Заходимо на потрібний слот стека:**
`telnet slot *`

**2. Вводимо свої логін/пароль**

**3. Щоб дізнатися рівень ліцензії, пишемо:**
`show licenses`
-----

* <a href="http://netwild.ru/base_config-extreme/">Базовая конфигурация</a>
* <a title="Пишуть люди" href="http://xgu.ru/wiki/ExtremeXOS" target="_blank">ExtremeOS on Xgu</a>
-----