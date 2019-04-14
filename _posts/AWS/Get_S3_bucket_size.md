Title: AWS. Get S3 bucket size
Pub date: 26.09.2018
Category: AWS, aws-cli, 

**Для того, щоб дізнатися розмір файлів в S3 bucket, скористаємося aws-cli:**
`aws s3 ls s3://BUCKET_NAME --recursive --human-readable --summarize`
-----