---
title: Batch rename with template
category: Windows
date: 2019-04-15
---

-----

**Execute in powershell:**
```powershell
Get-ChildItem "D:\Music" -Recurse | 
   Where-Object {$_.Name -match '  '} | 
     Rename-Item -NewName { $_.Name -replace '  ',' ' } -WhatIf
```

-----