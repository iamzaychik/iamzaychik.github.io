---
title: Cycles with files
category: Bash
date: 2019-04-15
---

---

*Process files with Bash loops and recursive `find` commands.*

- Якщо потрібно перебрати всі файли в каталозі й виконати над ними дії:

```bash
$ for file in /etc/config/*;do wc -l $file; stat -c %s $file; done
```

---

- Для рекурсивного пошуку та додаткових фільтрів можна використати `find`:

```bash
for file in `find /etc -type f -name "*.conf"
do
  wc -l $file;
  stat -c %s $file;
done
```

---

- Якщо для кожного файла потрібна лише одна дія, цикл не потрібен:

```bash
$ find /etc -type f | xargs wc -l
```

---

- Якщо імена файлів містять пробіли, додайте до `find` параметр `-print0`:

```bash
$ find /etc -type f -print0 | xargs -0 wc -l
```

---

[Source](http://tt.erinome.net/2013/03/468)

---
