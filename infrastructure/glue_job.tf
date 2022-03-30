resource "aws_glue_job" "etl" {
  name     = "etl_job"
  role_arn = "arn:aws:iam::484263780926:role/AWSGlueServiceRole-estudo"

  command {
    script_location = "s3://${aws_s3_bucket.lakehouse.bucket}/${aws_s3_bucket_object.etl_script_spark.key}"
  }

  default_arguments = {
    "--job-language" = "pyspark"
  }
}