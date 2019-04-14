Title: Configure Wi-Fi Hotspot
Pub date: 04.03.2015
Category: Mikrotik, 

<h4></h4>
Настраиваем в разделе IP->DHCP Client автоматическое получение адресов от провайдера. Нажимаем на + в меню и выбираем в пункте Interface первый сетевой порт - Ether1.И на вкладке Status смотрим какие адреса устройство получило. Такая настройка позволит подключать оборудование к любому провайдеру без вмешательства в конфигурацию.

Для работы в качестве DNS сервера устанавливаем галочку Allow Remote Requests в разделе настроек IP->DNS. Если ее не поставить, то клиенты не смогут получить доступ в сеть. Так же можно указать альтернативный сервер 8.8.8.8, что бы не зависеть от DNS провайдера.

В разделе Bridge создаем новый бридж, ничего не трогая в настройках. Он нужен для последующего подключения беспроводного адаптера и других беспроводных точек. Так же на него будет привязан IP-адрес хотспота.

На вкладке Ports добавляем в бридж сетевой порт Ether10, что бы проверить работоспособность настроек с ноутбука.

В меню IP->Address добавляем адрес на бридж, указываем 192.168.10.1/24 и выбираем интерфейс Bridge1.

Теперь переходим к настройке хотспота, заходим в меню IP->Hotspot и нажимаем кнопку Hotspot Setup. Откроется диалоговое окно с запросом параметров, сначала предлагается выбрать интерфейс для работы, указываем Bridge1. Для перехода к следующему параметру нажимаем кнопку Next.

Указываем IP-адрес для работы хотспота, тут ничего изменять не нужно, микротик сам определяет какой адрес установлен на интерфейсе - 192.168.10.1/24.

И диапазон адресов для автоматической выдачи клиентам. Так же оставляем без изменений - 192.168.10.2-192.168.10.254.

На запрос о сертификате просто нажимаем кнопку Next.

Адрес SMTP сервера тоже не нужен, оставляем без изменений.

А вот адрес DNS сервера следует указать 8.8.8.8, что бы не зависеть от провайдера.

Имя DNS сервера не указываем.

В окне ввода данных об администраторе так же ничего не трогаем. На этом настройка завершена.

Переходим на вкладку Server Profiles и заходим в свойства hsprof1, где снимаем галочку с пункта Cookie и устанавливаем у Trial. Обратите внимание, внизу в пункте Trial Uptime Limit указано время, в течении которого клиент может работать, по истечении будет заблокирован на 1 день - это указано в пункте Trial Uptime Reset. Если нужно ограничение по времени, то в верхнем пункте указывается продолжительность работы, а в нижнем интервал, сколько клиент должен ждать что бы подключиться к сети повторно. Например в кафе, куда клиент приходит выпить кофе и съесть несколько пирожных, редко задерживаются более часа, поэтому время работы можно установить 1 час, а интервал не 1 день, а например 12 часов. В этом случае он сможет проверить почту и посмотреть немного видео, а на следующий день может придти туда позавтракать, при этом снова получит доступ в Интернет, ведь 12 часов пройдут. Но если он придет туда пообедать, доступ к сети уже не получит. Поэтому выбор времени сброса довольно серьезная задача. Лучше, если такое ограничение нужно, указывать 1-2 часа, этого времени вполне хватит что бы клиент понял, что ему тут ничего не светит и пошел искать другую халявную точку доступа.

В случае хотспота с рекламой ограничение по времени не нужно, поэтому ставим максимальную продолжительность работы 0 и сброс каждую 1 минуту, хотя можно и в нижнем поле поставить 0 что вообще выключит этот механизм.

Далее на вкладке User Profiles производим настройку ограничения скорости работы.

Keepalive Timeout устанавливаем 01:00:00.

Shared Users убираем.

Rate Limit указываем нужное ограничение скорости на прием и передачу, в нашем случае 1m/1m, то есть каждому клиенту будет предоставляться доступ на скорости 1 мегабит в секунду в обе стороны.

