---
title: IPoE
---

_В цьому нелегкому ділі все починається з сапа._

`ethernet-service sap-profile user_3180 bandwidth not-assigned priority not-assigned` - створюємо профіль з іменем user_3180
`ethernet-service service-name user_3180 svlan 3180` - прив'язуємо сервіс до супервлана
`ethernet-service sap 137 service-name user_3180` - прив'язуємо сап до сервіса
`ethernet-service sap 137 sap-profile user_3180` - прив'язуємо сап до профіля
`ethernet-service sap 137 cvlan all` - вказуємо, що потрібно приймти всі клієнтські влани даного сапа
`ethernet-service sap 137 uni 1/1` - видаємо сап на порт в нетегованому вигляді

`show ethernet-service svlan 2500 (3000)` - показати всі сапи
-----