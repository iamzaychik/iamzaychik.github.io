---
title: Cheatsheet
categories: PostgreSQL
date: 2019-04-15
---

**Backup:**
`pg_dump -h DB_HOST -p 5432 -U DB_USER -f dump.sql DB_NAME`

**Restore:**
`psql -h DB_HOST -p 5432 -U DB_USER -d DB_NAME -W -f dump.sql`

**Create DB**
`createdb -h DB_HOST -p 5432 -U DB_USER -E DB_ENCODING -e DB_NAME`

**Drop DB**
`dropdb -h DB_HOST -p 5432 -U DB_USER -i -e DB_NAME`
-----

**Якщо максимальна версія для встановлення 9.5, додаємо репозиторій з новими:**
`add-apt-repository "deb http://apt.postgresql.org/pub/repos/apt/ xenial-pgdg main"`
`wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -`
`apt update`
`apt install postgresql-client-9.6`
-----