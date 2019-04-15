---
title: Unmute with mediakey failed
categories: Lubuntu
date: 2019-04-15
---

**Якщо мультимедіа-клавіша тільки вимикає звук в системі, а назад не вмикає - потрібно внести налаштування в команду, що виконується при натисканні:**
**1. Редагуємо файл налаштувань гарячих клавіш:**
`mcedit ~/.config/openbox/lubuntu-rc.xml`
**2. Міняємо**
`amixer -q sset Master toggle`
**на**
`amixer -D pulse set Master 1+ toggle`
-----
