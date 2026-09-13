---
title: Configuration via TFTP
category: Alcatel
date: 2019-04-15
---

---

* [Save](#save)
* [Restore](#restore)

---

### Save

* List files from `working/`:

```text
-> ls working
```

* Upload config file `boot.cfg` to tftp-server:

```text
-> tftp **.**.**.** put source-file working/boot.cfg destination-file boot.cfg
```

* List files from `network/`:

```text
-> ls network
```

* Upload users file `userTable5` to tftp-server:

```text
-> tftp **.**.**.** put source-file network/userTable5 destination-file userTable5
```

---

### Restore

* Remove current `boot.cfg`:

```text
-> delete working/boot.cfg
```

* Download new configuration:

```text
-> tftp **.**.**.** get source-file boot.cfg destination-file working/boot.cfg
```

* Remove current `userTable5`:

```text
-> delete network/userTable5
```

* Download new users configuration:

```text
-> tftp **.**.**.** get source-file userTable5 destination-file network/userTable5
```

* Reboot switch with new configuration:

```text
-> reload working no rollback-timeout
```

---
