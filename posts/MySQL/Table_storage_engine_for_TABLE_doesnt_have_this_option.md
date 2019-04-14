Title: MySQL. Table storage engine for TABLE doesn&#8217;t have this option.
Pub date: 22.10.2018
Category: MySQL, 

**Якщо в MySQL отримуємо помилку "Table storage engine for TABLE doesn't have this option." - це свідчить про зміну формату бази з MyISAM на InnoDB. Внаслідок чого опція ROW_FORMAT є помилковою.**
-----
**Щоб виправити:**
`sed -ie 's/ROW_FORMAT=FIXED//g' dump.sql`
-----