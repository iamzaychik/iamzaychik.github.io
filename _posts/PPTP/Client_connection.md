---
title: Client connection
categories: PPTP
date: 2019-04-15
---

_Сікундою конектимося до віпіена з бубунти!_
-----

1. Встановлюємо клієнт:
`sudo apt-get install pptp-linux`

2. Створюємо файл нового підключення:
`mcedit /etc/ppp/peers/new-vpn`

2.1 Вставляємо туди:
`pty "pptp A.B.C.D —nolaunchpppd" # тип та адреса сервера
name vpnuser # користувач
remotename NEW-VPN # назва підключення
require-mppe-128 # підтримка MPPE
defaultroute # створити маршрут за замовчуванням
replacedefaultroute # примусово замінити маршрут за замовчуванням
unit 12 # номер ppp interface
persist # перепідключитися при обриві зв'язку
maxfail 10 # кількість спроб перепідключення
holdoff 15 # інтервал між перепідключеннями
file /etc/ppp/options.pptp
ipparam $TUNNEL`

3. Додаємо дані користувача у файл:
`mcedit /etc/ppp/chap-secrets `
3.1 Ctrl+V
`"vpnuser" NEW-VPN "vpnpassword"`

4. Запуск підключення у дебаг-режимі:
`pon new-vpn nodetach`

-----

* <a href="https://interface31.ru/tech_it/2013/07/nastroyka-pptp-podklyucheniya-v-ubuntu-server.html">Пишуть люди</a>

-----