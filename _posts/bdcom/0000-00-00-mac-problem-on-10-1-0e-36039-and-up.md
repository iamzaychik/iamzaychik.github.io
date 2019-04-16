---
title: MAC problem on 10.1.0E.36039 and up
category: BDCOM
date: 2019-04-15
---

-----

**Starting from FW version 10.1.0E_36039, all mac-addresses with masks, which are listed below, will be rejected by PON interface**
```
X2:XX:XX:XX:XX:XX	Local Administered
X6:XX:XX:XX:XX:XX	Local Administered
XA:XX:XX:XX:XX:XX	Local Administered
XE:XX:XX:XX:XX:XX	Local Administered
```

**Enable restricted masks:**
```
Switch_config#epon local-mac forward
```

-----