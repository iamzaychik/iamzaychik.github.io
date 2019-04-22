---
title: Rename files with regexp
category: Ubuntu
date: 2019-04-22
---

-----

**Lets change spaces to underscores:**

1. Install `rename`, if you not had it yet:
```bash
$ sudo apt install rename
```

2. Rename directories first:
```bash
$ find -name "* *" -type d | rename 's/ /_/g'
```

3. Rename files:
```bash
$ find -name "* *" -type f | rename 's/ /_/g'
```

-----

[Source](https://stackoverflow.com/a/2709619)

-----