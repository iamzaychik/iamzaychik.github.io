---
title: Check HTTP status code
categories: cURL
date: 2019-04-15
---

**Перевірити з командного рядка, який http status віддає web-сервер, можна так:**
`curl -s -o /dev/null -w "%{http_code}" http://localhost | grep 200`
_При успішному отриманні 200 будемо мати exitstatus 0, при помилці - 1._
-----