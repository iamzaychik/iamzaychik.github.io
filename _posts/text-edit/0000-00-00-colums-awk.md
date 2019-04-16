---
title: Columns awk
category: Text edit
date: 2019-04-15
---

-----

* Вивести всі стовпці:
```bash
awk '{print $0}'
```

* Вивести перший стовпчик:
```bash
awk '{print $1}'
```

* Вивести другий стовпчик:
```bash
awk '{print $2}'
```

* Вивести останній стовпчик:
```bash
awk '{print $1 $3}'
```

* Вивести кілька стовпчиків (перший і третій):
```bash
awk '{print $1 $3}'
```

* За замовчуванням, в якості роздільника використовується пробіл.
* Для того, щоб вказати, чим розділені стовпці, використовуємо опцію -F:
```bash
awk -F "," '{print $1}'
```

-----