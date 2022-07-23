---
title: Install redis-cli on AWS Linux
category: AWS
date: 2022-07-23
---

-----

```bash
$ sudo yum -y install gcc make # install GCC compiler
$ cd /usr/local/src
$ sudo wget http://download.redis.io/redis-stable.tar.gz
$ sudo tar xvzf redis-stable.tar.gz
$ sudo rm -f redis-stable.tar.gz
$ cd redis-stable
$ sudo yum groupinstall "Development Tools"
$ sudo make distclean
$ sudo make
$ sudo yum install -y tcl
$ sudo make test
$ sudo cp src/redis-server /usr/local/bin/
$ sudo cp src/redis-cli /usr/local/bin/
$ redis-server
$ redis-cli
```

-----

[Source](https://gist.github.com/todgru/14768fb2d8a82ab3f436#gistcomment-3582604)

-----
