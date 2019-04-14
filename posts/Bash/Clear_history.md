Title: Bash. Clear history
Pub date: 22.12.2015
Category: Bash, 

_Сікретнічаємо сікрєти од всього світу._
-----

Повністю видалити історію Bash:
`$ history -cw`
-c Очистити файл
-w Внести команди поточної сесії у файл

Видалити конкретний рядок:
`$ history -dw 352`

Очистка історії команд поточної сесії:
`$ history -r`

Не зберігати команду:
`$ пробіл команда`

Не зберігати всі команди поточної сесії:
`$ unset HISTFILE`

-----
<a href="http://www.shellhacks.com/ru/Kak-Ochistit-Istoriyu-Komand-v-BASH" target="_blank">Пишуть люди</a>
-----