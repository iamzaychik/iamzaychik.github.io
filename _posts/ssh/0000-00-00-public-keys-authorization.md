---
title: Public keys authorization
category: SSH
date: 2019-04-15
---

-----

1. Generate own ssh-key:
```bash
$ ssh-keygen -t rsa -b 4096
$ ssh-keygen -t rsa -b 4096 -C johndoe@indiana.edu (with email specified)
Your public key has been saved in /home/user/.ssh/id_rsa.pub.
```

2. Now we have 2 new files:
  * id_rsa - private key (save in secure)
  * id_rsa.pub - public key (copy to servers)

3. Copy public key:
```bash
$ cat /home/user/.ssh/id_rsa.pub
```

4. Login to server
5. Insert public key to `/home/<SERVER_USER>/.ssh/authorized_keys`
6. Check public key login:
```bash
$ ssh <SERVER_USER>@<A.B.C.D>
```

-----
