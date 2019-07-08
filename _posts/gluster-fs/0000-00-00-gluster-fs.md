---
title: Basic
category: Gluster FS
date: 2019-04-15
---

-----

* Distributed-replicated:
```bash
$ gluster volume create test replica 4 server1:/mnt/storage/1 server1:/mnt/storage/2 server3:/mnt/storage/1 server3:/mnt/storage/2 force
```

* Mount using fstab through main server with fallback:
```bash
server1:/dis-rep /mnt/extended glusterfs defaults,_netdev,backup-volfile-servers=server2:server3:/dis-rep 0 0
```

* Install server daemon on client, don't create node and mount through loopback:
```bash
localhost:data /data glusterfs defaults,_netdev 0 0
```

-----