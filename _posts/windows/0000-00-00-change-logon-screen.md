---
title: Change logon screen
category: Windows
date: 2019-04-15
---

---

*Change the Windows logon screen background.*

1. Enter `regedit` in the Start menu and press Enter.
2. Right-click `HKEY_LOCAL_MACHINE` and select Find.
3. Enter `OEMBackground` and select Find Next.
4. Open `OEMBackground`, select Modify, and change `0` to `1`.
5. Open `C:\Windows\System32\oobe`, then create the `info` and `backgrounds` folders.
6. Add the logon screen background image.

The image must not exceed 245 KB and must be named `backgroundDefault`.

---
