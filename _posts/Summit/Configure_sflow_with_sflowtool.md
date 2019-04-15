---
title: Configure sflow with sflowtool
categories: Summit
date: 2019-04-15
---

**Налаштування комутатора.**
**1. Описуємо колектор. Це сервер, на якому встановлено sflowtool. Його налаштування буде розглянуто в кінці статті.**
`configure sflow collector A.B.C.D port 6343 vr "VR-Management"`

**2. В якості адреси, через яку sFlow буде відправляти датаграми, вказуємо менеджмент-інтерфейс комутатора:**
`configure sflow agent ipaddress A.B.C.D`
**
3. Вмикаємо sFlow на портах, які нас цікавлять:**
`enable sflow ports 1,5`
_Передається інформація тільки про вхідні пакети. Отже для того, щоб отримати повну інформацію про трафік, нам потрібно вказувати і downlink і uplink порти._
**
4. Тепер увімкнемо sFlow:**
`enable sflow`
-----

**Налаштування sflowtool на сервері.**
_Сам по собі sflowtool не є колектором. В нашому випадку - це конвертер в NetFlow. А вже дані NetFlow можна збирати з допомогою flow-tools._

**1. Встановимо його з портів FreeBSD:**
`cd /usr/ports/net/sflowtool/`
`make install clean`

**2. Дописуємо в /etc/rc.conf :**
`sflowtool_enable="YES"`
`sflowtool_flags="-c A.B.C.D -d 3436"`
_Так ми направляємо NetFlow на порт 3436 колектора. Якщо використовується той самий сервер, вказуємо IP 127.0.0.1_

**3. Запускаємо sflowtool:**
`/usr/local/etc/rc.d/sflowtool start`
-----
* <a href="http://www.hilik.org.ua/%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B0-sflow-%D0%BD%D0%B0-%D0%BA%D0%BE%D0%BC%D0%BC%D1%83%D1%82%D0%B0%D1%82%D0%BE%D1%80%D0%B0%D1%85-extremenetworks-%D0%B8%D1%81%D0%BF%D0%BE%D0%BB%D1%8C/">Пишуть люди</a>
-----