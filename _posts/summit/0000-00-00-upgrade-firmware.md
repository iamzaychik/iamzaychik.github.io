---
title: Upgrade firmware
category: Summit
date: 2019-04-15
---

---

1. Проверяем версию прошивки:
`show switch`

2. Cтавим айпи:
`configure vlan "Mgmt" ipaddress summit_ip/netmask` (пинговаться ничего не будет)

3. Заливаем прошивку в secondary configuration (по дефолту саммит грузится в primary):

```bash
download image your_ip summitX-15.1.2.12-patch1-6.xos vr "VR-Mgmt" secondary
_Do you want to install image after downloading ? (y—yes, n—no, —cancel)
Say Yes to install image after downloading_
```

4. Заливаем ssh:

```bash
download image your_ip summitX-15.1.2.12-patch1-6-ssh.xmod
_Do you want to install image after downloading ? (y—yes, n—no, —cancel)
Say Yes to install image after downloading_
```

```bash
run update
restart process "thttpd"
enable ssh2
```

5. Переключаемся в secondary для возможности заливки в primary:

```bash
use configuration secondary
use image secondary
reboot
```

6. Заливаем прошивку в primary configuration:

```bash
download image your_ip summitX-15.1.2.12-patch1-6.xos vr "VR-Mgmt" primary
_Do you want to install image after downloading ? (y—yes, n—no, —cancel)
Say Yes to install image after downloading_
```

7. Заливаем ssh:

```bash
download image your_ip summitX-15.1.2.12-patch1-6-ssh.xmod
_Do you want to install image after downloading ? (y—yes, n—no, —cancel)
Say Yes to install image after downloading_
```

```bash
run update
restart process "thttpd"
enable ssh2
```

8. Переключаемся в primary:

```bash
use configuration primary
use image primary
reboot
```

---
