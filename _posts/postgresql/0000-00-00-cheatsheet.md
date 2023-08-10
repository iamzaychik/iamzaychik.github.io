---
title: Cheatsheet
category: PostgreSQL
date: 2019-04-15
---

**Backup:**
```bash
pg_dump -h DB_HOST -p 5432 -U DB_USER -f dump.sql DB_NAME
```

-----

**Restore:**
```bash
psql -h DB_HOST -p 5432 -U DB_USER -d DB_NAME -W -f dump.sql
```

-----

**Create DB**
```bash
createdb -h DB_HOST -p 5432 -U DB_USER -E DB_ENCODING -e DB_NAME
```

-----

**Drop DB**
```bash
dropdb -h DB_HOST -p 5432 -U DB_USER -i -e DB_NAME
```

-----

**Add repository to install version higher than 9.5:**
```bash
$ add-apt-repository "deb http://apt.postgresql.org/pub/repos/apt/ xenial-pgdg main"
$ wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
$ apt update
$ apt install postgresql-client-9.6
```

-----

**Check last user activities:**
```SQL
SELECT DISTINCT usename FROM pg_stat_activity;
```

-----

**Check long running queries:**
```SQL
SELECT pid, usename, now() - query_start AS duration FROM pg_stat_activity WHERE state = 'active' AND now() - query_start > interval '${query_timeout}';
```

-----
