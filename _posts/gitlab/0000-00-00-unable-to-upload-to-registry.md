---
title: Unable to upload to the Registry due to permissions issue on _upload directory
category: GitLab
date: 2019-12-19
---

*Fix GitLab Registry upload permissions on the registry directory.*

---

```bash
$ chown -R registry:registry /var/opt/gitlab/gitlab-rails/shared/registry/docker/registry
```

---
