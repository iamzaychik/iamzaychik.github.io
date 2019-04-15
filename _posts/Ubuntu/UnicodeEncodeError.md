---
title: UnicodeEncodeError
categories: Ubuntu
date: 2019-04-15
---

**Якщо при оновленні версії Ubuntu з'являється помилка:**
`UnicodeEncodeError: 'ascii' codec can't encode character '\xab' in position 170: ordinal not in range(128)`

**Вказуємо кодування, з яким потрібно виконати команду:**
`LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8 LANGUAGE=en_US.UTF-8 sudo do-release-upgrade -d`
-----