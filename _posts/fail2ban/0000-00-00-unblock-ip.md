---
title: Unblock IP
category: Fail2Ban
date: 2019-04-15
---

---

*Unblock an IP address in Fail2Ban with version-specific commands.*

- Before v0.8.8:

```bash
$ fail2ban-client get <JAILNAME> actionunban <IP>
```

- Version v0.8.8 and up:

```bash
$ fail2ban-client set <JAILNAME> unbanip <IP>
```

---
