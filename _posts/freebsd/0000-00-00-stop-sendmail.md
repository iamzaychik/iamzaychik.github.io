---
title: Stop sendmail
category: FreeBSD
date: 2019-04-15
---

-----

`sendmail_enable="NO"` is not enough.

1. Open config:
```bash
ee /etc/rc.conf
```

2. Disable all:
```bash
sendmail_enable="NO"
sendmail_submit_enable="NO"
sendmail_outbound_enable="NO"
sendmail_msp_queue_enable="NO"
```

3. Try if daemon can run:
```bash
./sendmail start
```

4. If no output - PROFIT!

-----

[Source](https://guruway.wordpress.com/2010/03/11/freebsd-%D0%BE%D1%82%D0%BA%D0%BB%D1%8E%D1%87%D0%B5%D0%BD%D0%B8%D0%B5-sendmail/)

-----

