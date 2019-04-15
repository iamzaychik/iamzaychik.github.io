---
title: Get script selfname without extension
categories: Bash
date: 2019-04-15
---

**Якщо нам при виконанні bash-скрипта потрібно отримати його ім'я без розширення - можна скористатися утилітою basename:**
`NAME=$(basename "$0" .sh)`
-----
