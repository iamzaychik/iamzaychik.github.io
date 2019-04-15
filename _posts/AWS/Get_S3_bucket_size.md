---
title: Get S3 bucket size
categories: AWS
date: 2019-04-15
---

**Для того, щоб дізнатися розмір файлів в S3 bucket, скористаємося aws-cli:**
`aws s3 ls s3://BUCKET_NAME --recursive --human-readable --summarize`
-----