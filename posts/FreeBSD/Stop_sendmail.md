---
title: Stop sendmail
---

_Якби Вернон Дурслі, дядько Гаррі Поттера, був системним адміністратором, то спершу відключив би поштовий агент sendmail._
-----


Ми не Вернони, але іноді воно не потрібне.
От тільки написанням одного тільки `sendmail_enable="NO"` в rc.conf тут не відбудешся.
Тож:
1. Робимо
`ee /etc/rc.conf`

2. Пишемо там
`sendmail_enable="NO"
sendmail_submit_enable="NO"
sendmail_outbound_enable="NO"
sendmail_msp_queue_enable="NO"`

3. Пробуємо запустити демон
`./sendmail start`

4. Якщо нічого не виводиться, гладимо себе і хвалимо.

-----

* <a href="https://guruway.wordpress.com/2010/03/11/freebsd-%D0%BE%D1%82%D0%BA%D0%BB%D1%8E%D1%87%D0%B5%D0%BD%D0%B8%D0%B5-sendmail/">Пишуть люди</a>

-----

