Title: Nginx. 98: Address already in use
Pub date: 13.05.2016
Category: Nginx, 

_Лікуємо дивний баг нжинкса, при якому він не розказує нікому про бійцівський клюб._

-----
1. Маємо отаку помилку при спробі запустити Nginx:
`[emerg]: bind() to 0.0.0.0:80 failed (98: Address already in use)`

2. Виконуємо в консолі:
`sudo fuser -k 80/tcp`

3. Перезапускаємо сервіс:
`service nginx start`
-----