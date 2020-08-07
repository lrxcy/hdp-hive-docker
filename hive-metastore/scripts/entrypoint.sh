#!/bin/sh

# mysql create database and user
sudo service mysql start && sudo mysql -u root -p < /user.sql "\n"

${HIVE_HOME}/bin/schematool -initSchema -dbType mysql
${HIVE_HOME}/bin/hive --service metastore