Open Status Page указываем HTTP Login.

Производим корректировку настроек DHCP сервера в разделе IP->DHCP Server на вкладке Networks. Заходим в свойства имеющейся записи хотспота и указываем DNS Servers - 192.168.10.1, что бы клиентам в качестве адреса сервера выдавался только один адрес маршрутизатора.

Подключаем ноутбук кабелем в 10 сетевой порт и вводим в адресной строке www.google.ru, автоматически производится перевод на страничку авторизации хотспота Mikrotik. Вверху красным выделена ссылка Click Here, это и есть гостевой доступ без запроса логина и пароля. Нажимаем по ней мышкой.

И попадаем на сайт www.google.ru - хотспот работает.

На вкладке Active в Hotspot можно посмотреть информацию о подключенном клиенте, узнать его MAC и IP адреса, время работы и количество переданных данных. Нажатием на кнопку Remove или на - можно отключить клиента что бы попробовать еще раз авторизоваться на начальной странице хотспота.

Теперь нужно переделать страничку авторизации под свои нужды и удалить все лишнее. В меню Files открываем список файлов, и удаляем файлы alogin и status. Файл login копируем (перетаскиваем мышкой) на компьютер.

Открываем страничку на компьютере и наводим мышкой на надпись Click Here - копируем ссылку в буфер обмена. Хотя можно сразу взять и отсюда:

$(link-login-only)?dst=$(link-orig-esc)&amp;username=T-$(mac-esc)

В любом редакторе создаем простенькую страничку с текстом и картинками, и вставляем 2 ссылки, первую исходную внизу, где написано "зайти в сеть без просмотра сайта провайдера", туда идет:

$(link-login-only)?dst=$(link-orig-esc)&amp;username=T-$(mac-esc)

На картинку вставляем измененную ссылку, где указан сайт провайдера, например:

$(link-login-only)?dst=http://google.ru/&amp;username=T-$(mac-esc)

Тогда по ее нажатию будет открываться сайт провайдера, не смотря на то, что клиент ввел другой адрес в адресной строке.

Сохраняем файл как WEB-страницу и перетаскиваем на микротик в папку Hotspot. Картинки обычно размещаются в отдельной папке, ее тоже не забываем. Естественно для редактирования лучше использовать специальный редактор, но если его нет или нет особых знаний для работы с ним, подойдет и обычный Word, в нем файл нужно сохранить как WEB-документ.

И вновь заходим на хотспот, предварительно не забыв отключить пользователя что бы попасть на страницу авторизации, и попадаем на только что созданную страничку. Нажимаем на кружку и ...

Вылезает ошибка. Дело в том что редактор, в котором создавалась страничка, почему-то изменил ссылки.

Открываем файл страницы текстовым редактором и видим, что он вставил лишние буквы, удаляем не правильную и вставляем нужную:

$(link-login-only)?dst=$(link-orig-esc)&amp;username=T-$(mac-esc)

Теперь указана верная ссылка для перехода без переадресации.

Аналогично поступаем и со ссылкой переадресации на сайт провайдера, стираем не правильную и указываем верную:

$(link-login-only)?dst=http://google.ru/&amp;username=T-$(mac-esc)

Вновь заходим на начальную страницу, введя в адресной строке lanmart.ru, естественно на сайт не пускает и требуется нажать на картинку.

Нажимаем на картинку и попадаем на сайт www.google.ru, т.к. на него указана переадресация в качестве примера, вместо него следует указать адрес нужного сайта.

Если нажать на нижнюю ссылку для доступа в Интернет без просмотра сайта провайдера, откроется требуемый сайт - www.lanmart.ru.

ВАЖНОЕ ЗАМЕЧАНИЕ!!! - Браузер Google Chrome и некоторые другие могут не правильно отрабатывать переход на сайт без переадресации. Клиент вводит имя сайта, который хочет посетить, а после авторизации у него выскакивает ошибка, либо она выскакивает при попытке зайти в Интернет прямо со страницы приветствия браузера. Для того, что бы эта ситуация не отталкивала клиентов следует всегда делать переадресацию на страницу провайдера, или хотя бы на одну из поисковых систем.

