variable "microdados_path_s3" {
  default = "raw-data/enem/microdados_enem_2020.csv"
}

variable "source_path_local" {
  default = "C:/Users/ivan.oliveira/data_eng_cloud/enem_2020/DADOS/MICRODADOS_ENEM_2020.csv"
}

variable "script_path_s3" {
  default = "scripts/pyspark/glue_job_rw.py"
}

variable "script_path_local" {
  default = "C:/Users/ivan.oliveira/data_eng_cloud/trabalho_pratico_1/glue_job_read_write.py"
}
