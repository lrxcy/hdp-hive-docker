DOCKER_NETWORK = hbase
ENV_FILE = hadoop.env
current_branch := 2.3.2
hadoop_branch := 3.2.1
build:
	docker build -t lrxcywq/hbase_base:$(current_branch) ./base
	docker build -t lrxcywq/hbase_master:$(current_branch) ./hmaster
	docker build -t lrxcywq/hbase_regionserver:$(current_branch) ./hregionserver
	docker build -t lrxcywq/hbase_standalone:$(current_branch) ./standalone

wordcount:
	docker run --network ${DOCKER_NETWORK} --env-file ${ENV_FILE} lrxcywq/hdp_base:$(hadoop_branch) hdfs dfs -mkdir -p /input/
	docker run --network ${DOCKER_NETWORK} --env-file ${ENV_FILE} lrxcywq/hdp_base:$(hadoop_branch) hdfs dfs -copyFromLocal -f /opt/hadoop-$(hadoop_branch)/README.txt /input/
	docker run --network ${DOCKER_NETWORK} --env-file ${ENV_FILE} hadoop-wordcount
	docker run --network ${DOCKER_NETWORK} --env-file ${ENV_FILE} lrxcywq/hdp_base:$(hadoop_branch) hdfs dfs -cat /output/*
	docker run --network ${DOCKER_NETWORK} --env-file ${ENV_FILE} lrxcywq/hdp_base:$(hadoop_branch) hdfs dfs -rm -r /output
	docker run --network ${DOCKER_NETWORK} --env-file ${ENV_FILE} lrxcywq/hdp_base:$(hadoop_branch) hdfs dfs -rm -r /input
