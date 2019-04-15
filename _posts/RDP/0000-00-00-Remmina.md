---
title: Remmina
category: RDP
date: 2019-04-15
---

_Бувають дні, коли реміна не ремінить геть ніразу._
_ Сердиться на сертифікати._
_ Одучити і насварити можна скріптом під катом._
-----

`#!/bin/bash
gksu bash
killall remmina
rm $HOME/.freerdp/known_hosts
remmina`
-----