
resource "aws_s3_bucket_object" "etl_script_spark" {
  bucket = "${aws_s3_bucket.lakehouse.id}"
  key    = "${var.script_path_s3}"
  source = "${var.script_path_local}"
}