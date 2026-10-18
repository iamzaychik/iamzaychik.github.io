---
title: Monitored partitions
category: SNMPD
date: 2019-04-15
---

---

*Configure filesystem partitions monitored by snmpd.*

Add to `/etc/snmp/snmpd.conf`:

- `includeAllDisks`
or:

```bash
disk /
disk /usr
disk /var
```

---
