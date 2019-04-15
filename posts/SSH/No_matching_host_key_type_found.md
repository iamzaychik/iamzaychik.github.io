---
title: No matching host key type found
---

_Чума на обидва ваші будинки!_
-----

При підключенні до деяких пристроїв по ssh можемо отримати таку помилку:
`Unable to negotiate with XX.XXX.XX.XX: no matching host key type found. Their offer: ssh-dss`

Це зв'язано з оновленнями протоколів безпеки, в яких DSA за замовчуванням заборонено.
Якщо маємо таку біду, то підключатися треба так:
`ssh -oHostKeyAlgorithms=+ssh-dss user@host`
-----