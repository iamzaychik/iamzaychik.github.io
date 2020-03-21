---
title: Ask sudo pass
category: Bash
date: 2019-08-27
---

-----

```bash
if [ $EUID != 0 ]; then
    sudo "$0" "$@"
    exit $?
fi
```

-----
