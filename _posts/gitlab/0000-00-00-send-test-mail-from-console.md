---
title: Send test mail from console
category: GitLab
date: 2019-12-19
---

-----

```bash
$ docker exec -it gitlab_app bash
$ gitlab-rails console
irb(main):001:0> Notify.test_email('destination@example.com', 'Test', 'Hello world').deliver_now
```

-----
