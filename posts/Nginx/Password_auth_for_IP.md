Title: Nginx. Авторизація по парольчику для зовнішніх IP
Pub date: 11.01.2016
Category: Nginx, 

_Не допустимо супостата до комісарського тіла!_
-----


Если вам нужно исключить для определёных IP auth_basic, то эта статья для вас. Замечу, что данный метод позволяет исключить только по IP, а не по другим признакам. Для этого в nginx’e есть модуль satisfy. Ниже выдержка из документации:

`синтаксис: satisfy all | any;
умолчание: satisfy all;
контекст: http, server, location`

Разрешает доступ, если оба (all) или хотя бы один (any) из модулей ngx_http_access_module и ngx_http_auth_basic_module разрешают доступ.

**Пример реализации**:

`server
{
    satisfy any;
    allow 10.10.10.10;
    allow 127.0.0.1;
    deny all;
    auth_basic "closed site";
    auth_basic_user_file /usr/local/.htpasswd;
}`

Если зайти с хоста 10.10.10.10 то запрос пароля выводится не будет и нас пустит.

-----

* <a href="http://skeletor.org.ua/?p=3706" target="_blank">Пишуть люди</a>

-----