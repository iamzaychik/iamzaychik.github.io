---
title: List all deploy keys
category: GitLab
date: 2019-07-24
---

-----

1. Get access token with api permissions from your GitLab account
2. Request api:
```bash
$ curl --header "PRIVATE-TOKEN: <TOKEN>" "https://gitlab.example.com/api/v4/deploy_keys"
```

-----