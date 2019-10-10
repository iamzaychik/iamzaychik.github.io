---
title: Check OS version
category: CentOS
date: 2019-10-10
---

-----

```bash
$ rpm -q centos-release	# CentOS version valid for CentOS 6 and higher. Causes to reveal major, minor and asynchronous CentOS version.
$ lsb_release -d	    # Requires redhat-lsb package to be installed before execution.
$ rpm -E %{rhel}	    # RPM macro to reveal a major CentOS version
$ rpm --eval %{centos_ver}	# RPM macro to display a major version of CentOS
$ cat /etc/centos-release	# Linux cat command to output content of the /etc/centos-release to query CentOS version. Works with CentOS 6 and higher.
```

-----

[Source](https://linuxconfig.org/how-to-check-centos-version)

-----