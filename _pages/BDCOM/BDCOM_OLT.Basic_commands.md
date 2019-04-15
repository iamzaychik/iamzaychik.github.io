---
title: BDCOM OLT
category: BDCOM
date: 2019-04-15
---

**Для того, щоб скинути пароль або повернутися до налаштувань за замовчуванням, необхідно підключитися через консольний порт і при завантаженні комутатора натиснути комбінацію Ctrl+P.**.
-----

**Дивимося активні онушки:**
`show epon active-onu interface epON 0/1 1`

**Базова інформація про ONU:**
`show epon int epoN 0/1:1 onu ctc basic-info`
-----

**ONU settings database:**
`show run db-llid`
-----

**Очистка помилок на портах:**
`clear mib`
-----

**Відв’язати ону:**
`gepon_xxxx#config`
`gepon_xxxx_config#interface epon 0/1`
`gepon_xxxx_config_epon0/1#no epon bind-onu mac xxxx.xxxx.xxxx`
-----

**Tagged/untagged VLAN (vlan xxxx untagged, vlan yyy tagged):**
`epon onu port 1 ctc vlan mode trunk xxxx yyy`
-----

**Темплейти**
**Створюємо темплейт:**
`gepon_xxxx#config
epon onu-config-template PON1
 cmd-sequence 1 spanning-tree guard loop
 cmd-sequence 2 epon onu all-port ctc vlan mode tag 1
 cmd-sequence 3 epon onu all-port ctc loopback detect
 cmd-sequence 4 epon onu all-port mac address-table dynamic maximum 2
 cmd-sequence 5 epon onu all-port ctc mcst tag-stripe enable
 cmd-sequence 6 epon onu all-port ctc mcst mc-vlan add 35
 cmd-sequence 7 switchport port-security dynamic maximum 2
 cmd-sequence 8 switchport port-security mode dynamic`

**Назначаємо темплейт на якусь одну ону:**
`epon pre-config-template xxxxxx binded-onu-llid xx`

**Видаляємо темплейт:**
`no epon onu-config-template`
-----

**Швидкість**
**Обмежуємо нехарошим людям швидкість доступу до порнохаба:**
`epon onu port 1 ctc rate-limit 512 egress`
`epon onu port 1 ctc rate-limit 512 ingress`

**Знімаємо обмеження швидкості з порта прихода:**
`epon sla upstream pir 1000000 cir 950000`
`epon sla downstream pir 1000000 cir 950000`
-----

**Оптичний сигнал**
**Зі сторони OLT:**
`show epon optical-transceiver-diagnosis interface epon 0/x`

**Зі сторони ONU:**
`show epon interface epON 0/x:x onu ctc optical-transceiver-diagnosis`
-----

**Дозволити трафік між ONU в межах одного PON:**
`gepon_xxxx# config
gepon_xxxx_config# interface EPON 0/1
gepon_xxxx_config_epon0/1# epon inner-onu-switch
gepon_xxxx_config_epon0/1# exit
gepon_xxxx_config# write`
-----

**Перезавантаження OLT по SNMP:**
`.1.3.6.1.4.1.3320.9.184.7.0`

-----

**TFTP**
**Завантажити на OLT:**
`copy tftp:startup-config flash XXX.XXX.XXX.XXX [ENTER]`
**Завантажити на TFTP:**
`copy flash:startup-config tftp XXX.XXX.XXX.XXX [ENTER]`
-----

* <a href="http://incosoft.ua/novosti/test-of-compatibility-onu-fora-na-1001c-with-olt-bdcom-p3310b.html">Тестимо онушку</a>

* <a href="https://zaychik.info/wp-content/uploads/P3310B_Manual_Rus.pdf" target="_blank" rel="noopener">Мануальчик. RTFM!</a>

* <a title="Пишуть люди" href="https://www.dropbox.com/sh/xwbmgzj2y26mstv/AAA9r-WYHVT0e8FKKwhVFfV_a?dl=0" target="_blank" rel="noopener">UA.PON Dropbox</a>

* <a title="Пишуть люди" href="http://linuxsnippets.net/ru/snippet/%D0%B7%D0%B0%D0%BC%D0%B5%D1%82%D0%BA%D0%B8-%D0%BF%D0%BE-gpongepon-%D0%BD%D0%B0-%D0%BF%D1%80%D0%B8%D0%BC%D0%B5%D1%80%D0%B5-olt-bdcom-p3310b" target="_blank" rel="noopener">Люди врубають все глобально</a>

-----