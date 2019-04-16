---
title: Terminal hangs when network changed
category: SSH
date: 2019-04-15
---

-----

```bash
ssh_conn_params='ssh -o ServerAliveInterval=5 -o ServerAliveCountMax=1'
alias my_ssh_server='$ssh_conn_params <USER>@<A.B.C.D>'
```

-----