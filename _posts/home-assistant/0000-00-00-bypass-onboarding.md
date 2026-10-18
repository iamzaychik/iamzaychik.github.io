---
title: Bypass onboarding
category: Home Assistant
date: 2026-04-24
---

---

*Bypass Home Assistant onboarding by editing its storage metadata.*

```text
.homeassistant/.storage/onboarding

{
  "version": 4,
  "minor_version": 1,
  "key": "onboarding",
  "data": {
    "done": [
      "user",
      "core_config",
      "analytics",
      "integration"
    ]
  }
}
```

---
