---
title: Reset to defaults
category: Zte
date: 2019-04-15
---

-----

1. After boot wait for `Press any key to stop auto-boot...` and press any key:
```bash
[ZXR10 Boot]:zte
[Password]zxr10
```

2. List files:
```bash
[BootManager]:ls
```

3. Remove configuration files:

* SI-series:
```bash
[BootManager]:del running.cfg
[BootManager]:del startcfg.txt
```

* E-series:
```bash
[BootManager]:cd cfg
[BootManager]:ls
[BootManager]:rm startrun.dat
```

4. Reboot:
```bash
[BootManager]:reboot
```

5. After reboot:
```bash
login:admin
password:zhongxing
```

-----