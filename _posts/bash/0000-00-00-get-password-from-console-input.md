---
title: Get password from console input
category: Bash
date: 2019-07-05
---

---

*Read a hidden password from Bash console input.*

```bash
#!/bin/bash
# Read Password
echo -n Password:
read -s password
echo
# Run Command
echo $password
```

---
