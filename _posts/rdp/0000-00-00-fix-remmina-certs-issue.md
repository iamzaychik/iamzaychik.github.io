---
title: Fix remmina certs issue
category: RDP
date: 2019-04-15
---

-----

```bash
#!/bin/bash
gksu bash
killall remmina
rm $HOME/.freerdp/known_hosts
remmina
```

-----