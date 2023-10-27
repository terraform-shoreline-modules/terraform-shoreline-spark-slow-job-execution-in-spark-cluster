resource "shoreline_notebook" "slow_job_execution_in_spark_cluster" {
  name       = "slow_job_execution_in_spark_cluster"
  data       = file("${path.module}/data/slow_job_execution_in_spark_cluster.json")
  depends_on = [shoreline_action.invoke_spark_config_update]
}

resource "shoreline_file" "spark_config_update" {
  name             = "spark_config_update"
  input_file       = "${path.module}/data/spark_config_update.sh"
  md5              = filemd5("${path.module}/data/spark_config_update.sh")
  description      = "Optimize cluster configuration: Another possible solution is to optimize the configuration of the Spark cluster, such as tuning the Spark executor memory settings, or changing the number of Spark executors."
  destination_path = "/tmp/spark_config_update.sh"
  resource_query   = "host"
  enabled          = true
}

resource "shoreline_action" "invoke_spark_config_update" {
  name        = "invoke_spark_config_update"
  description = "Optimize cluster configuration: Another possible solution is to optimize the configuration of the Spark cluster, such as tuning the Spark executor memory settings, or changing the number of Spark executors."
  command     = "`chmod +x /tmp/spark_config_update.sh && /tmp/spark_config_update.sh`"
  params      = []
  file_deps   = ["spark_config_update"]
  enabled     = true
  depends_on  = [shoreline_file.spark_config_update]
}

