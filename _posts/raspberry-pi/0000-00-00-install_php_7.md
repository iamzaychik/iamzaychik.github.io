---
title: Install PHP 7
category: Raspberry Pi
date: 2019-04-15
---

**1. Редагуємо список репозиторіїв:**
`mcedit /etc/apt/sources.list`

**2. Додаємо:**
`deb http://repozytorium.mati75.eu/raspbian jessie-backports main contrib non-free`
`#deb-src http://repozytorium.mati75.eu/raspbian jessie-backports main contrib non-free`

**3. Додаємо ключ:**
`gpg --keyserver pgpkeys.mit.edu --recv-key CCD91D6111A06851`
`gpg --armor --export CCD91D6111A06851 | sudo apt-key add -`

**4.Оновлюємося і встановлюємо PHP 7:**
`apt-get update`
`apt-get install php7.0 php7.0-curl php7.0-gd php7.0-imap php7.0-json php7.0-mcrypt php7.0-mysql php7.0-opcache php7.0-xmlrpc`

**5. Для Apache 2 встановлюємо mod_php:**
`apt-get install libapache2-mod-php7.0`

-----

* <a href="http://www.ramoonus.nl/2016/07/17/install-php-7-raspberry-pi/">Пишуть люди</a>

-----