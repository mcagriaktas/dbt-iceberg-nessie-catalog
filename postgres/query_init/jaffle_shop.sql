-- Check and create jaffle_shop_postgres database
SELECT 'CREATE DATABASE jaffle_shop_postgres'
WHERE NOT EXISTS (SELECT FROM pg_database WHERE datname = 'jaffle_shop_postgres')\gexec

-- Connect to jaffle_shop_postgres
\c jaffle_shop_postgres;

-- Create schema
CREATE SCHEMA IF NOT EXISTS jaffle_shop_sc;

-- Check and create nessie_db database
SELECT 'CREATE DATABASE nessie_db'
WHERE NOT EXISTS (SELECT FROM pg_database WHERE datname = 'nessie_db')\gexec

-- Connect to nessie_db
\c nessie_db;

-- Create schema
CREATE SCHEMA IF NOT EXISTS nessie;