---
title: Loop reboot on 16.04 and Radeon
category: Ubuntu
date: 2019-04-15
---

---

*Loop reboot on 16.04 and Radeon on Ubuntu.*

1. Edit `/etc/default/grub`
2. Add `radeon.dpm=0` to line `GRUB_CMDLINE_LINUX_DEFAULT`
3. `$ update-grub`

---
