---
title: Stacking
---

_Треба правильно підключитися, щоб не було бум шака лака. А вже потім все інше, ага._

-----

[caption id="attachment_216" align="aligncenter" width="544"]<img class="wp-image-216 size-full" src="https://zaychik.info/wp-content/uploads/544px-SummitStack-daisy-chain.png" width="544" height="599" /> Се є гірлянда, юний падаван![/caption]

[caption id="attachment_217" align="aligncenter" width="554"]<img class="wp-image-217 size-full" src="https://zaychik.info/wp-content/uploads/SummitStack-ring.png" width="554" height="507" /> Се є кільце, юний падаван![/caption]

-----

**Порядок настройки нового стека**
<ol>
 	*Собрать информацию со всех узлов о версии релиза ExOS. У всех узлов стека версия должна совпадать:
`show version images`
 	*Проверить из какой партиции происходит загрузка ExOS (primary, secondary) узлов. У всех узлов стека партиция должна совпадать:
`show switch`
 	*Собрать информацию об уровне лицензий на всех узлах, выбрать на каком уровне будут работать узлы с Master-Capability:
`show licenses`
 	*Отключить узлы.
 	*Соединить узлы стекируемыми кабелями.
 	*Включить узлы.
 	*Залогиниться с консоли на коммутатор, который хочется сделать мастером.
 	*Для проверки физического соединения узлов выполнить:
`show stacking`
 	*В списке должны быть все устройства стека в состоянии Disabled и в роли Master.
 	*Включить стек на всех узлах командой:
`enable stacking [node-address 00:00:00:00:00:00] (если не определён узел, включается на всех)`
 	*Задать в качестве MAC-адреса стека MAC мастера:
`configure stacking mac-address`
 	*Каждому узлу назначить номер слота:
`configure stacking node-address 00:00:00:00:00:00 slot-number X
`
 	*Снять master capability на узлах, которые не должны становиться мастером и участвовать в выборах Backup:
`configure stacking node-address 00:00:00:00:00:00 master-capability off`
 	*Настроить приоритеты стекирования на каждом узле:
`configure stacking node-address 00:00:00:00:00:00 priority (10-100)`
 	*Перезапустить стек:
`reboot stack-topology`
 	*Зайти на мастер и проверить состояние стекирования:
`show stacking
show stacking configuration`
 	*Все узлы должны быть видимы в стеке.
 	*Все узлы должны быть в состоянии active.
 	*После определения ролей, в стеке должен наблюдаться 1 master, 1 backup (если присутствует) и группа из standby.
 	*Убедиться, что мастером стал желаемый коммутатор.
 	*Настроить IP-сеть управления во влане Mgmt:
`configure vlan Mgmt ipaddress A.B.C.D./24`
 	*Настроить представленный стеком виртуальный модульный коммутатор желаемым образом (VLAN, IP-подсети, транк-группы, маршрутизация...).
 	*Сохранить конфигурацию:
`save configuration primary`
</ol>

-----

**Додаємо новий модуль в стек:**
1. Перевіряємо, що новий модуль має таку ж прошивку, як і весь стек:
`show version images`
2. Якщо все добре, то налаштовуємо стек:
`enable stacking node-address 00:00:00:00:00:00 (від  easy-setup потрібно відмовитися)
configure stacking node-address 00:00:00:00:00:00 slot-number X
configure stacking node-address 00:00:00:00:00:00 master-capability off
configure stacking node-address 00:00:00:00:00:00 priority 10-100
synchronize stacking node-address 00:00:00:00:00:00
reboot node-address 00:00:00:00:00:00`
3. Перевіряємо стан стека:
`show stacking
show stacking configuration`

-----
* <a title="Пишуть люди" href="http://xgu.ru/wiki/%D0%A1%D1%82%D0%B5%D0%BA%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%B8%D0%B5_SummitStack" target="_blank">Xgu.ru каже нам більше</a>
* <a href="https://gtacknowledge.extremenetworks.com/articles/How_To/How-to-add-a-node-to-a-stack">Додаємо модуль в стек</a>
-----