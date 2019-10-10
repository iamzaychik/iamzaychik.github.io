---
title: Lambda invoke from cli
category: AWS
date: 2019-10-10
---

-----

```bash
$ aws lambda invoke \
--invocation-type RequestResponse \
--function-name LAMBDA_NAME \
--region us-west-2 \
--log-type Tail \
--payload '{"a":1, "b":2 }' \
--profile lambda_user \
outputfile.txt
```

-----

[Source](https://medium.com/@jacobsteeves/aws-lambda-from-the-command-line-7efab7f3ebd9)

-----