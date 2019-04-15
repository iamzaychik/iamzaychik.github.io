---
title: Table storage engine for TABLE doesnt have this option
---

**Якщо в MySQL отримуємо помилку "Table storage engine for TABLE doesn't have this option." - це свідчить про зміну формату бази з MyISAM на InnoDB. Внаслідок чого опція ROW_FORMAT є помилковою.**
-----
**Щоб виправити:**
`sed -ie 's/ROW_FORMAT=FIXED//g' dump.sql`
-----