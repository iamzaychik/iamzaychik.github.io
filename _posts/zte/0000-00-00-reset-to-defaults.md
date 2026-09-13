---
title: Reset to defaults
category: ZTE
date: 2019-04-15
---

---

1. After boot wait for `Press any key to stop auto-boot...` and press any key:

```txt
[ZXR10 Boot]:zte
[Password]zxr10
```

2. List files:

```txt
[BootManager]:ls
```

3. Remove configuration files:

* SI-series:

```txt
[BootManager]:del running.cfg
[BootManager]:del startcfg.txt
```

* E-series:

```txt
[BootManager]:cd cfg
[BootManager]:ls
[BootManager]:rm startrun.dat
```

4. Reboot:

```txt
[BootManager]:reboot
```

5. After reboot:

```txt
login:admin
password:zhongxing
```

---
