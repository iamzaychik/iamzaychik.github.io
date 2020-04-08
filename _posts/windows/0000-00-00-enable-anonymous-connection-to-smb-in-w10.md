---
title: Enable anonymous connection to smb in W10
category: Windows
date: 2019-04-15
---

-----

**Manual**
```bash

HKLM\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters\AllowInsecureGuestAuth -> 1
```

-----

**Create enable_samba.reg**
```bash
Windows Registry Editor Version 5.00

[HKLM\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters]
"AllowInsecureGuestAuth"=dword:00000001
```

-----
