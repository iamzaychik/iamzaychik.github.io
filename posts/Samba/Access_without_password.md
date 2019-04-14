Title: Samba. Access without password
Pub date: 22.02.2016
Category: Samba, 

_Старость не радость.
Все забув, треба записати.
Бо цьому вашому інтернеті одні безтолочі._
-----
`[global]
security = user
map to guest = Bad User
browseable = yes
guest account = nobody
[Downloads]
path = /root/ultramalvines
browseable = yes
writeable = yes
guest ok = yes`
-----