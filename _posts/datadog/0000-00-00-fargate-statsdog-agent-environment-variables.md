---
title: Fargate statsdog agent environment variables
category: Datadog
date: 2021-02-17
---

-----

**DD_API_KEY** - Your Datadog API key (**required**)
**DD_DOGSTATSD_NON_LOCAL_TRAFFIC** (true) - Listen to DogStatsD packets from other containers (required to send custom metrics)
**DD_DOGSTATSD_TAGS** (["Environment:production"]) - Additional tags to append to all metrics, events, and service checks received by this DogStatsD server, for example: ["env:golden", "group:retrievers"]
**DD_HEALTH_PORT** (5555) - Set this to 5555 to expose the Agent health check at port 5555

-----

[Source](https://docs.datadoghq.com/agent/docker/?tab=standard)

-----
