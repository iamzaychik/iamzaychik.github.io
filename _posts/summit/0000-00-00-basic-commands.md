---
title: Basic commands
category: Summit
date: 2019-04-15
---

### Basic

```bash
show ports **:** information detail - детальна інформація порта
```

```bash
disable/enable port *:* - вкл/викл порт
```

```bash
configure ports *:* display-string ****** - підпис порта
```

```bash
show fdb **:**:**:**:**:** - дивимося мак на порту
```

```bash
show vlan ports **:** - дивимося влан на порту
```

```bash
show ports *:* rxerrors - помилки (ткнуть 0 для очищення помилок)
```

```bash
show ports *:* txerrors - помилки (ткнуть 0 для очищення помилок)
```

```bash
create vlan *** - створити влан
```

```bash
configure vlan *** tag *** - вішаємо id на влан
```

```bash
configure vlan  *** add ports **:** tagged/untagged - видаємо влан
```

```bash
configure vlan  *** delete ports **:** - прибираємо влан
```

```bash
disable igmp snooping vlan *** - для транспортних вланів
```

```bash
show vlan tag *** - находимо влан по тегові
```

```bash
show cpu-monitoring - CPU usage
```

```bash
unconfigure switch all - reset to default
```

```bash
show configuration | inc *** - grep
```

-----

### VMAN

* Змінюємо тип заголовка:
```
configure vman ethertype 0x8100`
```


* Створити VMAN:
```
create vman user_*** tag ***
```

* Прийняти:
```
configure vman user_*** add port *:* tagged
```

* Вимикаємо снупінг, бо IPTV працює через MVR:
```
disable igmp snooping vlan user_***
```

-----

### SNMP-traps

* Видалення старих даних:
```
configure snmpv3 delete target-addr all
configure snmpv3 delete target-params all
```

* Вкажемо нову адресу сервера і його SNMP:
```
configure snmp add trapreceiver xxx.xxx.xxx.xxx community ******
```

-----

### Pending AAA Authentication

* Enter in the login prompt:
```bash
REBOOT AS MASTER-CAPABLE
```

* After reboot, login as `admin` without password

-----

**Дізнатися рівень ліцензій слотів стека**
1. Заходимо на потрібний слот стека:
```
telnet slot *
```

2. Вводимо свої логін/пароль

3. Щоб дізнатися рівень ліцензії, пишемо:
```
show licenses
```

-----

[Basic config](http://netwild.ru/base_config-extreme)
[ExtremeOS on XGU](http://xgu.ru/wiki/ExtremeXOS)

-----