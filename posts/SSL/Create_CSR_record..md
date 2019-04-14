Title: SSL. Create CSR record.
Pub date: 23.01.2018
Category: SSL, 

**Щоб створити CSR запит на отримання ssl сертифіката, робимо:**
`openssl req -new -newkey rsa:2048 -nodes -keyout yourdomain.key -out yourdomain.csr`
-----