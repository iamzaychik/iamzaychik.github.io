---
title: Cheatsheet
category: Bash
date: 2019-05-29
---

-----

* Intersecting values in two arrays:
```bash
echo ${Array1[@]} ${Array2[@]} | tr ' ' '\n' | sort | uniq -d
```

* Which user run script:
```bash
name="$(whoami)";
echo $name;
```

-----

[Source](http://nsk.lug.ru/system/10-seconds-guide-to-bash-shell)

-----