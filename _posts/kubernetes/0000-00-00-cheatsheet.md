---
title: Cheatsheet
category: Kubernetes
date: 2023-02-05
---

-----

* Show events sorted by timestamp:
```bash
$ kubectl get events --sort-by='.metadata.creationTimestamp' -A
```

-----

* Show logs related to all containers with app label:
```bash
$ kubectl logs -f -l app=application
```

-----

* Scale application deployment to needed replicas count:
```bash
$ kubectl scale --replicas 0 deployment application-deployment
```

-----

* Show resources usage across the nodes:
```bash
$ kubectl top nodes
```

-----

