---
title: Command confirmation
category: Bash
date: 2026-07-12
---

-----

* Confirm next command before execution:

```bash
trap 'echo "# $BASH_COMMAND";read' DEBUG
```
-----
