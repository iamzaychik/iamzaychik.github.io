---
title: Get S3 bucket size
---

**Для того, щоб дізнатися розмір файлів в S3 bucket, скористаємося aws-cli:**
`aws s3 ls s3://BUCKET_NAME --recursive --human-readable --summarize`
-----