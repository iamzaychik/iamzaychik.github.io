---
title: Shellcheck
category: Bash
date: 2021-02-17
---

-----

* Install:
```bash
$ sudo apt install shellcheck
```

* Check all files in subdirectories:
```bash
$ cd /your/scripts/dir
$ for file in $(find . -type f -iname \*.sh); do shellcheck -s sh -S error -e SC2068 -e SC2199 -e SC2076 $file; done;
```

-----
