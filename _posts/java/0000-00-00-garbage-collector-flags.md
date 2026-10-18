---
title: Garbage collector flags
category: Java
date: 2020-08-26
---

---

*Configure Java garbage collector logging flags.*

```bash
-XX:+PrintGCDetails
-XX:+PrintGCDateStamps
-XX:+PrintGCApplicationStoppedTime
-XX:+PrintGCApplicationConcurrentTime
-XX:+UseGCLogFileRotation
-XX:NumberOfGCLogFiles=10
-XX:GCLogFileSize=20M
-Xloggc:./log/gc.%t.log
```

---
