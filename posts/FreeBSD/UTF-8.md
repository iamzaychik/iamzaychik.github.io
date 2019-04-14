Title: FreeBSD. UTF-8
Pub date: 23.03.2015
Category: FreeBSD, 

**1. Дописуємо у /etc/rc.conf:**
`font8x14="cp866-8x14"`
`font8x16="cp866b-8x16"`
`font8x8="cp866-8x8"`
`keymap="ru.koi8-r"`
`scrnmap="koi8-r2cp866"`

**2. Дописуємо у /etc/login.conf:**
`russian|Russian Users Accounts:\`
`:charset=UTF-8:\`
`:lang=ru_RU.UTF-8:\`
`:tc=default:`

**3. Міняємо локаль для користувача:**
`cap_mkdb /etc/login.conf`
`pw usermod -n user -L russian`

**4. Дописуємо у /etc/csh.cshrc:**
`setenv LANG ru_RU.UTF-8`
`setenv LC_CTYPE ru_RU.UTF-8`
`setenv LC_COLLATE POSIX`
`setenv LC_ALL ru_RU.UTF-8`

-----
<a title="Пишуть люди" href="http://dazmalab.ru/?p=201" target="_blank">Пишуть люди</a>
-----