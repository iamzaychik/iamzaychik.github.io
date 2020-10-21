---
title: Uninstall JDK
category: Ubuntu
date: 2020-10-21
---

-----

```bash
# Check what you have installed
$ java -version

# Remove The Link
# Replace the [version] with any version number that’s contained in jdk folder’s name. For example: jdk1.8.0_131
$ sudo update-alternatives --remove "java" "/usr/lib/jvm/jdk[version]/bin/java"
$ sudo update-alternatives --remove "javac" "/usr/lib/jvm/jdk[version]/bin/javac"
$ sudo update-alternatives --remove "javaws" "/usr/lib/jvm/jdk[version]/jre/bin/javaws"

# Remove The Package
$ sudo rm -r /usr/lib/jvm/jdk[version]

# Remove Openjdk along with dependencies and it’s configuration files
$ sudo apt-get purge --auto-remove openjdk*

```

-----

[Source](https://novicestuffs.wordpress.com/2017/04/25/how-to-uninstall-java-from-linux/)

-----
