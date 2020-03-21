---
title: State machine execution describe policy
category: AWS
date: 2019-04-15
---

-----

```javascript
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "states:DescribeExecution",
        "states:GetExecutionHistory",
        "states:StopExecution"
      ],
      "Resource": [
        "arn:aws:states:*:*:execution:*:*"
      ]
    }
  ]
}
 
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "states:DescribeStateMachine",
                "states:StartExecution",
                "states:DeleteStateMachine",
                "states:ListExecutions"
            ],
            "Resource": [
                "arn:aws:states:*:*:stateMachine:*"
            ]
        }
    ]
}
```

-----
