---
title: Cheatsheet
category: PGP, GPG
date: 2019-07-05
---

-----

**Create key:**
```bash
$ gpg --full-generate-key
$ gpg --full-generate-key --expert
```

**Import pubkey:**
```bash
$ gpg --import pubkey.gpg
```

**Export key:**
```bash
$ gpg --output mygpgkey_pub.gpg --armor --export ABCDFE01
$ gpg --output mygpgkey_sec.gpg --armor --export-secret-key ABCDFE01
```

**Show all keys:**
```bash
$ gpg --list-keys
```

**Encrypt file decrypted.txt with key 0x12345678 to text file encrypted.gpg:**
```bash
$ gpg -a -r 0x12345678 -e decrypted.txt > encrypted.gpg
```

**Decrypt file with key:**
```bash
$ gpg -r 0x12345678 -d encrypted.gpg > decrypted.txt
```

**Sign file message.txt and save sign to sign.asc:**
```bash
$ gpg -u 0x12345678 -s message.txt > sign.asc
```

**Sign message and save message with sign to file:**
```bash
$ gpg -r 0x12345678 --clearsign message.txt > message.gpg
```

**Check sign:**
```bash
$ gpg --verify message.asc message.txt
```

-----

[Source](https://habr.com/ru/post/358182/)
[Source2](https://www.debuntu.org/how-to-importexport-gpg-key-pair/)

-----