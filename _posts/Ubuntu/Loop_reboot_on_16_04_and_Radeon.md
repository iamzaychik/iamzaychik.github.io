---
title: Loop reboot on 16 04 and Radeon
---

**Якщо у вас інтегрована відеокарта Radeon і система постійно перезавантажується, то потрібно зробити наступне:**

`mcedit /etc/default/grub`

**В рядок GRUB_CMDLINE_LINUX_DEFAULT додати:**
`radeon.dpm=0`

**Переконфігурувати Grub:**
`update-grub`

-----