---

title: Reset to default
category: Alcatel
date: 2019-04-15
---

*Reset an Alcatel OmniSwitch to factory-default configuration files.*

1. Login to switch via console
2. List `working/` dir:

```text
ls working/
```

1. Remove first config:

```text
delete working/boot.cfg
```

1. List `certified/` dir:

```text
ls certified/
```

1. Remove second config:

```text
delete certified/boot.cfg
```

1. Next restart the switch:

```text
reload
```

1. Once the switch is restarted, it back to factory default.

---
