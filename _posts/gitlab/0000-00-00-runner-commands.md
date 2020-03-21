---
title: Runner commands
category: GitLab
date: 2020-03-21
---

-----

```bash
# Adds a new configuration entry, it doesn’t remove the previous ones.
$ gitlab-runner register --name my-runner --url http://gitlab.example.com --registration-token my-registration-token 
```

```bash
# This command checks if the registered runners can connect to GitLab, but it doesn’t verify if the runners are being used by the GitLab Runner service
$ gitlab-runner verify
```

```bash
# To delete the old and removed from GitLab runners, execute the following command
$ gitlab-runner verify --delete
```

-----
