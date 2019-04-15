---
title: Reset password
category: Alcatel
date: 2019-04-15
---

-----

1. Press `Enter` on boot
2. Wait for `=>`
3. Run commands for remove users file:
```
=>fatls ide :1,0
=>fatls ide :1,0 /network
=>fatdelete ide :1,0 /network/usertableX (X = 4 or 5)
=>run miniboot
```

4. After reboot:
```
login:    admin
password: switch
```

-----