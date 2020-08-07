#!/bin/sh

schematool -initSchema -dbType mysql && hive --service metastore
