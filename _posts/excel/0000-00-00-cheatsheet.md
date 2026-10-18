---
title: Cheatsheet
category: Excel
date: 2026-04-24
---

---

*Unhide selected Excel rows and insert the current date dynamically.*

* Open only needed hidden rows:

```text
Відкрийте ваш файл Excel.
Натисніть Alt + F11, щоб відкрити редактор VBA.
В редакторі VBA створіть новий модуль:
Перейдіть у меню Insert → Module.
Вставте наступний код:

Sub UnhideRows317and318()
    ' Відкриває тільки рядки 317 і 318
    Rows("317:318").Hidden = False
End Sub

Натисніть F5 або виберіть Run для виконання коду.
```

---

* Insert current date dynamically:

```text
Ctrl f9
{ DATE \@ "yyyy" }
```

---
