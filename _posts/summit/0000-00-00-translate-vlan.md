---
title: Translate VLAN
category: Summit
date: 2019-04-15
---

---

*Translate VLAN tags on Extreme Summit switches.*

Changing a VLAN tag inside a switch is a common network requirement. Equipment from many vendors does not support this feature or supports it only on higher-end models. Extreme switches supported VLAN translation previously, but the process became simpler in software version 12.6.

Software version 12.6 introduced Selective Q-in-Q. Its main capabilities are:

- Select an S-VLAN based on the C-TAG.
- Translate the C-TAG.
- Filter the C-TAG.

This VLAN translation setup uses the second capability: C-TAG translation. Configure the ports requiring translation as cep (Customer Edge Port) ports in any VMAN. Configure other VLANs as regular tagged VLANs.

VLAN translation command:

```bash
configure vman add ports cep cvid {-
} {translate {- }}
```

The following example configures two VLANs. VLAN 2003 is configured as a regular tagged VLAN on switch ports 11 and 12. The second VLAN translates from 2004 to 2014 and back. Port 11 uses VLAN 2004, while port 12 uses VLAN 2014, which is translated to VLAN 2004 on ingress.

```bash
configure vlan vl2003 add ports 11,tagged

configure vman vm add ports 11 cep cvid 2014
configure vman vm add ports 12 cep cvid 2004 translate 2014
```

VLAN translation requires software version 12.6 or later. No additional licenses are required.

---
