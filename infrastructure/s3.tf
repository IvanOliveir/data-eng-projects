resource "aws_s3_bucket" "lakehouse" {

  bucket = "lakehouse-test"

  tags = {
    job = "etl_crawler"
  }
}