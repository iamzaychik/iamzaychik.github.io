Title: Lubuntu. Unmute with mediakey failed
Pub date: 14.05.2018
Category: Ubuntu, 

**Якщо мультимедіа-клавіша тільки вимикає звук в системі, а назад не вмикає - потрібно внести налаштування в команду, що виконується при натисканні:**
**1. Редагуємо файл налаштувань гарячих клавіш:**
`mcedit ~/.config/openbox/lubuntu-rc.xml`
**2. Міняємо**
`amixer -q sset Master toggle`
**на**
`amixer -D pulse set Master 1+ toggle`
-----
