Title: Juniper. Static client on dynamic interfaces
Pub date: 19.02.2016
Category: Juniper, 

_Всьо не так і всьо не то, коли твоя дівчина - пальто._
_Або як зробить странне, коли люди його хотять._
-----


**1. Створюємо інтерфейсік:**
`set interfaces xe-0/0/0 unit 482 proxy-arp
set interfaces xe-0/0/0 unit 482 vlan-id 482
set interfaces xe-0/0/0 unit 482 family inet unnumbered-address lo0.0`

**2. Додаємо маршрутік:**
`set routing-options static route xxx.xxx.xxx.xxx/xx qualified-next-hop xe-0/0/0.482`

**3. Додаємо IP в префікс-лістік для OSPF:**
`set policy-options prefix-list SR xxx.xxx.xxx.xxx/xx`

**4. Пишемо policy для OSPF:**
`term t1 {
from {
route-filter 10.0.0.0/8 orlonger;
route-filter 172.16.0.0/12 orlonger;
route-filter 192.168.0.0/16 orlonger;
}
then reject;
}
term t2 {
from protocol access-internal;
then accept;
}
term t3 {
from {
prefix-list SR;
}
then accept;
}
term t4 {
then reject;
}
term t5 {
from protocol static;
then accept;
}
`

**5. Щоб не робити зле OSPF всяким спамом, пишемо policy з префікс-лістом, а в ньому - IP, який патрєбно анонсувати повністю цілодобово.**
Коротко, сіль цеї процедури ось в чому:
а) створити на інтерфейсіку новий вланчик;
б) повісити на нього unnumbered-ip з lo0.0;
в) вписати static-route у вищезгаданий інтерфейсік;
г) додати вищезгаданий IP у префікс-лістік;
д) споглядаємо прекрасне!

`unit 482 {
proxy-arp;
vlan-id 482;
family inet {
unnumbered-address lo0.0;
route xxx.xxx.xxx.xxx/xx {
qualified-next-hop xe-0/0/0.482;`

-----

