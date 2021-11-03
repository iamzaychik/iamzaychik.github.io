---
title: Formatted curl output
category: Network
date: 2021-11-03
---

-----

1. *Create a new file, curl-format.txt, and paste in:*
```bash
     time_namelookup:  %{time_namelookup}s\n
        time_connect:  %{time_connect}s\n
     time_appconnect:  %{time_appconnect}s\n
    time_pretransfer:  %{time_pretransfer}s\n
       time_redirect:  %{time_redirect}s\n
  time_starttransfer:  %{time_starttransfer}s\n
                     ----------\n
          time_total:  %{time_total}s\n
```

2. *Make a request:*
```bash
$ curl -w "@curl-format.txt" -o /dev/null -s "http://wordpress.com/"
```

-----
