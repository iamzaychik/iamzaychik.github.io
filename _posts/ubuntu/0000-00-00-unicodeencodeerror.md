---
title: UnicodeEncodeError
category: Ubuntu
date: 2019-04-15
---

-----

**When during systen update getting error:**
```bash
UnicodeEncodeError: 'ascii' codec can't encode character '\xab' in position 170: ordinal not in range(128)
```

**Specify locale for command:**
```bash
$ LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8 LANGUAGE=en_US.UTF-8 sudo do-release-upgrade -d
```

-----