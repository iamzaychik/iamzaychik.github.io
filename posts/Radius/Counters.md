Title: Radius. Counters
Pub date: 17.03.2015
Category: Radius, 

_Тута ми зарізаємо юзернеймів по таймінгам і торентам.
Бо треба читати книжки і виходити на вулицю, а не сидіть наблюдать котиків в інтернеті, ога._

-----

**Mikrotik-Xmit-Limit — Download-лимит пользователя**, при достижении которого сессия завершается. Но если поставить его постоянным — пользователь перелогинивается (а если включены куки, даже не замечает этого) и продолжает работать. Посему будем считать и выдавать нужное.

добавляем новый параметр в /etc/freeradius/dictionary (если его нет):
например так:

`ATTRIBUTE       Mikrotik-Xmit-Limit          3001    integer
ATTRIBUTE       Download-Limit               3002    integer`

включаем в radiusd.conf счетчики раскоментировав

`$INCLUDE sql/mysql/counter.conf`

и добавляем в него счетчик:

`sqlcounter downloadcounter {
counter-name =  Download-Limit-Total
check-name = Download-Limit
reply-name = Mikrotik-Xmit-Limit
sqlmod-inst = sql
key = User-Name
reset = never
query = "SELECT ifnull(SUM(acctoutputoctets),0) FROM radacct WHERE username='%{ %k}'"
}`

здесь:
check-name — тот самый параметр который нужно добавить (или найти в словарях подходящий)
reply-name — сильно шаманское поле — из пользовательского аттрибута вычетается значение счетчика и возвращается под этим именем в ответе
query как не сложно догадаться — собсно запрос. Проверка вот тут не очень, нужна — но бывает что потребуется: если запрос возвращает NULL (например в базе нет записей по этому отбору) freeradius переисполненный радостью этого события проигнорирует счетчик.

Подключаем модуль счетчика в секции authorize

Ну и добавляем check-аттрибут:

`insert into radcheck (username,attribute,op,value) values ('test', 'Download-Limit', ':=', '1000000');`

А дальше всё — если ничего не забыл, должно работать.

На ошибки в атрибутах SQL таблиц FreeRAIDUS реагирует вполне однозначно: он их игнорирует. Поэтому, если сани не едут,
первое что нужно сделать — это перенести пользователя в файловую базу данных (users)

`test       Cleartext-Password := "123", Download-Limit := 100000`

если аттрибут не найден в справочниках, FreeRADIUS ругнется и незапустится (invalid octet string … for attribute)

**Счетчик общей длительности сессий пользователя:**

`sqlcounter uptimecounter {
counter-name = Uptime-Total
check-name = Uptime-Limit
reply-name = Session-Timeout
sqlmod-inst = sql
key = User-Name
reset = never
query = "SELECT ifnull(sum(time_to_sec(timediff(acctstoptime,acctstarttime))),0) FROM radacct WHERE username like '%{ %k}'"
}`

Подключить модуль в секции authorize
Аттрибут Uptime-Limit в стандартных справочниках есть, если что — добавить не сложно.
Время сессии в секундах.

-----

* <a title="Пишуть люди" href="https://bevice.ru/" target="_blank">Розумний дядько, честь і хвала</a>

-----