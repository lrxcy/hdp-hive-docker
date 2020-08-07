#!/bin/sh

# start mysql
service mysql start && mysql -u root -p < /usr/local/hive_user.sql "\n"

${HIVE_HOME}/bin/schematool -initSchema -dbType mysql
${HIVE_HOME}/bin/hive --service metastore
