---
title: Time format
category: Cacti
date: 2019-04-15
---

-----

1. Open `lib/functions.php`
2. Find line with `$date` variable, duplicate and comment
3. Change `$date` to what you want using [PHP date()](https://php.net/manual/en/function.date.php):
```
$date = date("d/m/Y H:i:s");
```

-----