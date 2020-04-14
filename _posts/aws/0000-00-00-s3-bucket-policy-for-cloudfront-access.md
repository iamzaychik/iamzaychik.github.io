---
title: S3 bucket policy for CloudFront access
category: AWS
date: 2020-04-10
---

-----

```javascript
{
    "Version": "2012-10-17",
    "Id": "PolicyForCloudFrontPrivateContent",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "AWS": "arn:aws:iam::cloudfront:user/CloudFront Origin Access Identity YOUR_IDENTITY"
            },
            "Action": "s3:GetObject",
            "Resource": "arn:aws:s3:::YOUR_BUCKET/*"
        }
    ]
}

```

-----
