---
title: Clear journalctl
category: Ubuntu
date: 2019-10-10
---

-----

* Retain only the past two days:
```bash
$ sudo journalctl --vacuum-time=2d
```

* Retain only the past 500 MB:
```bash
$ journalctl --vacuum-size=500M
```

-----

[Source](https://unix.stackexchange.com/questions/139513/how-to-clear-journalctl/194058#194058)

-----