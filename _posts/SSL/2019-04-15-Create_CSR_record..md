---
title: Create CSR record
---

**Щоб створити CSR запит на отримання ssl сертифіката, робимо:**
`openssl req -new -newkey rsa:2048 -nodes -keyout yourdomain.key -out yourdomain.csr`
-----