---
title: Comment and uncomment line in file
categories: Sed
date: 2019-04-15
---

**Закоментувати рядок файла, який містить слово example:**
`sed -i '/example/s/^/#/g' test.file`

**Розкоментувати рядок файла, який містить слово example:**
`sed -i '/example/s/^#//g' test.file`
-----