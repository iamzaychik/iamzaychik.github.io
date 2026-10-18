---
title: Fix remmina certs issue
category: RDP
date: 2019-04-15
---

---

*Reset Remmina certificate state and restart the client.*

```bash
#!/bin/bash
gksu bash
killall remmina
rm $HOME/.freerdp/known_hosts
remmina
```

---
