---
title: Scheduled traffic restrictions
categories: Mikrotik
date: 2019-04-15
---

Консольний варіант додати правило:
`/ip firewall filter
add action=drop chain=input comment="Забороняємо доступ користувачу %Юзер% з 13:00 до 16:00" disabled=no src-address=A.B.C.D time=\
13h-15h59m59s,sun,mon,tue,wed,thu,fri,sat`
-----