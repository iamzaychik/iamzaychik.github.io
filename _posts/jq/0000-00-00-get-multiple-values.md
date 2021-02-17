---
title: Get multiple values
category: jq
date: 2021-02-17
---

-----

```bash
$ echo "${json}" | jq '.users[] | "\(.first) \(.last)"'
```

-----

[Source](https://stackoverflow.com/a/31418194)

-----
