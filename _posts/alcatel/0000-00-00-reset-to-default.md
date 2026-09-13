---
title: Reset to default
category: Alcatel
date: 2019-04-15
---

---

1. Login to switch via console
2. List `working/` dir:

```text
ls working/
```

3. Remove first config:

```text
delete working/boot.cfg
```

4. List `certified/` dir:

```text
ls certified/
```

5. Remove second config:

```text
delete certified/boot.cfg
```

6. Next restart the switch:

```text
reload
```

7. Once the switch is restarted, it back to factory default.

---
