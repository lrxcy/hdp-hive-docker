# Spark docker

Docker images to:
* Setup a standalone [Apache Spark](https://spark.apache.org/) cluster running one Spark Master and multiple Spark workers
* Build Spark applications in Java, Scala or Python to run on a Spark cluster

Currently supported versions:
* Spark 3.0.0 for Hadoop 3.2.1 with OpenJDK 8 and Scala 2.12

## Using Docker Compose

Add the following services to your `docker-compose.yml` to integrate a Spark master and Spark worker in [your BDE pipeline](https://github.com/big-data-europe/app-bde-pipeline):
```yml
spark-master:
  image: lrxcywq/spark-master:3.0.0-hadoop3.2
  container_name: spark-master
  ports:
    - "8080:8080"
    - "7077:7077"
  environment:
    - INIT_DAEMON_STEP=setup_spark
    - "constraint:node==<yourmasternode>"
spark-worker-1:
  image: lrxcywq/spark-worker:3.0.0-hadoop3.2
  container_name: spark-worker-1
  depends_on:
    - spark-master
  ports:
    - "8081:8081"
  environment:
    - "SPARK_MASTER=spark://spark-master:7077"
    - "constraint:node==<yourworkernode>"
spark-worker-2:
  image: lrxcywq/spark-worker:3.0.0-hadoop3.2
  container_name: spark-worker-2
  depends_on:
    - spark-master
  ports:
    - "8081:8081"
  environment:
    - "SPARK_MASTER=spark://spark-master:7077"
    - "constraint:node==<yourworkernode>"  
```
Make sure to fill in the `INIT_DAEMON_STEP` as configured in your pipeline.

## Running Docker containers without the init daemon
### Spark Master
To start a Spark master:

    docker run --name spark-master -h spark-master -e ENABLE_INIT_DAEMON=false -d lrxcywq/spark-master:3.0.0-hadoop3.2

### Spark Worker
To start a Spark worker:

    docker run --name spark-worker-1 --link spark-master:spark-master -e ENABLE_INIT_DAEMON=false -d lrxcywq/spark-worker:3.0.0-hadoop3.2

## Launch a Spark application
Building and running your Spark application on top of the Spark cluster is as simple as extending a template Docker image. Check the template's README for further documentation.
* [Java template](template/java)
* [Python template](template/python)
* [Scala template](template/scala)

## Kubernetes deployment
The BDE Spark images can also be used in a Kubernetes enviroment.

To deploy a simple Spark standalone cluster issue

`kubectl apply -f https://raw.githubusercontent.com/big-data-europe/docker-spark/master/k8s-spark-cluster.yaml`

This will setup a Spark standalone cluster with one master and a worker on every available node using the default namespace and resources. The master is reachable in the same namespace at `spark://spark-master:7077`.
It will also setup a headless service so spark clients can be reachable from the workers using hostname `spark-client`.

Then to use `spark-shell` issue

`kubectl run spark-base --rm -it --labels="app=spark-client" --image lrxcywq/spark-base:3.0.0-hadoop3.2.1 -- bash ./spark/bin/spark-shell --master spark://spark-master:7077 --conf spark.driver.host=spark-client`

To use `spark-submit` issue for example

`kubectl run spark-base --rm -it --labels="app=spark-client" --image lrxcywq/spark-base:3.0.0-hadoop3.2.1 -- bash ./spark/bin/spark-submit --class CLASS_TO_RUN --master spark://spark-master:7077 --deploy-mode client --conf spark.driver.host=spark-client URL_TO_YOUR_APP`

You can use your own image packed with Spark and your application but when deployed it must be reachable from the workers.
One way to achieve this is by creating a headless service for your pod and then use `--conf spark.driver.host=YOUR_HEADLESS_SERVICE` whenever you submit your application.
