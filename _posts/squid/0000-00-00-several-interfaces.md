---
title: Several interfaces
category: Squid
date: 2019-04-15
---

-----

```bash
acl ip1 myip 111.111.111.111
acl ip2 myip 111.111.111.112
acl ip3 myip 111.111.111.113

tcp_outgoing_address 111.111.111.111 ip1
tcp_outgoing_address 111.111.111.112 ip2
tcp_outgoing_address 111.111.111.113 ip3
```

-----

**After login to proxy user will have IP, which used for connection**

-----