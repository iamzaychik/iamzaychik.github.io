---
title: Translate VLAN 2
category: Summit
date: 2019-04-15
---

The example in the following figure configures a basic VLAN translation network. This network provides VLAN translation between four member VLANs and a single translation VLAN.
-----


**VLAN Translation Configuration Example**
The following configuration commands create the member VLANs:
`create vlan v101
configure v101 tag 101
configure v101 add ports 1:1 tagged
create vlan v102
configure v102 tag 102
configure v102 add ports 1:1 tagged
create vlan v103
configure v103 tag 103
configure v103 add ports 1:2 tagged
create vlan v104
configure v104 tag 104
configure v104 add ports 1:2 tagged`

The following configuration commands create the translation VLAN and enable VLAN translation:
`create vlan v1000
configure v1000 tag 1000
configure v1000 add ports 2:1 tagged
configure v1000 vlan-translation add member-vlan v101
configure v1000 vlan-translation add member-vlan v102
configure v1000 vlan-translation add member-vlan v103
configure v1000 vlan-translation add member-vlan v104`

The following configuration commands create the translation VLAN and enable VLAN translation on BlackDiamond X8, BlackDiamond 8000 series modules, and Summit X440, X460, X480, X670, X670-G2, and X770 series switches:
`create vlan v1000
configure v1000 tag 1000
configure v1000 add ports 2:1 tagged
configure v1000 vlan-translation add member-vlan v101
configure v1000 vlan-translation add member-vlan v102 loopback-port 1:23
configure v1000 vlan-translation add member-vlan v103
configure v1000 vlan-translation add member-vlan v104 loopback-port 1:24`

-----