---
title: Migrate data between clusters
category: Atlas
date: 2026-04-24
---

-----

```bash
1. Add user with next permissions on source (looks like ReadWriteAll is not enough):
 - clusterMonitor
 - readAnyDatabase
2. Add to whitelist on source:
 - 35.170.231.208/32
 - 3.92.230.111/32
 - 3.94.238.78/32
 - 54.84.208.96/32
3. Cluster options -> Migrate data to this cluster
4. Fill created user credentials and source primary node address:port
5. Is SSL enabled? -> YES (leave CA cert field empty)
6. Clear any existing data on your target cluster? -> YES
7. Check if all OK with Validate button
8. Migrate
9. After the migration is finished, it keeping destination in sync before cutover
```

-----
