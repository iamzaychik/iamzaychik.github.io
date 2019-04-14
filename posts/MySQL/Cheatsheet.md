Title: MySQL. Cheatsheet
Pub date: 10.06.2015
Category: MySQL, 

**Створити базу даних:**
`CREATE DATABASE dbname;`

**Щоб працювати з базою, назва якої містить крапку, потрібно взяти її в лапки:**
``db.name``.

**Створити користувача:**
`CREATE USER 'user'@'localhost' IDENTIFIED BY 'password';`

**Дати користувачу всі права на базу:**
`GRANT ALL PRIVILEGES ON dbname . * TO 'user'@'localhost';`

**Перечитати права користувачів:**
`FLUSH PRIVILEGES;`

**Видалити користувача:**
`DROP USER 'user'@'localhost';`

**Показати користувачів:**
`SELECT User,Host FROM mysql.user;`

**Показати права користувачів:**
`SHOW GRANTS;`

**Перевстановити пароль root:**
`DROP USER 'root'@'localhost';`
`DROP USER 'root'@'127.0.0.1';`
`CREATE USER 'root'@'localhost' IDENTIFIED BY 'password';`
`GRANT ALL PRIVILEGES ON * . * TO 'root'@'localhost' WITH GRANT OPTION;`
`FLUSH PRIVILEGES;`

**Зробити резервну копію бази:**
`mysqldump -u USER -p -f mydatabase > /path/to/backup/dump.sql`

**Відновити базу з резервної копії**
`mysql -u USER -p < /path/to/backup/dump.sql DB_NAME`

**Зробити резервну копію всіх баз:**
``mysqldump -u root -p --all-databases > alldb.sql`

**Відновити  всі бази з резервної копії**
`mysql -u root -p < alldb.sql`

**Перевірити і відремонтувати всі бази:**
``mysqlcheck -u root -p --auto-repair --all-databases`

**Помилка "Table in use":**
1. Переходимо в папку з базою:
`cd /var/lib/mysql/mydatabase`
2. Ремонтуємо таблицю, до якої відсутній доступ:
`myisamchk --safe-recover mytable`

**Заміна значень в таблиці:**
`UPDATE mytable SET value = REPLACE(value, "xxx", "yyy");`

**Заміна неправильних дат в постах Wordpress на поточну дату:**
`UPDATE `wp_posts` SET `post_date`=NOW() WHERE `post_date` LIKE '0000%'`

**Пошук дублікатів:**
`SELECT mac, COUNT(mac) AS cnt FROM leases GROUP BY mac HAVING ( COUNT(mac) > 1 )`

**Очистка значень в стовпці:**
`UPDATE table SET column = '';`
або
`UPDATE table SET column = NULL;`

**Як краще зберігати в базі IP:**
``ip` int(10) unsigned NOT NULL`
_Зберігати IP-адресу в MySQL найзручніше у типі INT. Причому, обов'язково UNSIGNED (беззнаковий), щоб адреси вище 127 могли вміститися в ці 4 байти.
Тип INT більш зручніший для зберігання IP-адрес у порівнянні з CHAR(15) з двух причин:
1. Потребує менше пам'яті (4 байти INT проти 15 байтів CHAR). Як результат, таблиця займає менше місця на жорсткому диску, а швидкість виконання запитів росте внаслідок зменшення індексу.
2. Зручно робити вибірки по діапазонах чисел та масках, а також робити сортування (маємо звичайне сортування чисел)._
-----