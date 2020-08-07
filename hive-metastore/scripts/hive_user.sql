CREATE DATABASE metastore;
USE metastore;
SOURCE $HIVE_HOME/scripts/metastore/upgrade/mysql/hive-schema-3.1.2.mysql.sql;
CREATE USER 'hive'@'%' IDENTIFIED BY 'hive'; 
GRANT all on *.* to 'hive'@localhost identified by 'hive';
flush privileges;
