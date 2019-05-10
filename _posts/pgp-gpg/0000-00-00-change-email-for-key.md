---
title: Change email for key
category: PGP, GPG
date: 2019-05-10
---

-----

**You cannot delete keys nor modify UIDs for keys uploaded to PGP key servers.**

* To change your email, you must add a new UID:
```bash
$ gpg --list-keys
$ gpg --edit-key <keyID>
gpg> adduid
Real name: <NAME SURNAME>
Email address: <user@example.com>
Comment: <COMMENT>
Change (N)ame, (C)omment, (E)mail or (O)kay/(Q)uit? o
You need a passphrase to unlock the secret key for
user: "NAME SURNAME <user@example.com>"
```

* Update the trust level of the new UID:
```bash
gpg> uid <new uid number>
gpg> trust
Your decision? 5
Do you really want to set this key to ultimate trust? (y/N) y
gpg> uid <new uid number>
```

* Revoke the old UID:
```bash
gpg> uid <old uid number>
gpg> revuid
Really revoke this user ID? (y/N) y
Your decision? 4
Enter an optional description; end it with an empty line: <description>
Is this okay? (y/N) y
```

* Save the changes. Upload the updated key to your PGP key server:
```bash
gpg> save
$ gpg --keyserver hkp://pgp.mit.edu --send-keys <keyID>
```

-----