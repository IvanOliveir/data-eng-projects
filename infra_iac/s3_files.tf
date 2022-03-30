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