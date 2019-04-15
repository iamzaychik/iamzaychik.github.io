---
title: Basic commands
category: Dlink
date: 2019-04-15
---

* <a title="Пишуть люди" href="http://www.skleroznik.in.ua/2013/08/17/nastrojka-vlan-na-kommutatorax-d-link/" target="_blank" rel="noopener">Пишуть люди</a>

-----

`config vlan default delete 1-26 - удалить влан default с портов
config vlan default advertisement disable   - отключить влан default
create vlan 2101 - создать влан 2101
config vlan 2101 add untagged 1 - выдать влан 2101 в антаге на 1 порт
config vlan 2101 add tagged 25-26   - выдать влан 2101 в таге на порты 25-26
show error ports xx - дивимося помилки
clear counters ports xx - очистка помилок`
-----
**Файл конфігурції для бекапа:**
`c:/config.cfg`
-----