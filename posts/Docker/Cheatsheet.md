Title: Docker. Cheatsheet
Pub date: 13.06.2018
Category: Docker, 

**Вивід історії імейджа в розширеному вигляді:**
`docker history --no-trunc alpine:latest`
-----

**Healthcheck in the Dockerfile**
`HEALTHCHECK CMD curl --fail http://localhost:80 || exit 1`
-----

**MySQL**
Backup
`docker exec -i CONTAINER_NAME /usr/bin/mysqldump -u DB_USER --password=DB_PASS -f DB_NAME > dump.sql`

Restore
`cat dump.sql | docker exec -i CONTAINER_NAME /usr/bin/mysql -u DB_USER --password=DB_PASS DB_NAME`
-----

**PostgreSQL**
Backup:
`docker exec -i CONTAINER_NAME pg_dump -w -U DB_USER DB_NAME > dump.sql`

Restore:
`cat dump.sql | docker exec -i CONTAINER_NAME psql -U DB_USER -d DB_NAME`
-----