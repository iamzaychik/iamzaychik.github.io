---
title: Cheatsheet
category: SSHFS
date: 2019-05-12
---

-----

### Install
```bash
$ sudo apt install sshfs -y
```

* Add ssh key from client to source
* Create mountpoint on the client:
```bash
$ mkdir /mnt/sshfs
```

* Mount remote directory:
```bash
$ sshfs ubuntu@192.0.2.1:/home/ubuntu /mnt/sshfs
```

-----

* Disconnect sshfs:
```bash
$ fusermount -u /mnt/sshfs
```

-----