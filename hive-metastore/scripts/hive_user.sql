CREATE DATABASE metastore;
USE metastore;
CREATE USER 'hive'@'%' IDENTIFIED BY 'hive'; 
GRANT all on *.* to 'hive'@localhost identified by 'hive';
flush privileges;
