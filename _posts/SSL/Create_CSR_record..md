---
title: Create CSR record
categories: SSL
date: 2019-04-15
---

**Щоб створити CSR запит на отримання ssl сертифіката, робимо:**
`openssl req -new -newkey rsa:2048 -nodes -keyout yourdomain.key -out yourdomain.csr`
-----