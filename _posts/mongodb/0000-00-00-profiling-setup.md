---
title: Profiling setup
category: MongoDB
date: 2020-03-21
---

-----
* Check current profiling:
```bash
db.getProfilingStatus()
```

* Enable profiling for all queries:
```bash
db.setProfilingLevel(2)
```

* Enable profiling for queries longer that `slowms` value:
```bash
db.setProfilingLevel(1, { slowms: 1 })
```

* Disable profiling:
```bash
db.setProfilingLevel(0)
```

-----
