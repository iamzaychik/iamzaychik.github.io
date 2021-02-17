---
title: Find files modified in last 24h
category: Bash
date: 2020-03-21
---

-----

```bash
$ find /<directory> -newermt "-24 hours" -ls

$ find /<directory> -newermt "1 day ago" -ls

$ find /<directory> -newermt "yesterday" -ls

$ find /<directory> -mtime -1 -ls

# Print only filenames
$ find /<directory> -type f -printf "%f\n"
```

-----
