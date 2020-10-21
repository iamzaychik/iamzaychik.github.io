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

**Create users**
```bash
# Create a group
CREATE ROLE postgres_ro_group;

# Grant access to existing tables
GRANT USAGE ON SCHEMA public TO postgres_ro_group;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO postgres_ro_group;
GRANT SELECT ON ALL SEQUENCES IN SCHEMA public TO postgres_ro_group;

# Grant access to future tables
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT SELECT ON TABLES TO postgres_ro_group;
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT SELECT ON SEQUENCES TO postgres_ro_group;

# Create a final user with password
CREATE USER postgres_ro WITH PASSWORD 'secret';
GRANT postgres_ro_group TO postgres_ro;

# Superuser 

# Create a final user with password
CREATE USER postgres_adm WITH PASSWORD 'secret';
GRANT rds_superuser to postgres_adm;
```

-----
