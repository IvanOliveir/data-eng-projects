import sys
from awsglue.transforms import *
from awsglue.utils import getResolvedOptions
from pyspark.context import SparkContext
from awsglue.context import GlueContext
from awsglue.job import Job


## @params: [JOB_NAME]
args = getResolvedOptions(sys.argv, ['JOB_NAME'])

sc = SparkContext()
glueContext = GlueContext(sc)
spark = glueContext.spark_session
job = Job(glueContext)
job.init(args['JOB_NAME'], args)



# read the data from s3 storage
enem_raw = (
    spark.read
        .format('csv')
        .option('header', True)
        .option('inferSchema', True)
        .option('delimiter', ';')
        .load('s3://lakehouse-test/raw-data/enem/microdados_enem_2020.csv')
)

# write the data in s3 storage
(
    enem_raw.write
        .mode('overwrite')
        .format('parquet')
        .partitionBy('NU_ANO')
        .save('s3://lakehouse-test/consumer-zone/')
)
job.commit()