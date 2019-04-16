---
title: Access without password
category: Samba
date: 2019-04-15
---

-----

```bash
$ cat /etc/smb.conf
[global]
security = user
map to guest = Bad User
browseable = yes
guest account = nobody
[Downloads]
path = /root/ultramalvines
browseable = yes
writeable = yes
guest ok = yes
```

-----