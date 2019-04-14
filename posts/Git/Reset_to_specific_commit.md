Title: Git. Reset to specific commit
Pub date: 19.12.2017
Category: Git, 

**Щоб видалити всі комміти до потрібного, потрібно дізнатися його id, після чого:**
**а) Відкотити непотрібні комміти:**
`git reset &lt;id> --hard `
**б) Запушити зміни в репозиторій**
`git push origin HEAD --force`
-----