
resource "aws_s3_bucket_object" "to_parquet" {

    bucket = aws_s3_bucket.datalake.id
    key = "emr-code/pyspark/job_to_parquet.py"
    acl = "private"
    source = "to_parquet2.py"
    etag = filemd5("to_parquet2.py")
}

resource "aws_s3_bucket_object" "delta_insert" {

    bucket = aws_s3_bucket.datalake.id
    key = "emr-code/pyspark/job_delta_spark_insert.py"
    acl = "private"
    source = "job_delta_spark_insert.py"
    etag = filemd5("job_delta_spark_insert.py")
}

resource "aws_s3_bucket_object" "delta_upsert" {

    bucket = aws_s3_bucket.datalake.id
    key = "emr-code/pyspark/job_delta_spark_upsert.py"
    acl = "private"
    source = "job_delta_spark_upsert.py"
    etag = filemd5("job_delta_spark_upsert.py")
}