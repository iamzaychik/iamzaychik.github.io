---
title: Reset password
categories: Alcatel
date: 2019-04-15
---

_Як повернути втрачене, маючи консольний доступ._

-----

1. Нажимаємо Enter при загрузці;
2. Бачимо знак =>;
3. Пишемо:
`=>fatls ide :1,0
=>fatls ide :1,0 /network
=>fatdelete ide :1,0 /network/usertableX (X = 4 або 5, там видно буде)
=>run miniboot`

4. Алкатель йде в ребут, після цього:
`login:    admin
password: switch`
-----