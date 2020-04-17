---
title: Warcraft III OpenGL
category: Wine
date: 2020-04-17
---

-----

**Manual**
```bash
HKEY_CURRENT_USER\Software\Blizzard Entertainment\Warcraft III\Gfx OpenGL -> DWORD 1
```

-----

**Create w3_ogl.reg**
```bash
Windows Registry Editor Version 5.00

[HCU\Software\Blizzard Entertainment\Warcraft III]
"Gfx OpenGL"=dword:00000001
```

-----
