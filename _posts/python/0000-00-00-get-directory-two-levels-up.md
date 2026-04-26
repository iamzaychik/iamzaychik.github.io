---
title: Get directory two levels up
category: Python
date: 2019-04-15
---

* Get path for directory located two levels up:

```python
import os.path as path
import sys

two_up =  path.abspath(path.join(__file__ ,"../.."))
```

-----
