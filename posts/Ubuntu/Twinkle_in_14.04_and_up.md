Title: Twinkle in Ubuntu 14.04 and up
Pub date: 25.02.2015
Category: Ubuntu, 

_Говоримо і показуємо. В кращих традиціях Левітана._
-----

1.Добавить в /etc/apt/sources.list
`sudo sh -c 'echo "deb http://ua.archive.ubuntu.com/ubuntu/ precise main universe" >> /etc/apt/sources.list'`

2.Затем апдейтимся и ставим пакет принудительно из нужного репозитория
`apt-get update &amp;&amp; apt-get install -t precise twinkle`

3.И фиксируем версию пакета, чтобы при дальнейших обновлениях не обновиться на нерабочую версию
`sudo echo 'twinkle hold' | sudo dpkg --set-selections`

-----
* <a title="Пишуть люди" href="http://mecht.ru/2014/09/01/twinkle-%D0%B2-ubuntu-14-04/" target="_blank">Пишуть люди</a>
-----