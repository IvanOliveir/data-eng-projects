resource "aws_s3_bucket" "lakehouse" {

  bucket = "lakehouse-test"

  tags = {
    job = "etl_crawler"
  }
}

resource "aws_s3_bucket_object" "enem_data" {
  bucket = "${aws_s3_bucket.lakehouse.bucket}"
  key    = "${var.microdados_path_s3}"
  acl    = "private"
  source = "${var.source_path_local}"
}

resource "aws_s3_bucket_object" "etl_script_spark" {
  bucket = "${aws_s3_bucket.lakehouse.bucket}"
  key    = "${var.script_path_s3}"
  source = "${var.script_path_local}"
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