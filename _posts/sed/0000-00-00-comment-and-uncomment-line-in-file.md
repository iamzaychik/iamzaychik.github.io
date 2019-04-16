---
title: Comment and uncomment line in file
category: Sed
date: 2019-04-15
---

-----

* Comment line, which contains `example`:
```bash
$ sed -i '/example/s/^/#/g' test.file
```

* Uncomment line, which contains `example`:
```bash
$ sed -i '/example/s/^#//g' test.file
```

-----