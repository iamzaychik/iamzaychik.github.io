---
title: Remove old revisions of snaps
category: Ubuntu
date: 2019-04-15
---

---

*Remove old revisions of snaps on Ubuntu.*

```bash
# CLOSE ALL SNAPS BEFORE RUNNING THIS
set -eu

LANG=C snap list --all | awk '/disabled/{print $1, $3}' |
    while read snapname revision; do
        snap remove "$snapname" --revision="$revision"
    done
```

---