В списке активных пользователей опять можно наблюдать одного клиента. Когда хотспот включится в работу, там будут показаны все пользователи.

Настройка хотспота завершена, теперь нужно сделать доступ в сеть для работников организации без переадресации на страницу приветствия. Для этого в разделе Bridge создаем еще один бридж с именем bridge_work, а имеющийся для хотспота переименовываем в bridge_hotspot.

Указываем IP-адрес на бридж - 192.168.11.1/24.

И для последующей проверки добавляем 9 сетевой порт Ether9 в бридж bridge_work.

В меню IP->Firewall на вкладке NAT создаем новое правило, где указываем Src. Address 192.168.11.0/24.

И на вкладке Action выбираем masquerade. Это включает NAT для служебной сети.

В списке правил последнее окажется в самом низу. Вверху идут правила для хотспота, которые создались автоматически.

В разделе IP->DHCP Server нажимаем кнопку DHCP Setup и указываем следующие данные:

DHCP Server Interface - bridge_work.

DHCP Address Space - 192.168.11.0/24.

Gateway for DHCP Network - 192.168.11.1.

Address to Give Out - 192.168.11.2-192.168.11.254.

DNS Servers - 192.168.11.1.

Lease Time - 3d 00:00:00.

После чего сервер будет готов к использованию. Время аренды можно указать и меньше, например 1 день, или вообще 1 час, но так как это все же рабочая сеть то частая смена адресов не желательна.

Для ограничения скорости создадим новую запись в разделе Queues на вкладке Queues Types. Указываем следующие поля:

Type Name - PCQ_Download.

Kind - PCQ.

Rate - 5M - ограничение скорости на одного клиента на прием.

Limit - 500 - размер буфера пакетов на одного клиента.

Total Limit - 20000 - размер буфера пакетов на всех.

Ставим галочку Dst. Address.

Нажимаем кнопку Copy и указываем имя PCQ_Upload, так же ставим галочку напротив Src. Address, вместо Dst. Address.

Теперь созданы 2 правила ограничения, одно входящей, а второе исходящей скорости. В каждом по желанию можно изменить ограничение скорости на нужное. Использование шейпера PCQ позволяет эффективно использовать пропускную способность каналов и буферизовывать данные при превышении скорости, а не сразу отбрасывать, что увеличивает задержку и сообщает приложениям о необходимости снизить скорость.

На вкладке Simple Queues создаем новое правило, указываем интерфейс bridge_work и в разделе Target Upload указываем PCQ_Upload, а в Target Download - PCQ_Download. Оно будет ограничивать скорость сразу всем без добавления в Address List клиентов.

Проверяем работу ограничения через Torch - он показывает полное соответствие указанным значениям. На этом настройка служебной сети завершена.

Вот и вся настройка Hotspot на Mikrotik. Ничего сложного в ней нет. На маршрутизаторе созданы 2 бриджа, один для подключения клиентов с переадресацией на страницу провайдера - Bridge_Hotspot, а второй для служебного использования - Bridge_Work.

Теперь нужно настроить беспроводной адаптер для возможности подключения клиентов. Но сперва следует указать имя центрального маршрутизатора, ведь в сети подразумевается большое количество беспроводных устройств. В разделе System->Identity вводим имя - LANMART_Router. В дальнейшем по нему можно находить главное устройство в списке всех устройств. Естественно в качестве имени нужно указывать свою организацию или провайдера.

В разделе Wireless заходим в настройки беспроводного адаптера, указываем ему имя wlan_hotspot и нажимаем кнопку Advanced Mode справа окна что бы открыть доступ ко всем настройкам.

На вкладке Wireless производится настройка всех основных параметров:

Mode - ap bridge - включаем работу в режиме точки доступа.

