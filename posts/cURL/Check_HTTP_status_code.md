Title: cURL. Check HTTP status code
Pub date: 19.12.2017
Category: cURL, 

**Перевірити з командного рядка, який http status віддає web-сервер, можна так:**
`curl -s -o /dev/null -w "%{http_code}" http://localhost | grep 200`
_При успішному отриманні 200 будемо мати exitstatus 0, при помилці - 1._
-----