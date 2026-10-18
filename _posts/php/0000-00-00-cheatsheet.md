---
title: Cheatsheet
category: PHP
date: 2019-04-15
---

---

*Корисні PHP трюки та функції.*

*Отримати текст між заданими значеннями:*
```php
function GetBetween($content, $start, $end)
{
$r = explode($start, $content);
if (isset($r[1]))
 {
 $r = explode($end, $r[1]);
 return $r[0];
 }
 return '';
}
```

*Дізнатися, від якого користувача виконується скрипт:*
```php
echo exec('whoami');
```
---