Band - 2GHz-B/G - стандарты работы B/G, можно выбрать и B/G/N но обычно он не дает сильной прибавки в скорости, однако создает проблемы с подключением некоторых устройств.

Frequency - 2412 - частота работы.

SSID - LANMART-FREE-WI-FI - имя беспроводной сети, нужно указывать название своей организации, что бы поднять в самый верх списка сетей можно спереди указать восклицательный знак - !.

Radio Name - LANMART_MAIN - имя точки доступа, отображается при сканировании сети. При большом количестве устройств их нельзя будет различать по SSID, т.к. он одинаковый у всех, а имя точки доступа будет у каждого устройства свое.

Scan List - 2400-2500 - диапазон сканирования сетей.

Wireless Protocol - 802.11 - работа в режиме стандартного вайфая.

Frequency Mode - superchannel - включение всех доступных частот, хоть стандартный вайфай и работает на стандартных частотах, иногда бывает нужно просканировать сеть на предмет помех и вне его.

Default Authenticate - отключение галочки позволяет включить режим ограничения по минимальному уровню сигнала.

Default Forward - отключение галочки позволяет заблокировать обмен трафиком между клиентами беспроводной сети.

На вкладке Data Rates нужно включить Rate Selection в режим Advanced, переключатель Rate поставить в Configured и убрать все галочки со скоростей B режимов вверху и внизу.

На вкладке Advanced произвести следующие настройки:

Distance - indoors - установка минимального расстояния до клиентов.

Periodic Calibration - enabled - включение автоматического переопределения уровня шума.

Calibration Interval - 00:00:10 - интервал переопределения 10 секунд.

Hw. Protection Mode - RTS/CTS - включение механизма защиты от скрытого узла, когда клиенты не слышат друг друга, например находятся за толстой бетонной стеной, это помогает увеличить пропускную способность сети.

Preamble Mode - both - включение короткой и длинной преамбулы пакетов, можно поставить и просто short, но возможно не все устройства смогут подключиться к сети.

На вкладке HT включаем 4 галочки двух каналов приема/передачи. По умолчанию включен только нулевой канал, поэтому при использовании MIMO не достигаются высокие скорости, а дальность работы существенно меньше.

На вкладке WDS ничего не трогаем, т.к. подключаться к сети будут ноутбуки и смартфоны, которые этот режим не поддерживают.

Аналогично и на вкладке Nstreme, но там просто снимаем галочку Enable Polling для порядка.

На вкладке Tx Power устанавливаем максимальную выходную мощность передатчика, выбираем Tx Power Mode - All Rates Fixed и чуть ниже в поле Tx Power указываем 18.

Не нужно боятся указывать низкую мощность, т.к. на практике это обычно увеличивает скорости работы и снижает помеховое воздействие на соседние устройства. Не забывайте, что мощность передатчиков мобильных устройств обычно лежит в пределах 6-16дБм, поэтому установив мощность на точке доступа максимально высокую получится ситуация, когда клиенты видят сеть в списке, но подключиться не могут, т.к. точка не слышит от них слабых сигналов.

На вкладке Current Tx Power можно посмотреть на установленную мощность и суммарно излучаемую по двум каналам.

Для создания закрытой сети нужно в новом профиле ввести данные для шифрования - ключ сети. В разделе Wireless на вкладке Security Profiles нажимаем на + и указываем:

Name - profile_work - имя профиля, обычно указывают такое же как и имя сети.

Mode - dynamic keys - выбор шифрования с динамическими ключами.

Authentication Types - WPA PSK и WPA2 PSK - включаем оба типа аутентификации.

Unicast и Group Chiphers - tkip и aes ccm - и оба режима шифрования для совместимости.

WPA и WPA2 Pre-Shared Key - 12345678 - вводим ключ сети, минимум 8 символов.

