resource "aws_s3_bucket_object" "delta_insert" {

    bucket = aws_s3_bucket.datalake.id
    key = "emr-code/pyspark/job_delta_spark_insert.py"
    acl = "private"
    source = "../etl/job_delta_spark_insert.py"
    etag = filemd5("../etl/job_delta_spark_insert.py")
}

resource "aws_s3_bucket_object" "delta_upsert" {

    bucket = aws_s3_bucket.datalake.id
    key = "emr-code/pyspark/job_delta_spark_upsert.py"
    acl = "private"
    source = "../etl/job_delta_spark_upsert.py"
    etag = filemd5("../etl/job_delta_spark_upsert.py")
}