---
title: Cheatsheet
category: MySQL
date: 2019-04-15
---

-----

* If you want to work with db, which contains dot - quote it:
```bash
``db.name``.
```

-----

* Drop all databases:
```bash
$ echo "SET FOREIGN_KEY_CHECKS = 0;" > ./temp.sql
$ mysqldump --add-drop-table --no-data -u root -p db_name | grep 'DROP TABLE' >> ./temp.sql
$ echo "SET FOREIGN_KEY_CHECKS = 1;" >> ./temp.sql
$ mysql -u root -p db_name < ./temp.sql
```

-----

* Create database:
```sql
CREATE DATABASE dbname;
```

-----

* Create user:
```sql
CREATE USER 'user'@'localhost' IDENTIFIED BY 'password';
```

-----

* Give permissions to the user:
```sql
GRANT ALL PRIVILEGES ON dbname . * TO 'user'@'localhost';
```

-----

* Update permissions of all users:
```sql
FLUSH PRIVILEGES;
```

-----

* Remove user:
```sql
DROP USER 'user'@'localhost';
```

-----

* Show users:
```sql
SELECT User,Host FROM mysql.user;
```

-----

* Show permissions:
```sql
SHOW GRANTS;
```

-----

* Reset password for root user:
```sql
DROP USER 'root'@'localhost';
DROP USER 'root'@'127.0.0.1';
CREATE USER 'root'@'localhost' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON * . * TO 'root'@'localhost' WITH GRANT OPTION;
FLUSH PRIVILEGES;
```

-----

* Backup db:
```bash
$ mysqldump -u USER -p -f mydatabase > /path/to/backup/dump.sql
```

* Restore db:
```bash
$ mysql -u USER -p < /path/to/backup/dump.sql DB_NAME
```

* Backup all dbs:
```bash
$ mysqldump -u root -p --all-databases > alldb.sql
```

Restore all dbs:
```bash
mysql -u root -p < alldb.sql
```

-----

* Repair dbs:
```bash
$ mysqlcheck -u root -p --auto-repair --all-databases
```

-----

* `Table In Use` error:
1. Go to database dir:
```bash
$ cd /var/lib/mysql/mydatabase
````
2. Repair it:
```bash
$ myisamchk --safe-recover mytable
```

-----

* Replacing values:
```sql
UPDATE mytable SET value = REPLACE(value, "xxx", "yyy");
```

-----

* Replace wrong dates for current date for WordPress:
```sql
UPDATE `wp_posts` SET `post_date`=NOW() WHERE `post_date` LIKE '0000%'
```

-----

* Check duplicates:
```sql
SELECT mac, COUNT(mac) AS cnt FROM leases GROUP BY mac HAVING ( COUNT(mac) > 1 )
```

-----

* Clear column values:
```sql
UPDATE table SET column = '';

# OR

UPDATE table SET column = NULL;
```

-----

* How to store IPs:
```sql
ip int(10) unsigned NOT NULL
```

If you are only going to support IPv4 addresses then your datatype in MySQL can be an UNSIGNED INT which only uses 4 bytes of storage (to keep addresses 127+)
To store the individual octets you would only need to use UNSIGNED TINYINT datatypes, not SMALLINTS, which would use up 1 byte each of storage.
Both methods would use similar storage with perhaps slightly more for separate fields for some overhead.

[Source](https://stackoverflow.com/questions/1108918/how-to-store-an-ip-in-mysql)

-----
