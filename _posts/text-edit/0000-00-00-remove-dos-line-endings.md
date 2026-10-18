---
title: Remove DOS line endings
category: Text edit
date: 2019-04-22
---

---

*Convert DOS line endings with dos2unix.*

1. Install [`dos2unix`](http://dos2unix.sourceforge.net/):

```bash
$ sudo apt install dos2unix
```

2. Convert files:

```bash
$ find . -type f -exec dos2unix -k -s -o {} ';'
```

---

[Source](https://stackoverflow.com/a/19284034)

---
