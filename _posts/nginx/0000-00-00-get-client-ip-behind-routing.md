---
title: Get client IP behind routing
category: Nginx
date: 2019-04-15
---

**Вказуємо адреси для Nginx, які передають нам правильну адресу користувача і встановлюємо відповідний хедер:**
`real_ip_header X-Forwarded-For;
set_real_ip_from 10.244.0.0/16;`
-----