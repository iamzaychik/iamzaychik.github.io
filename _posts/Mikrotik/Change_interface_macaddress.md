---
title: Change interface mac-address
categories: Mikrotik
date: 2019-04-15
---

_Міняємо маки на доляри. І навпаки._
-----

1. Запускаємо Термінал
2. Пишемо там:
`/interface ethernet set number mac-address=01:23:45:67:89:AB`
де number - номер інтерфейса, нумерація починається з 0. Тобто, якщо нам потрібно змінити мак на eth2, то number=1
-----