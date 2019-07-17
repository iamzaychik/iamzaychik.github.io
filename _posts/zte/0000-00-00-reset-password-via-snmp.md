---
title: Reset password via SNMP
category: ZTE
date: 2019-04-15
---

-----

1. Get mibs [archive](ftp://91.206.19.52/frimware/ZTE/)
2. Open file `ES2900E.mib` with `mibbrowser`
3. Search for `loginUser/userTable`
4. Press `Table View`
5. Use `SNMP SET` for changing `priviledge` and `loginPass` values to our password
* ![](/assets/img/zte/reset-pass.jpg)

-----