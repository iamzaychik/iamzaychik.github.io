---
title: Fargate statsdog agent environment variables
category: Datadog
date: 2021-02-17
---

-----

```bash
# Your Datadog API key (**required**)
DD_API_KEY

# Listen to DogStatsD packets from other containers (required to send custom metrics)
DD_DOGSTATSD_NON_LOCAL_TRAFFIC - true

# Additional tags to append to all metrics, events, and service checks received by this DogStatsD server, for example: ["env:golden", "group:retrievers"]
DD_DOGSTATSD_TAGS - ["Environment:production"]

# Set this to 5555 to expose the Agent health check at port 5555
DD_HEALTH_PORT - 5555
```

-----

[Source](https://docs.datadoghq.com/agent/docker/?tab=standard)

-----
