---
title: Get multiple values
category: jq
date: 2021-02-17
---

---

*Extract combined user names from JSON with `jq`.*

```bash
$ echo "${json}" | jq '.users[] | "\(.first) \(.last)"'
```

---

[Source](https://stackoverflow.com/a/31418194)

---
