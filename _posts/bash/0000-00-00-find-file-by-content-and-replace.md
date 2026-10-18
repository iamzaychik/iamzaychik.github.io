---
title: Find file by content and replace
category: Bash
date: 2019-05-29
---

---

*Find matching files and replace text with Bash tools.*

```bash
$ grep 'text' -P -R -I -l * | xargs sed -i 's/text/replace/g'
```

---
