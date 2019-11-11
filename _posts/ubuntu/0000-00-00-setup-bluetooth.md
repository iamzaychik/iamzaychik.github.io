---
title: Setup Bluetooth
category: Ubuntu
date: 2019-11-11
---

-----

* Install packages:
```bash
$ sudo apt install bluetooth bluez bluez-tools rfkill
```

* Make sure your Bluetooth device is not blocked:
```bash
$ sudo apt install rfkill
$ sudo rfkill list
```

* If blocked:
```bash
$ sudo rfkill unblock bluetooth
$ sudo service bluetooth start
```

* Scanning for devices:
```bash
$ sudo apt-get install blueman
```

-----

[Source](https://www.maketecheasier.com/setup-bluetooth-in-linux/)

-----