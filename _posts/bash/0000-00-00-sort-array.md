---
title: Sort array
category: Bash
date: 2021-02-17
---

---

*Sort a Bash array line by line.*

```bash
IFS=$'\n' sorted=($(sort <<<"${array[*]}"))
unset IFS
```

---

[Source](https://stackoverflow.com/a/11789688)

---
