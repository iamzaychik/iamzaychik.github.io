---
title: Remove line in file
category: Text edit
date: 2019-04-22
---

-----

* Delete first or header line:
```bash
$ sed 'Nd' file.text
```

```bash
$ sed '1d' file
```

* Delete second line:
```bash
$ sed '2d' file
```

* Delete last line or footer line or trailer line:
```bash
$ sed '$d' file
```

-----

[Source](https://www.folkstalk.com/2013/03/sed-remove-lines-file-unix-examples.html)

-----