---
title: Cause OutOfMemory on server
category: Ubuntu
date: 2020-08-26
---

-----

```bash
$ perl -wE 'my @xs; for (1..2**20) { push @xs, q{a} x 2**20 }; say scalar @xs;'
```

-----
