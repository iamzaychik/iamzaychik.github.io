---
title: Reset to specific commit
categories: Git
date: 2019-04-15
---

**Щоб видалити всі комміти до потрібного, потрібно дізнатися його id, після чого:**
**а) Відкотити непотрібні комміти:**
`git reset &lt;id> --hard `
**б) Запушити зміни в репозиторій**
`git push origin HEAD --force`
-----