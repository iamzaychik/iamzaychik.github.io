Title: Python. Cheatsheet
Pub date: 07.12.2016
Category: Python, 

_Отвергая законы природы
Стоит у перил моста
Безумно глядя на воду
Совершенная красота._

-----

* <a href="http://www.python.org/dev/peps/pep-0008/">PEP8</a> - это стилевые правила для кода на языке Python.
<ul>
 	*используйте 4 пробела для отступа и не используйте табы, не смешивайте их
 	*максимальная длина строки 79 символов; для разрыва строки используйте отступы или бэкслеш
 	*функции верхнего уровня и определения классов отделяйте двумя пустыми строками
 	*определения методов внутри класса отделяйте одной пустой строкой
 	*дополнительные пустые строки используйте для логической группировки методов
 	*кодировка файлов должна быть Latin-1, а в Питоне 3 и выше - utf-8
 	*каждый импортируемый модуль с новой строки
 	*порядок импортов: стандартные модули, third-party модули, локальные модули приложения
 	*пустая строка между каждой группой импортов
 	*избегайте лишних пробелов внутри скобок; перед запятыми, точкой с запятой и двоеточиями
 	*избегайте лишних пробелов перед скобками с аргументами функций и скобками с индексами
 	*избегайте больше чем одного пробела между операторами (= - + итд)
 	*используйте одиночный пробел для выделения операторов
 	*избегайте пробелов вокруг '=', который используется для параметров по-умолчанию и keyword аргументов
 	*обновляйте комментарии вместе с кодом
 	*пишите комментарии по-английски
 	*избегайте имён из одиночных l, O, I
 	*для модулей и пакетов используйте короткие `всестрочные` имена
 	*для классов используйте `СловаНачинаютсяЗаглавными` имена
 	*для функций используйте `слова_с_подчёркиваниями` (или `смешанныйРегистр` если так получилось исторически)
 	*для методов используйте `слова_с_подчёркиваниями` имена
 	*для внутренних методов и переменных `_подчёркивание_перед_словом`
 	*для проверки на `None` используйте `is` или `is not`, не используйте операторы сравнения
 	*используйте исключения основанные на классах -- наследованные от Exception
 	*используйте методы класса string вместо строковых функций
 	*используйте ''.startswith() и ''.endswith() вместо вырезки из строк для проверки префиксов и суффиксов
 	*используйте isinstance() для проверки типа
 	*не сравнивайте булевы переменные с True и False
</ul>

-----

**Copy/move/remove files**
`#!/usr/bin/python
import os
import shutil
os.rename('name1','name2') # переименовать
shutil.copy('name1','name2') # копировать
shutil.move('name1', 'name2') # переместить
os.remove('name1') # удалить`

-----

**Зворотній відлік**
`#!/usr/bin/python3
import time
def countdown(count):
while (count >= 0):
print("Time left:", count, "sec")
count -= 1
time.sleep(1)
countdown(10)`

-----

* <a href="http://rukeba.com/by-the-way/pep8-korotko-i-po-russki/">Пишуть люди</a>

-----