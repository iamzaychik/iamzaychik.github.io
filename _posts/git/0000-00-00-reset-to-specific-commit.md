---
title: Reset to specific commit
category: Git
date: 2019-04-15
---

---

*Reset a Git branch to a specific commit and force-push changes.*

- Find needed commit:

```bash
$ git log
```

- Rollback unwanted commits:

```bash
$ git reset --hard <SOME-COMMIT>
$ git reset --soft HEAD@{1}
```

- Push changes to repo:

```bash
$ git push origin HEAD --force
```

---
