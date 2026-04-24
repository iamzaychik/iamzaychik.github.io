---
title: Setup EMR cluster
category: AWS
date: 2026-04-24
---

-----

```bash
1. Go to `EMR -> Create Cluster`
2. Select `Go to advanced options` at the top
3. Select needed release (now it's `emr-6.0.0`), then check `Hadoop, Livy and Spark` for installing to cluster
4. Make sure that `After last step completes: Clusters enters waiting state`
5. Press `Next`
6. Under `Networking` select VPC and subnet for cluster
7. Under `Cluster Nodes and Instances` select needed types for `Master x1 and Core x2` instances (Task not in use, 0)
8. Press `Next`
9. Specify `Cluster name and Tags`
10. Press `Next`
11. Choose `EC2 key pair`
12. Permissions are default (all custom in EMR_EC2_DefaultRole)
13. Security groups are default (`ElasticMapReduce-master and ElasticMapReduce-slave`)
14. Press `Create cluster`
15. Go to cluster properties and copy `Master public DNS`
16. Go to `Route 53` and add new record `emr.domain.com CNAME <Master public DNS>`
17. Ports to open for user access: `22, 8998, 8088`
```

-----
