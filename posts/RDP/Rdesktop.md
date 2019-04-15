---
title: Rdesktop
---

_Голому королю - голий консольний клієнт RDP._
-----


1. Беремо всьо, шо погано лежить:
`apt-get install rdesktop`

2. Робимо кошерний скріпт, щоб його запускати:
`#!/bin/dash
rdesktop -T 'тута пишемо назву вікна, будемо скритними' -r clipboard:PRIMARYCLIPBOARD -r disk:z=${HOME} -k en-us -N -a 16 -z -f -u тута_юзернейм xxx.xxx.xxx.xxx`

3. Докручуємо правильну роботу клавіатури. Для цього в файли:
`mcedit /usr/share/rdesktop/keymaps/en-us
mcedit /usr/share/rdesktop/keymaps/ru`

Вставляємо слідуюче:

`include common
map 0x419
grave 0x29
asciitilde 0x29 shift
asciicircum 0x07 shift
backslash 0x2b
bar 0x2b shift
apostrophe 0x28
greater 0x34 shift
less 0x33 shift`
-----