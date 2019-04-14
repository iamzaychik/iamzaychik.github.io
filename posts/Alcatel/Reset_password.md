Title: Alcatel. Reset password
Pub date: 28.04.2015
Category: Alcatel OS 6850/E, 

_Як повернути втрачене, маючи консольний доступ._

-----

1. Нажимаємо Enter при загрузці;
2. Бачимо знак =&gt;;
3. Пишемо:
`=&gt;fatls ide :1,0
=&gt;fatls ide :1,0 /network
=&gt;fatdelete ide :1,0 /network/usertableX (X = 4 або 5, там видно буде)
=&gt;run miniboot`

4. Алкатель йде в ребут, після цього:
`login:    admin
password: switch`
-----