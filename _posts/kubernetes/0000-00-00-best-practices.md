---
title: Best practices
category: Kubernetes
date: 2026-04-24
---

-----

### Containers:

* Containers should be ephemeral.
* Use a `.dockerignore` file.
* Use multi-stage builds.
* Avoid installing unnecessary packages.
* Each container should have only one concern.
* Minimize the number of layers.
* Sort multi-line arguments.
* Build cache.
* Don’t trust arbitrary base images.
* Use a small base image.
* Use the builder pattern.

### Inside Container:

* Use a non-root user inside a container.
* Make the file system read-only.
* One process per container.
* Don’t restart on failure; crash cleanly instead.
* Log to `stdout` and `stderr`.
* Add `dumb-init` to prevent zombie processes.

### Deployment:

* Use the “record” option for easier rollbacks.
* Use plenty of descriptive labels.
* Use sidecar containers for proxies, watchers, etc.
* Don’t use a sidecar for bootstrapping.
* Use an init container instead.
* Don’t use `latest` or omit a tag.
* Readiness and liveness probes are your friends.

### Security Best Practices:

* Ensure that images are free of vulnerabilities.
* Ensure that only authorized images are used in your environment.
* Limit direct access to Kubernetes nodes.
* Create administrative boundaries between resources.
* Define resource quotas.
* Implement network segmentation.
* Apply a security context to your pods and containers.
* Log everything.
* Integrate security into your CI/CD pipeline.
* Implement continuous security vulnerability scanning.
* Regularly apply security updates to your environment.
* Use private registries to store approved images.
* Make sure you only push approved images to these registries.

### Services:

* Don’t always use `type: LoadBalancer`.
* Ingress is great.
* `type: NodePort` is good enough.
* Use static IPs; they are free.
* Map external services to internal ones.

### Application architecture:

* Use a Helm chart.
* All downstream dependencies are unreliable.
* Make sure your microservices aren’t too micro.
* Use a service mesh.

### Cluster Management:

* Use Google Container Engine.
* Resources, anti-affinity, and scheduling.
* Use namespaces to split up your cluster.
* Role-based access control.
* Unleash the chaos monkey.
* Limit SSH access to Kubernetes nodes; ask users to use `kubectl exec`.
* Create administrative boundaries between resources.
* Implement network segmentation.

### Monitoring and visibility:

* Cluster-based logging.
* Log container activity into a central log hub.
* Use a Fluentd agent on each node.
* Ingest logs using Google Stackdriver Logging.
* View Elasticsearch logs with Kibana.

-----

[Source](https://medium.com/@sachin.arote1/kubernetes-best-practices-9b1435a4cb53)

-----
