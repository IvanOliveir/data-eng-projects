variable "aws_region" {
  default = "sa-east-1"
}

variable "script_path_s3" {
  default = "/scripts/pyspark/glue_job_rw.py"
}

variable "script_path_local" {
  default = "../infrastructure/glue_job_read_write.py"
}
