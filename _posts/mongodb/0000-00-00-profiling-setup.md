---
title: Profiling setup
category: MongoDB
date: 2020-03-21
---

-----
* Check current profiling:
```sql
db.getProfilingStatus()
```

* Enable profiling for all queries:
```sql
db.setProfilingLevel(2)
```

* Enable profiling for queries longer that `slowms` value:
```sql
db.setProfilingLevel(1, { slowms: 1 })
```

* Disable profiling:
```sql
db.setProfilingLevel(0)
```

-----
