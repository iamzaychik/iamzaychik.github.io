---
title: Ask sudo pass
category: Bash
date: 2019-08-27
---

---

*Re-run a Bash script with sudo when it lacks root privileges.*

```bash
if [ $EUID != 0 ]; then
    sudo "$0" "$@"
    exit $?
fi
```

---
