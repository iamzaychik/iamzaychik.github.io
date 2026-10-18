---
title: Sudo without password
category: Ubuntu
date: 2019-04-15
---

---

*Sudo without password on Ubuntu.*

1. Start editing sudoers:

```bash
$ sudo visudo
```

2. Insert at the end of the file:

```bash
YOUR_USER ALL=(ALL:ALL) NOPASSWD:ALL
```

---
