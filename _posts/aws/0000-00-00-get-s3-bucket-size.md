---
title: Get S3 bucket size
category: AWS
date: 2019-04-15
---

---

*Calculate an S3 bucket’s total size from the AWS CLI.*

```bash
$ aws s3 ls s3://BUCKET_NAME --recursive --human-readable --summarize
```

---
