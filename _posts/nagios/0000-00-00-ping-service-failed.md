---
title: Ping service failed
category: Nagios
date: 2019-04-15
---

**If your Ping service fails with:**
`check_icmp: Failed to obtain ICMP socket: Operation not permitted`

**Add next permissions to it:**
```bash
$ chown root check_icmp
$ chgrp root check_icmp
$ chmod u+s check_icmp
$ chmod g+s check_icmp
```

-----
