---
title: Cheatsheet
category: TOR
date: 2026-04-24
---

---

*Configure Tor SOCKS access and excluded exit-node countries.*

- torrc config:

```bash
SocksPort 127.0.0.1:9050
ExcludeExitNodes {ua}, {ru}, {by}
```

---
