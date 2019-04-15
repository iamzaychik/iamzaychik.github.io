---
title: Passive FTP
category: Ubuntu
date: 2019-04-15
---

_Настроїш, буває, фаєрвол, а виявляється, що все працювало геть не так, як було задумано..._
-----
`iptables -A FORWARD -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
modprobe nf_conntrack_ftp
modprobe ip_conntrack_ftp`
-----