---
title: Remove DOS line endings
category: Text edit
date: 2019-04-22
---

-----

1. Install [`dos2unix`](http://dos2unix.sourceforge.net/):
```bash
$ sudp apt install dos2unix
```

2. Convert files:
```bash
$ find . -type f -exec dos2unix -k -s -o {} ';'
```

-----

[Source](https://stackoverflow.com/a/19284034)

-----