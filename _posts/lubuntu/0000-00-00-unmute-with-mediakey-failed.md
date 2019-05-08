---
title: Unmute with mediakey failed
category: Lubuntu
date: 2019-04-15
---

-----

* Open hotkeys configuration:
```bash
$ mcedit ~/.config/openbox/lubuntu-rc.xml
```

* Change:
```bash
amixer -q set Master toggle
```

to

```bash
amixer -D pulse set Master 1+ toggle
```

-----
