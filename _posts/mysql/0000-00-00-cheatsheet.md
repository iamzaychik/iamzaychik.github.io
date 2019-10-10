---
title: Cheatsheet
category: MySQL
date: 2019-04-15
---

-----

**Створити базу даних:**
```sql
CREATE DATABASE dbname;
```

**Щоб працювати з базою, назва якої містить крапку, потрібно взяти її в лапки:**
``db.name``.

**Створити користувача:**
```sql
CREATE USER 'user'@'localhost' IDENTIFIED BY 'password';
```

**Дати користувачу всі права на базу:**
```sql
GRANT ALL PRIVILEGES ON dbname . * TO 'user'@'localhost';
```

**Перечитати права користувачів:**
```sql
FLUSH PRIVILEGES;
```

**Видалити користувача:**
```sql
DROP USER 'user'@'localhost';
```

**Показати користувачів:**
```sql
SELECT User,Host FROM mysql.user;
```

**Показати права користувачів:**
```sql
SHOW GRANTS;
```

**Перевстановити пароль root:**
```sql
DROP USER 'root'@'localhost';
DROP USER 'root'@'127.0.0.1';
CREATE USER 'root'@'localhost' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON * . * TO 'root'@'localhost' WITH GRANT OPTION;
FLUSH PRIVILEGES;
```

**Зробити резервну копію бази:**
```bash
$ mysqldump -u USER -p -f mydatabase > /path/to/backup/dump.sql
```

**Відновити базу з резервної копії**
```bash
$ mysql -u USER -p < /path/to/backup/dump.sql DB_NAME
```

**Зробити резервну копію всіх баз:**
```bash
$ mysqldump -u root -p --all-databases > alldb.sql
```

**Відновити  всі бази з резервної копії**
```bash
mysql -u root -p < alldb.sql
```

**Перевірити і відремонтувати всі бази:**
```bash
$ mysqlcheck -u root -p --auto-repair --all-databases
```

**Помилка "Table in use":**
1. Переходимо в папку з базою:
```bash
$ cd /var/lib/mysql/mydatabase
````
2. Ремонтуємо таблицю, до якої відсутній доступ:
```bash
$ myisamchk --safe-recover mytable
```

**Заміна значень в таблиці:**
```sql
UPDATE mytable SET value = REPLACE(value, "xxx", "yyy");
```

**Заміна неправильних дат в постах Wordpress на поточну дату:**
```sql
UPDATE `wp_posts` SET `post_date`=NOW() WHERE `post_date` LIKE '0000%'
```

**Пошук дублікатів:**
```sql
SELECT mac, COUNT(mac) AS cnt FROM leases GROUP BY mac HAVING ( COUNT(mac) > 1 )
```

**Очистка значень в стовпці:**
```sql
UPDATE table SET column = '';
```
OR
```sql
UPDATE table SET column = NULL;
```

**Як краще зберігати в базі IP:**
```sql
ip int(10) unsigned NOT NULL
```

Зберігати IP-адресу в MySQL найзручніше у типі INT. Причому, обов'язково UNSIGNED (беззнаковий), щоб адреси вище 127 могли вміститися в ці 4 байти.

Тип INT більш зручніший для зберігання IP-адрес у порівнянні з CHAR(15) з двух причин:
1. Потребує менше пам'яті (4 байти INT проти 15 байтів CHAR). Як результат, таблиця займає менше місця на жорсткому диску, а швидкість виконання запитів росте внаслідок зменшення індексу.
2. Зручно робити вибірки по діапазонах чисел та масках, а також робити сортування (маємо звичайне сортування чисел)._

-----
