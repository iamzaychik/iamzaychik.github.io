---
title: Clear history
category: Ubuntu
date: 2019-04-15
---

-----

* Clear history for current session:
```bash
$ history -r
```

* Completely clear history:
```bash
$ history -cw
-c - clear file
-w - append current session commands to file
```

* Remove specific line:
```bash
$ history -dw 352
```

* Don't save command:
```bash
$ <SPACE> <COMMAND>
```

* Don't save commands for current session:
```bash
$ unset HISTFILE
```

-----

[Source](http://www.shellhacks.com/ru/Kak-Ochistit-Istoriyu-Komand-v-BASH)

-----
