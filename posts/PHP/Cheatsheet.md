---
title: Cheatsheet
---

_Корисні трюки і функції._
-----
**Отримати текст між заданими значеннями:**
`function GetBetween($content, $start, $end)
{
$r = explode($start, $content);
if (isset($r[1]))
 {
 $r = explode($end, $r[1]);
 return $r[0];
 }
 return '';
}`

**Дізнатися, від якого користувача виконується скрипт:**
`echo exec('whoami');`
-----