---
title: Get tables sizes
category: MySQL
date: 2019-08-27
---

* You can use this query to show the size of a table (although you need to substitute the variables first):

```sql
SELECT 
    table_name AS `Table`, 
    round(((data_length + index_length) / 1024 / 1024), 2) `Size in MB` 
FROM information_schema.TABLES 
WHERE table_schema = "DB_NAME"
    AND table_name = "TABLE_NAME";
```

* This query to list the size of every table in every database, largest first:

```sql
SELECT 
     table_schema as `Database`, 
     table_name AS `Table`, 
     round(((data_length + index_length) / 1024 / 1024), 2) `Size in MB` 
FROM information_schema.TABLES 
ORDER BY (data_length + index_length) DESC;
```

-----

[Source](https://stackoverflow.com/a/9620273)

-----