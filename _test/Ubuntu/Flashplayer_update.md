---
title: Flashplayer update
category: Ubuntu
date: 2019-04-15
---

_Де вже той ваш ХТМЛ5, га?_
-----

**Щоб встановити флешплеєр через apt:**
**1. Додаємо репозиторій партнерів Ubuntu:**
`sudo add-apt-repository "deb http://archive.canonical.com/ubuntu $(lsb_release -sc) partner"`

**2. Оновлюємо список пакетів:**
`apt update`

**3. Встановлюємо флешплеєр:**
`apt install adobe-flashplugin`
-----

**Щоб встановити флешплеєр вручну:**

`#!/bin/bash
downloads="$HOME/Загрузки/"
function select_browser
{
echo "Select action:
1. Firefox;
2. Chromium;
3. Exit;"`

`read browser`

`case $browser in
1) firefox; main;;
2) chromium; main;;
3) exit;;
*) echo "Invalid input!"; select_browser;;
esac
}`

`function firefox
{
archive="install_flash_player_11_linux.i386.tar.gz"
filename="libflashplayer.so"
path="/usr/lib/flashplugin-installer/"
action=`cp -r usr/* /usr`
}`

`function chromium
{
archive="flash_player_ppapi_linux.i386.tar.gz"
filename="libpepflashplayer.so"
path="/usr/lib/chromium-browser/plugins"
flags='CHROMIUM_FLAGS="$CHROMIUM_FLAGS --ppapi-flash-path=/usr/lib/chromium-browser/plugins/libpepflashplayer.so --ppapi-flash-version=$FLASH_VERSION"'
action=`echo $flags >> /etc/chromium-browser/default`
}`

`function main
{
cd $downloads
mkdir fp
tar -xvf $archive -C fp
cd fp
cp -r $filename $path
$action
cd $downloads
rm -rf fp
rm $archive
exit 0
}
select_browser`
-----