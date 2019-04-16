---
title: No matching host key type found
category: SSH
date: 2019-04-15
---

-----

**Issue when connecting via ssh:**
```bash
Unable to negotiate with A.B.C.D: no matching host key type found. Their offer: ssh-dss
```

**Regarding to security reasons with disabled dss. Use:**
```bash
$ ssh -oHostKeyAlgorithms=+ssh-dss <USER>@<A.B.C.D>
```

-----