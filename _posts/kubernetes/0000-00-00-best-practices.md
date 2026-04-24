---
title: Best practices
category: Kubernetes
date: 2026-04-24
---

-----

```bash
## Containers:

 - Containers should be ephemeral.
 - Use a .dockerignore file.
 - Use multi-stage builds.
 - Avoid installing unnecessary packages.
 - Each container should have only one concern.
 - Minimize the number of layers.
 - Sort multi-line arguments.
 - Build cache.
 - Don’t trust arbitrary base images.
 - Use small base image.
 - Use the builder pattern.

## Inside Container:

 - Use non-root user inside container.
 - Make the file system read only.
 - One process per container.
 - Don’t restart on failure, crash cleanly instead.
 - Log to stdout & stdderr
 - Add dumb-init to prevent zombie processes.

## Deployment:

 - Use the “record” option for easier rollbacks.
 - Use plenty of descriptive labels.
 - Use sidecar containers for proxies , watchers etc.
 - Don’t use sidecar for bootstrapping.
 - Use init container instead.
 - Don’t Use latest or no tag.
 - Readness & liveness probes are your friends.

## Security Best Practices:

 - Ensure That Images Are Free of Vulnerabilities.
 - Ensure That Only Authorized Images are Used in Your Environment.
 - Limit Direct Access to Kubernetes Nodes.
 - Create Administrative Boundaries between Resources.
 - Define Resource Quota.
 - Implement Network Segmentation.
 - Apply Security Context to Your Pods and Containers.
 - Log Everything.
 - Integrate Security into your CI/CD pipeline
 - Implement Continuous Security Vulnerability Scanning
 - Regularly Apply Security Updates to Your Environment.
 - Use private registries to store your approved images.
 - Make sure you only push approved images to these registries

## Services:

 - Don’t always use type: LoadBalancer
 - Ingress is great
 - Type: NodePort is good enough.
 - Use static IP, they are free.
 - Map external service to internal ones.

## Application architecture:

 - Use helmchart
 - ALL downstream dependencies are unreliable.
 - Make sure you micro-service aren’t too micro.
 - Use service mesh.

## Cluster Management:

 - Use Google container engine
 - Resources, anti-afinity & scheduling.
 - Use Namespace to split up your cluster.
 - Role base access control.
 - Unleash the chaos monkey.
 - Limit SSH access to Kubernetes nodes, Ask users to use “kubectl exec”
 - Create administrative boundaries between resources.
 - Implement Network segmentation.

## Monitoring and visibility:

 - Cluster-based logging
 - Log container activity into a central log hub.
 - Use Fluentd agent on each node
 - Ingested logs using Google Stackdriver Logging
 - Elasticsearch Viewed with Kibana.
```

-----

[Source](https://medium.com/@sachin.arote1/kubernetes-best-practices-9b1435a4cb53)

-----
