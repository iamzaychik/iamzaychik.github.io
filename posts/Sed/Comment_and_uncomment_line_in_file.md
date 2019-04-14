Title: Sed. Comment and uncomment line in file
Pub date: 19.12.2017
Category: Sed, 

**Закоментувати рядок файла, який містить слово example:**
`sed -i '/example/s/^/#/g' test.file`

**Розкоментувати рядок файла, який містить слово example:**
`sed -i '/example/s/^#//g' test.file`
-----