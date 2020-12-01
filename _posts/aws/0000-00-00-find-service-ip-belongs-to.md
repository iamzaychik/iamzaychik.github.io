---
title: Find service IP belongs to
category: AWS
date: 2020-12-01
---

-----

```bash
$ aws ec2 describe-network-interfaces --filters Name=addresses.private-ip-address,Values=10.100.200.200
```

-----
