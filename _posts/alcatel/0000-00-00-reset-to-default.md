---
title: Reset to default
category: Alcatel
date: 2019-04-15
---

-----

1. Login to switch via console
2. List `working/` dir:
```
ls working/
```

3. Remove first config:
```
delete working/boot.cfg
```

4. List `certified/` dir:
```
ls certified/
```

5. Remove second config:
```
delete certified/boot.cfg
```

6. Next restart the switch:
```
reload
```

7. Once the switch is restarted, it back to factory default.

-----