---
title: aws-cli MFA access
category: AWS
date: 2020-03-21
---

-----

* Setup parser:
```bash
# Ubuntu
$ sudo apt install jq
# Mac
$ brew install jq
```

* Open `~/.aws/credentials` and change profile name from `[default]` to `[get_mfa]`

* Login to AWS admin console and get your MFA ARN from account security settings

* Create script for get temp profile and insert you MFA ARN:

```bash
#!/bin/bash

read -p 'Enter the code from Google Auth:' token_code

if [[ -z ${token-code} ]]; then
    echo 'No code entered!'
else
    serial_number='arn:aws:iam::<YOUR_MFA_ARN>'

    response=$(aws --profile get_mfa sts get-session-token --serial-number ${serial_number} --token-code ${token_code})
    access=$(echo ${response} | jq -r '.Credentials.AccessKeyId')
    secret=$(echo ${response} | jq -r '.Credentials.SecretAccessKey')
    token=$(echo ${response} | jq -r '.Credentials.SessionToken')

    aws configure set profile.default.aws_access_key_id ${access}
    aws configure set profile.default.aws_secret_access_key ${secret}
    aws configure set profile.default.aws_session_token ${token}
fi
```

* Add execution permissions for script:
```bash
$ chmod +x get_mfa.sh
```

-----
