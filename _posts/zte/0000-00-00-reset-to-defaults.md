---

title: Reset to defaults
category: ZTE
date: 2019-04-15
---

*Reset a ZTE switch to factory defaults from BootManager.*

1. After boot wait for `Press any key to stop auto-boot...` and press any key:

```txt
[ZXR10 Boot]:zte
[Password]zxr10
```

1. List files:

```txt
[BootManager]:ls
```

1. Remove configuration files:

- SI-series:

```txt
[BootManager]:del running.cfg
[BootManager]:del startcfg.txt
```

- E-series:

```txt
[BootManager]:cd cfg
[BootManager]:ls
[BootManager]:rm startrun.dat
```

1. Reboot:

```txt
[BootManager]:reboot
```

1. After reboot:

```txt
login:admin
password:zhongxing
```

---
