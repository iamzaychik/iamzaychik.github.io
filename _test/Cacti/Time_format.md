---
title: Time format
category: Cacti
date: 2019-04-15
---

_Міняємо на зрозумілий формат оте, шо там написано._
-----
`1. Відкриваємо lib/functions.php
2. Знаходимо рядок, що містить змінну $date, дублюємо її і закоменчуємо.
3. Змінюємо новий рядок з $date згідно з вашим смаком, використовуючи функцію * <a href="https://php.net/manual/en/function.date.php" target="_blank">PHP date()</a>. напр. $date = date("d/m/Y H:i:s");`
-----