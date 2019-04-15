---
title: Configuration via TFTP
category: Alcatel
date: 2019-04-15
---

-----

* [Save](#save)
* [Restore](#restore)

-----

### Save

* List files from `working/`:
```
-> ls working
```

* Upload config file `boot.cfg` to tftp-server:
```
-> tftp ***.***.***.*** put source-file working/boot.cfg destination-file boot.cfg
```

* List files from `network/`:
```
-> ls network
```

* Upload users file `userTable5` to tftp-server:
```
-> tftp ***.***.***.*** put source-file network/userTable5 destination-file userTable5
```

-----

### Restore

* Remove current `boot.cfg`:
```
-> delete working/boot.cfg
```

* Download new configuration:
```
-> tftp ***.***.***.*** get source-file boot.cfg destination-file working/boot.cfg
```

* Remove current `userTable5`:
```
-> delete network/userTable5
```

* Download new users configuration:
```
-> tftp ***.***.***.*** get source-file userTable5 destination-file network/userTable5
```

* Reboot switch with new configuration:
```
-> reload working no rollback-timeout
```

-----