Далее на вкладке Interfaces раздела Wireless нажимаем на + и выбираем Virtual AP - создаем новую виртуальную точку доступа. Указываем ей имя - wlan_work. Так же нажимаем кнопку Advanced Mode для того что бы открыть все пункты настройки.

На вкладке Wireless указываем:

SSID - LANMART-WORK - имя беспроводной сети.

Master Interface - wlan1_hotspot - реальный беспроводной адаптер, при создании еще нескольких виртуальных точек, нужно выбирать его в качестве главного.

Security Profile - profile_work - профиль шифрования.

Снимаем галочки Default Authenticate и Default Forward.

На вкладке Access List создаем новое правило ограничения по уровням сигналов, нажимаем на + и в новом окне указываем:

Signal Strength Range в интервале -77..120, что позволяет принимать клиентов только в том случае, если уровень сигнала лучше, чем -77. Если не предполагается делать сеть с роумингом, например на начальном этапе когда всего одна точка доступа, то вместо -77 можно указать -90, тогда смогут подключаться клиенты даже с самыми слабыми сигналами. Тут важно понимать, что разные беспроводные устройства имеют разную мощность передатчика, например в одном и том же месте адаптер ноутбука подключится к точек с уровнем -70 и сможет работать, а адаптер телефона будет пытаться подключиться с сигналом -80 и не сможет попасть на точку. Для выхода из этой ситуации следует либо устанавливать беспроводные устройства как можно чаще по помещениям, либо изменения минимального уровня сигнала до -80, либо создание еще одной виртуальной точки специально для телефонов и смартфонов, где будет указано другое ограничение уровней сигналов, для этого в правиле нужно указать конкретный интерфейс, на котором работать.

Снимаем галочку Forwarding что бы запретить обмен данными между клиентами беспроводной сети.

Теперь осталось только подключить каждый беспроводной адаптер к своему бриджу, для этого в разделе Bridge на вкладке Ports нажимаем на + и добавляем адаптер wlan_hotspot в бридж bridge_hotspot.

Аналогично адаптер wlan_work добавляем в бридж bridge_work.

С помощью ноутбука сканируем беспроводные сети и находим обе только что созданных сети - LANMART-FREE-WI-FI для бесплатного доступа с просмотром сайта провайдера, и LANMART-WORK для доступа сотрудников.

Подключаемся к сети LANMART-FREE-WI-FI и получаем доступ в сеть через хотспот, в списке беспроводных клиентов видно, что подключение производится на адаптер wlan_hotspot. Так же показан уровень принимаемого сигнала -42, и максимальные канальные скорости приема/передачи.

Меняем сеть на LANMART-WORK и снова смотрим в таблицу регистраций, теперь подключение осуществилось на адаптер wlan_work, на котором нет переадресации на сайт провайдера.

В логах микротика видно, что сперва ноутбук подключился к хотспоту и получил адрес 192.168.10.253, а потом к рабочей сети с адресом 192.168.11.253. Все работает.

Если предполагается устанавливать несколько точек, то их нельзя просто так объединять в общую сеть, т.к. в этом случае клиенты одной точки смогут передавать данные клиентам всех других точек, что вызовет лишнюю нагрузку на сеть. Каждую точку нужно подключать в уникальном влане к центральной. Что бы изолировать трафик внутри каждого влана и иметь возможность доступа из любой точки в одну и ту же сеть, их следует объединить в бридж с изоляцией трафика. Для этого в разделе Bridge на вкладке Filters создаем новое правило, где раскрываем пункт Bridges и указываем в полях In. Bridge и Out. Bridge наш бридж bridge_hotspot.

На вкладке Action выбираем drop. После этого все клиенты смогут общаться только с главным маршрутизатором, а трафик между ними будет заблокирован. Так же они будут заблокированы на точках, к которым подключены, тем самым по сети не будет гулять никакой мусорный трафик.

-----

* <a title="Пишуть люди" href="http://www.lanmart.ru/blogs/mikrotik-hotspot" target="_blank" rel="noopener">Все детально пишуть пацани.</a>

-----