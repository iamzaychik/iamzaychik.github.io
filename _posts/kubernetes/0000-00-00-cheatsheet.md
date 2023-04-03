---
title: Cheatsheet
category: Kubernetes
date: 2023-02-05
---

-----

* Add config for new cluster to system env:
```bash
$ aws eks --region {{example_region}} update-kubeconfig --name {{cluster_name}}
```

-----

* Check cluster users:
```bash
$ kubectl describe -n kube-system configmap/aws-auth
```

-----

* Add user to cluster:
```bash
$ kubectl edit -n kube-system configmap/aws-auth
```

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
$ kubectl scale --replicas 0 deployment {{deployment}}
```

-----

* Show resources usage across the nodes:
```bash
$ kubectl top nodes
```

-----

* Remove pod stucked in Terminating status:
```bash
$ kubectl delete pod {{pod_name}} --grace-period=0 --force --namespace {{namespace}}
```

-----
