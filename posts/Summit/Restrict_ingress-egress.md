---
title: Restrict ingress-egress
---

_Обрізання невірним!_
-----

**Для того, щоб обмежити швидкість на порту:**
1. Обмежуємо egress (download користувача):
`conf port 1:5 rate-limit egress 150 Mbps`
2.Обмежуємо ingress (upload користувача):
2.1 Створюємо Meter:
`create meter "meter_name"`
2.2 Обмежуємо швидкість в створеному Meter:
`configure meter "meter_name" committed-rate "speed" Mbps max-burst-size "speed" Mb out-actions drop`
2.3 Створюємо Policy:
`edit policy "policy_name"
entry cl { 
if match all { 
} 
then { 
meter "meter_name" ; 
} 
}`
2.3 Зв'язуємо policy і порт:
`configure access-list "policy_name" ports 1:5 ingress`
-----

**Для того, щоб обмежити швидкість у влані:**
1. Створюємо Meter:
`create meter "meter_name"`
2. Обмежуємо швидкість в створеному Meter:
`configure meter "meter_name" committed-rate "speed" Mbps max-burst-size "speed" Mb out-actions drop`
3. Створюємо Policy:
`edit policy "policy_name"
entry cl { 
if match all { 
} 
then { 
meter "meter_name" ; 
} 
}`
4. Зв'язуємо policy і vlan:
`configure access-list "policy_name" vlan "vlan_name" ingress`
-----