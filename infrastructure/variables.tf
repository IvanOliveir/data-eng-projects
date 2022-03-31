variable "aws_region" {
  default = "sa-east-1"
}

variable "microdados_path_s3" {
  default = "raw-data/enem/microdados_enem_2020.csv"
}

variable "source_path_local" {
  default = "/data/MICRODADOS_ENEM_2020.csv"
}

variable "script_path_s3" {
  default = "scripts/pyspark/glue_job_rw.py"
}

variable "script_path_local" {
  default = "/infrastructure/glue_job_read_write.py"
}
