---
title: Get script selfname without extension
category: Bash
date: 2019-04-15
---

---

*Get a Bash script filename without its `.sh` extension.*

```bash
NAME=$(basename "$0" .sh)
```

---
