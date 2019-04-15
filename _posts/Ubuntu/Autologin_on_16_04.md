---
title: Autologin on 16 04
---

**1. Створюємо файл конфігурації:**
`mkdir /etc/systemd/system/getty@tty1.service.d`
`mcedit /etc/systemd/system/getty@tty1.service.d/override.conf`

**2. Вставляємо в нього конфіг, замінюючи користувача на свого:**
`[Service]`
`ExecStart=`
`ExecStart=-/sbin/agetty --noissue --autologin КОРИСТУВАЧ %I $TERM`
`Type=idle`
-----