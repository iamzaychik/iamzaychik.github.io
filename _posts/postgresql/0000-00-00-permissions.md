---
title: Permissions
category: PostgreSQL
date: 2023-08-10
---

```
-- Create read_write_role with read/write permissions
CREATE ROLE read_write_role;


-- Grant necessary table permissions to read_write_role
GRANT CONNECT ON DATABASE <db_name> TO read_write_role;
GRANT USAGE, CREATE ON SCHEMA <schema1>, <schema2>, <schema3> TO read_write_role;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA <schema1>, <schema2>, <schema3> TO read_write_role;


-- Grant necessary sequence permissions to read_write_role
DO
$$
DECLARE
    seq_name text;
    schema_name text;
BEGIN
    FOR seq_name, schema_name IN
        SELECT c.relname AS seq_name, n.nspname AS schema_name
        FROM pg_class c
        JOIN pg_namespace n ON c.relnamespace = n.oid
        WHERE c.relkind = 'S'  -- Only consider sequences
          AND n.nspname IN ('<schema1>', '<schema2>', '<schema3>')  -- Filter by the specified schemas
    LOOP
        EXECUTE format('GRANT USAGE, SELECT, UPDATE ON SEQUENCE %I.%I TO read_write_role;', schema_name, seq_name);
    END LOOP;
END;
$$;


-----

-- Create read_only_role with read-only permissions
CREATE ROLE read_only_role;


-- Grant necessary table permissions to read_only_role
GRANT CONNECT ON DATABASE <db_name> TO read_only_role;
GRANT USAGE ON SCHEMA <schema1>, <schema2>, <schema3> TO read_only_role;
GRANT SELECT ON ALL TABLES IN SCHEMA <schema1>, <schema2>, <schema3> TO read_only_role;


-- Grant necessary sequence permissions to read_only_role
DO
$$
DECLARE
    seq_name text;
    schema_name text;
BEGIN
    FOR seq_name, schema_name IN
        SELECT c.relname AS seq_name, n.nspname AS schema_name
        FROM pg_class c
        JOIN pg_namespace n ON c.relnamespace = n.oid
        WHERE c.relkind = 'S'  -- Only consider sequences
          AND n.nspname IN ('<schema1>', '<schema2>', '<schema3>')  -- Filter by the specified schemas
    LOOP
        EXECUTE format('GRANT USAGE, SELECT ON SEQUENCE %I.%I TO read_only_role;', schema_name, seq_name);
    END LOOP;
END;
$$;


-----

-- Create needed users
CREATE USER admin_user WITH PASSWORD '111111';
CREATE USER rw_user WITH PASSWORD '222222';
CREATE USER ro_user WITH PASSWORD '333333';

-- Grant users with proper permissions
GRANT rds_superuser TO admin_user;
GRANT read_write_role TO rw_user;
GRANT read_only_role TO ro_user;

-----

-- Change password for user
ALTER USER username WITH PASSWORD 'new_password';

-----

-- Change role for user
REVOKE read_only_role FROM username;
GRANT read_write_role TO username;

-----
-- Drop old role and user
DROP ROLE app_readonly_all_data;
DROP USER username;
```

-----
