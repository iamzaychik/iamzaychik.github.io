---
title: Migrate data between clusters
category: Atlas
date: 2026-04-24
---

---

*Migrate data between MongoDB Atlas clusters while keeping the destination
synchronized.*

### Migrate between clusters

1. Add a source user with these permissions:
   - `clusterMonitor`
   - `readAnyDatabase`
2. Add these addresses to the source whitelist:
   - `35.170.231.208/32`
   - `3.92.230.111/32`
   - `3.94.238.78/32`
   - `54.84.208.96/32`
3. Cluster options -> Migrate data to this cluster
4. Fill created user credentials and source primary node address:port
5. Is SSL enabled? -> YES (leave CA cert field empty)
6. Clear any existing data on your target cluster? -> YES
7. Check if all OK with Validate button
8. Migrate
9. After the migration is finished, it keeping destination in sync before
   cutover

---
