---
title: Create heapdump
category: Java
date: 2021-10-12
---

-----

```bash
$ sudo su <application_user>

# jmap -dump:format=b,file=/tmp/heapdump_jmap.hprof <service_id>

# jcmd <service_id> GC.heap_dump /tmp/heapdump_jmap.hprof
```

-----
