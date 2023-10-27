

#!/bin/bash



# Set the Spark executor memory

SPARK_EXECUTOR_MEMORY="4g"



# Set the number of Spark executors

SPARK_EXECUTOR_INSTANCES="4"



# Set the number of CPU cores per Spark executor

SPARK_EXECUTOR_CORES="4"



# Stop the Spark service

sudo systemctl stop spark



# Modify the Spark configuration file

sudo sed -i "s/spark.executor.memory\s*=.*/spark.executor.memory=$SPARK_EXECUTOR_MEMORY/g" /etc/spark/conf/spark-defaults.conf

sudo sed -i "s/spark.executor.instances\s*=.*/spark.executor.instances=$SPARK_EXECUTOR_INSTANCES/g" /etc/spark/conf/spark-defaults.conf

sudo sed -i "s/spark.executor.cores\s*=.*/spark.executor.cores=$SPARK_EXECUTOR_CORES/g" /etc/spark/conf/spark-defaults.conf



# Start the Spark service

sudo systemctl start spark