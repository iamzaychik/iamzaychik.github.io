---
title: Disable USB autosuspend
category: Ubuntu
date: 2022-07-23
---

-----

```bash
$ sudo sed -i 's/GRUB_CMDLINE_LINUX_DEFAULT="/&usbcore.autosuspend=-1 /' /etc/default/grub
$ sudo update-grub
$ sudo systemctl reboot
```

-----

[Source](https://askubuntu.com/a/1161074)

-----
