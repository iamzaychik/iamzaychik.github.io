---
title: Public keys authorization
category: SSH
date: 2019-04-15
---

*Configure SSH public-key authentication.*

1. Generate own ssh-key:

```bash
ssh-keygen -t rsa -b 4096
ssh-keygen -t rsa -b 4096 -C johndoe@indiana.edu (with email specified)
Your public key has been saved in /home/user/.ssh/id_rsa.pub.
```

1. Now we have 2 new files:

```bash
id_rsa - private key (save in secure)
id_rsa.pub - public key (copy to servers)
```

1. Copy public key:

```bash
cat /home/user/.ssh/id_rsa.pub
```

1. Login to server

2. Insert public key to `/home/<SERVER_USER>/.ssh/authorized_keys`

3. Check public key login:

```bash
ssh <SERVER_USER>@<A.B.C.D>
```

---
