---
title: Cycles with files
category: Bash
date: 2019-04-15
---

-----

* При необхідності перебрати всі файли в будь-якому каталозі і виконати над ними якісь дії, можна скористуватися простим циклом:
```bash
for file in /etc/config/*;do wc -l $file; stat -c %s $file; done
```

-----

* Також можна використати і find для рекурсивного пошуку і додаткових фільтрів:
```bash
for file in `find /etc -type f -name "*.conf"
do
	wc -l $file;
	stat -c %s $file;
done
```

-----

* Якщо виконується не більше однієї дії над файлом, можна обійтися без цикла:
```bash
$ find /etc -type f | xargs wc -l
```

-----

* Якщо в іменах файлів є пробіли, додаємо до find параметр `-print0`:
```bash
$ find /etc -type f -print0 | xargs -0 wc -l
```

-----

[Source](http://tt.erinome.net/2013/03/468)

-----