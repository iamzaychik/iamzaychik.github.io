---
title: Comment and uncomment line in file
---

**Закоментувати рядок файла, який містить слово example:**
`sed -i '/example/s/^/#/g' test.file`

**Розкоментувати рядок файла, який містить слово example:**
`sed -i '/example/s/^#//g' test.file`
-----