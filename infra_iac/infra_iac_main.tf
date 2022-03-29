resource "aws_s3_bucket" "lakehouse" {

  bucket = "lakehouse-test"

  tags = {
    job = "etl_crawler"
  }
}

resource "aws_s3_bucket_object" "enem_data" {
  bucket = "${aws_s3_bucket.lakehouse.bucket}"
  key    = "raw-data/enem/microdados_enem_2020.csv"
  acl    = "private"
  source = "C:/Users/ivan.oliveira/data_eng_cloud/enem_2020/DADOS/MICRODADOS_ENEM_2020.csv"
}

resource "aws_s3_bucket_object" "etl_script_spark" {
  bucket = "${aws_s3_bucket.lakehouse.bucket}"
  key    = "scripts/pyspark/glue_job_rw.py"
  source = "C:/Users/ivan.oliveira/data_eng_cloud/trabalho_pratico_1/glue_job_read_write.py"
}


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