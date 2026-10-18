---
title: Static client on dynamic interfaces
category: Juniper
date: 2019-04-15
---

---
*Configure a static client route on a dynamic Juniper interface.*

1. Create an interface:
`set interfaces xe-0/0/0 unit 482 proxy-arp
set interfaces xe-0/0/0 unit 482 vlan-id 482
set interfaces xe-0/0/0 unit 482 family inet unnumbered-address lo0.0`

2. Add a route:
`set routing-options static route xxx.xxx.xxx.xxx/xx qualified-next-hop xe-0/0/0.482`

3. Add the IP address to the OSPF prefix list:
`set policy-options prefix-list SR xxx.xxx.xxx.xxx/xx`

4. Create an OSPF policy:
```text
term t1 {
from {
route-filter 10.0.0.0/8 orlonger;
route-filter 172.16.0.0/12 orlonger;
route-filter 192.168.0.0/16 orlonger;
}
then reject;
}
term t2 {
from protocol access-internal;
then accept;
}
term t3 {
from {
prefix-list SR;
}
then accept;
}
term t4 {
then reject;
}
term t5 {
from protocol static;
then accept;
}
```

5. To avoid overloading OSPF, create a prefix-list policy for continuously advertising the IP address.
The procedure is:
a) create a new VLAN on the interface;
b) assign it an unnumbered IP address from lo0.0;
c) add a static route to the specified interface;
d) add the specified IP address to the prefix list;
e) verify the result.

```bash
unit 482 {
proxy-arp;
vlan-id 482;
family inet {
unnumbered-address lo0.0;
route xxx.xxx.xxx.xxx/xx {
qualified-next-hop xe-0/0/0.482;
```

---
