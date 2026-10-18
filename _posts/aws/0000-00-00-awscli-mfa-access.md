---
title: aws-cli MFA access
category: AWS
date: 2020-03-21
---

---

*Create temporary AWS credentials from an IAM MFA token.*

### Install jq

```bash
# Ubuntu
$ sudo apt install jq
# Mac
$ brew install jq
```

### Configure the AWS profile

- Open `~/.aws/credentials` and change the profile name from `[default]` to
  `[get_mfa]`.

### Find the MFA ARN

- Log in to the AWS administrator console and get the MFA ARN from account
  security settings.

### Create the MFA script

- Create a script for a temporary profile and insert your MFA ARN:

```bash
#!/bin/bash

read -p 'Enter the code from Google Auth:' token_code

if [[ -z ${token_code} ]]; then
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

### Make the script executable

```bash
$ chmod +x get_mfa.sh
```

---
