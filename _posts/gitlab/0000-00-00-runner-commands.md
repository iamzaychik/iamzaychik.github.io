---
title: Runner commands
category: GitLab
date: 2020-03-21
---

-----

* Adds a new configuration entry, it doesn’t remove the previous ones.
```bash
$ gitlab-runner register --name my-runner --url http://gitlab.example.com --registration-token my-registration-token 
```

-----

* This command checks if the registered runners can connect to GitLab, but it doesn’t verify if the runners are being used by the GitLab Runner service
```bash
$ gitlab-runner verify
```

-----

* To delete the old and removed from GitLab runners, execute the following command
```bash
$ gitlab-runner verify --delete
```

-----
