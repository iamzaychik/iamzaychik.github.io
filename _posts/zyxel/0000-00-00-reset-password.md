---
title: Basic commands
category: Zyxel
date: 2019-04-15
---

-----

**Сбросить системный пароль (по умолчанию в устройствах ZyXEL пароль 1234) можно только сбросив все настройки устройства на заводские установки.**
В данной инструкции мы представим два варианта сброса настроек устройства на заводские установки.

1. Сброс настроек с помощью кнопки RESET (Сброс) в пользовательских устройствах ZyXEL.

2. На некоторых устройствах (например, в Ethernet-коммутаторах) отсутствует кнопка RESET и для сброса пароля нужно записать в устройство файл конфигурации (*.rom) с заводскими настройками по умолчанию (как правило, rom-файл находится в архиве с микропрограммой). Также данный вариант может быть актуальным для сброса настроек через консольный порт (Console) устройства.



Для этого вам необходимо сделать следующее:

2.1. Подключите устройство ZyXEL через консольный порт к последовательному порту (COM-порту) компьютера. Введите команду ATBA5 для изменения скорости порта на 115200.

2.2. Запустите терминальную программу (например, HyperTerminal из состава Windows) со следующими настройками: Скорость - 9600 бит/с; Биты данных - 8; Четность - Нет; Стоповые биты - 1; Управление потоком - Нет.

2.3. Включите устройство. В терминальной программе вы должны увидеть сообщения о загрузке устройства.

2.4. Во время загрузки выводится приглашение вида "Press any key to enter Debug Mode within 3 seconds". Нажмите любую клавишу для входа в режим отладки (Debug mode).

2.5. Введите команду ATSH для проверки версии программного обеспечения установленного в устройстве.

2.6. Предварительно скачайте файл (zip-архив) с микропрограммным обеспечением для вашего устройства с нашего [site](http://zyxel.ru/support/download)

2.7. Распакуйте архив на жесткий диск. В архиве с микропрограммой находится также файл конфигурации (rom-файл) с настройками по умолчанию.

2.8.Введите команду ATBA5. Переключите терминал в режим скорости 115200.

2.9 Введите команду ATLC для начала записи rom-файла в устройство.

2.10. В программе HyperTerminal зайдите в меню Передача (Transfer) > Отправить файл (Send file) и выберите протокол передачи файлов Xmodem.
Затем нажмите кнопку Обзор и укажите путь к rom-файлу на жестком диске.
Нажмите кнопку Отправить (Send) для старта записи rom-файла в устройство.

2.10. После успешной записи файла введите команду ATGO для перезагрузки устройства.

Внимание! Все пользовательские настройки будут потеряны после выполнения аппаратного сброса настроек на заводские установки (по умолчанию в устройствах ZyXEL пароль 1234).

Для прошивки *.bin файла необходимо в пункте 2.9 вместо команды ATLC ввести ATUR.

После успешной записи файла устройство перезагрузится само.

-----