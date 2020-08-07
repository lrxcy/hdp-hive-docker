#!/bin/sh

export HADOOP_HOME=/opt/hadoop-3.2.1
export HADOOP_CLASSPATH=${HADOOP_HOME}/share/hadoop/tools/lib/aws-java-sdk-bundle-1.11.375.jar:${HADOOP_HOME}/share/hadoop/tools/lib/hadoop-aws-3.2.1.jar
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/

/HIVE_HOME/bin/schematool -initSchema -dbType mysql
/HIVE_HOME/bin/hive --service metastore
