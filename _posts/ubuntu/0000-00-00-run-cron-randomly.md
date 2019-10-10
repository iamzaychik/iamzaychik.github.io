---
title: Run cron randomly
category: Ubuntu
date: 2019-10-10
---

-----

1. To run the script 2 times per day:
```bash
0 0,12 * * * sleep $(( $$ \% 21600 )); /path/to/script.sh
```

This will start the job at noon and midnight, then sleep for up to 6 hours (half of the 12-hour interval) before starting the script.

-----

[Source](https://unix.stackexchange.com/a/333620)

-----