---
title: Update firmware
category: Alcatel
date: 2019-04-15
---

---

*Upload and activate Alcatel OmniSwitch firmware through FileZilla.*

1. [Download firmware](http://support.alcadis.nl/downloads/Alcatel-Lucent/OmniSwitch/OS6850%20-%20EOS/)
2. Configure [management interface](/alcatel/cheatsheet.html#ip)
3. Enable FTP:

```text
ip service ftp
aaa authentication ftp local
```

4. Install FileZilla:
`$ sudo apt-get install filezilla`

5. Browse Alcatel with FileZilla and upload files to `/flash/working`
6. Reboot switch:
`reload working no rollback-timeout`

7. Synchronize stack:
`copy working certified flash-synchro`

8. Check firmware:
`show microcode`

---
