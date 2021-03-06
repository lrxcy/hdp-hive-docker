#!/bin/bash

sudo -u postgres psql <<-EOSQL
  CREATE USER hue WITH PASSWORD 'hue';
  CREATE DATABASE hue WITH lc_collate='en_US.utf8';
  GRANT ALL PRIVILEGES ON DATABASE hue TO hue;
  CREATE USER hive WITH PASSWORD 'hive';
  CREATE DATABASE metastore;
  GRANT ALL PRIVILEGES ON DATABASE metastore TO hive;
  \c metastore
  \i /opt/hive/scripts/metastore/upgrade/postgres/hive-schema-3.1.0.postgres.sql
  \p set tuples_only
  \o /tmp/grant-a
SELECT 'GRANT SELECT,INSERT,UPDATE,DELETE ON "' || schemaname || '"."' || tablename || '" TO hive ;'
FROM pg_tables
WHERE tableowner = CURRENT_USER and schemaname = 'public';
  \o /tmp/grant-b
EOSQL
