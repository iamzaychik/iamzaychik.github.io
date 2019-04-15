---
title: Enable anonymous connection to smb in W10
category: Windows
date: 2019-04-15
---

**Для того, щоб користуватися безпарольним доступом до Samba-сервера у релізах Windows 10 починаючи з 1709, потрібно дозволити можливість незахищеного доступу.**
**Для цього потрібно створити ключ:**
`HKLM\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters\AllowInsecureGuestAuth (DWORD) зі значенням 1`
-----