#!/bin/sh

# mysql create database and user
mysql -u root -p < /user.sql "\n"

${HIVE_HOME}/bin/schematool -initSchema -dbType mysql
${HIVE_HOME}/bin/hive --service metastore
