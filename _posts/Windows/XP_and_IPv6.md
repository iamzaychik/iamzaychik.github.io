---
title: XP and IPv6
category: Windows
date: 2019-04-15
---

_Всі там будемо, нью-вейв, так сказать. А хто не буде - той сидить на XP._
-----

І йому треба от як:
`netsh interface ipv6 install
netsh interface ipv6 add addres "name of interface" ::1
netsh interface ipv6 add route ::/0 "name of interface" ::1`

-----