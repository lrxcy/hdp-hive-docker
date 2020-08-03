DOCKER_NETWORK = hadoop_default
ENV_FILE = hadoop.env
hadoop_version = 3.2.1

build:
	docker build -t lrxcywq/hdp_base:$(hadoop_version) ./base
	docker build -t lrxcywq/hdp_namenode:$(hadoop_version) ./namenode
	docker build -t lrxcywq/hdp_datanode:$(hadoop_version) ./datanode
	docker build -t lrxcywq/hdp_resourcemanager:$(hadoop_version) ./resourcemanager
	docker build -t lrxcywq/hdp_nodemanager:$(hadoop_version) ./nodemanager
	docker build -t lrxcywq/hdp_historyserver:$(hadoop_version) ./historyserver
	docker build -t lrxcywq/hdp_submit:$(hadoop_version) ./submit

wordcount:
	docker build -t hdp_wordcount ./submit
	docker run --network ${DOCKER_NETWORK} --env-file ${ENV_FILE} lrxcywq/hdp_base:$(hadoop_version) hdfs dfs -mkdir -p /input/
	docker run --network ${DOCKER_NETWORK} --env-file ${ENV_FILE} lrxcywq/hdp_base:$(hadoop_version) hdfs dfs -copyFromLocal -f /opt/hdp_3.2.1/README.txt /input/
	docker run --network ${DOCKER_NETWORK} --env-file ${ENV_FILE} hdp_wordcount
	docker run --network ${DOCKER_NETWORK} --env-file ${ENV_FILE} lrxcywq/hdp_base:$(hadoop_version) hdfs dfs -cat /output/*
	docker run --network ${DOCKER_NETWORK} --env-file ${ENV_FILE} lrxcywq/hdp_base:$(hadoop_version) hdfs dfs -rm -r /output
	docker run --network ${DOCKER_NETWORK} --env-file ${ENV_FILE} lrxcywq/hdp_base:$(hadoop_version) hdfs dfs -rm -r /input
