---
title: Flashplayer install
category: Ubuntu
date: 2019-04-15
---

-----

### Install via apt

```bash
$ sudo add-apt-repository "deb http://archive.canonical.com/ubuntu $(lsb_release -sc) partner"
$ apt update
$ apt install adobe-flashplugin
```

-----

### Manual install

```bash
#!/bin/bash
DOWNLOADS="$HOME/Downloads/"

function select_browser
{
	echo "Select action:
	1. Firefox;
	2. Chromium;
	3. Exit;"

	read BROWSER

	case $BROWSER in
		1) firefox; main;;
		2) chromium; main;;
		3) exit;;
		*) echo "Invalid input!"; select_browser;;
	esac
}

function firefox
{
	ARCHIVE="install_flash_player_11_linux.i386.tar.gz"
	FILENAME="libflashplayer.so"
	PLUGIN_PATH="/usr/lib/flashplugin-installer/"
	ACTION=`cp -r usr/* /usr`
}

function chromium
{
	ARCHIVE="flash_player_ppapi_linux.i386.tar.gz"
	FILENAME="libpepflashplayer.so"
	PLUGIN_PATH="/usr/lib/chromium-browser/plugins"
	FLAGS='CHROMIUM_FLAGS="$CHROMIUM_FLAGS --ppapi-flash-path=/usr/lib/chromium-browser/plugins/libpepflashplayer.so --ppapi-flash-version=$FLASH_VERSION"'
	ACTION=`echo $FLAGS >> /etc/chromium-browser/default`
}

function main
{
	cd $DOWNLOADS
	mkdir fp
	tar -xvf $ARCHIVE -C fp
	cd fp
	cp -r $FILENAME $PLUGIN_PATH
	$action
	cd $DOWNLOADS
	rm -rf fp
	rm $ARCHIVE
	exit 0
}

select_browser
```

-----