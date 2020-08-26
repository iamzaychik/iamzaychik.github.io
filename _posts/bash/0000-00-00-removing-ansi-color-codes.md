---
title: Removing ANSI color codes from text stream
category: Bash
date: 2020-08-26
---

-----

* Bash examples:
```bash
$ sed 's/\x1b\[[0-9;]*m//g'           # Remove color sequences only
$ sed 's/\x1b\[[0-9;]*[a-zA-Z]//g'    # Remove all escape sequences
$ sed 's/\x1b\[[0-9;]*[mGKH]//g'      # Remove color and move sequences
$ sed 's/\x1b\[[0-9;]*[mGKF]//g'      # Remove color and move sequences
```

* Perl examples:
```perl
$ perl -pe 's/\e\[[0-9;]*m//g'          # Remove colors only
$ perl -pe 's/\e\[[0-9;]*[mG]//g'
$ perl -pe 's/\e\[[0-9;]*[mGKH]//g'
$ perl -pe 's/\e\[[0-9;]*[a-zA-Z]//g'
$ perl -pe 's/\e\[[0-9;]*m(?:\e\[K)?//g' # Adam Katz's trick
```

* From Rails logs:
```bash
$ cat staging.log | sed -r "s/\x1B\[([0-9]{1,3}((;[0-9]{1,3})*)?)?[m|K]//g" > staging.colorless.log
```

-----

[Source](https://superuser.com/a/380778)

[Source2](https://makandracards.com/makandra/1695-removing-ansi-color-codes-from-rails-logs)

-----
