---
title: Configuring LACP between OpenIndiana and a Dell Force10 switch
category: Dell
date: 2019-04-15
---

Link aggregation is a method of bundling interfaces together to act as one for increased bandwidth and/or failover. One of the most commonly used protocols, next to a couple of proprietary ones, for controlling such a channel bond is [LACP](https://en.wikipedia.org/wiki/Link_aggregation#Link_Aggregation_Control_Protocol), the Link Aggregation Control Protocol.

## 1. Configuring LACP on Dell S4810

Let’s assume we want to bond two 10G Ethernet ports together, namely **TenGigabitEthernet 0/32** and **TenGigabitEthernet 0/33**.

```text
S4810(conf)#interface range tengigabitethernet 0/32 , tengigabitethernet 0/33
S4810(conf-if-range-te-0/32,te-0/33)#port-channel-protocol LACP
S4810(conf-if-range-te-0/32,te-0/33-lacp)#port-channel 9 mode active
S4810(conf-if-range-te-0/32,te-0/33-lacp)#show conf
!
interface TenGigabitEthernet 0/32
description po9 uplink to Server47
no ip address
flowcontrol rx on tx off
!
port-channel-protocol LACP
port-channel 9 mode active
no shutdown
!
interface TenGigabitEthernet 0/33
description po9 uplink to Server47
no ip address
flowcontrol rx on tx off
!
port-channel-protocol LACP
port-channel 9 mode active
no shutdown
```

Next, the port-channel interface needs to be configured as a **Layer 2 port** and **activated afterwards**:

```text
S4810(conf)#interface port-channel 9
S4810(conf-if-po-9)#description Uplink to Server47
S4810(conf-if-po-9)#switchport
S4810(conf-if-po-9)#no shutdown
S4810(conf-if-po-9)#show config
!
interface Port-channel 9
description Uplink to Server47
no ip address
switchport
no shutdown
```

It’s always good practice to also change the description. Depending on your configuration, you might want to change the **VLAN settings** for this newly created port-channel as well:

```text
S4810(conf)#interface vlan 11
S4810(conf-if-vl-11)#untagged port-channel 9
S4810(conf-if-vl-11)#show config
!
interface Vlan 11
description VLAN11-LAN
ip address 10.11.1.10/16
tagged TenGigabitEthernet 0/8-13
tagged Port-channel 1-5,11,13-14
untagged TenGigabitEthernet 0/14,19-20,23,38,46
untagged Port-channel 9
ip helper-address 10.10.10.1
no shutdown
```

Of course, depending on the actual network topology, your mileage might vary here.

Note that the port-channel will stay in a **down** state until it can exchange LACPDUs with the remote end:

```text
S4810(conf)#do show interfaces port-channel 9 brief
Codes: L - LACP Port-channel
LAG  Mode  Status       Uptime      Ports
L    9    L2L3  down         00:00:00
```

## 2. Configuring LACP on OpenIndiana

First, disable the **NWAM** (Network Auto Magic) service:

```bash
# svcadm disable svc:/network/physical:nwam
# svcadm enable svc:/network/physical:default
```

To **list the available physical ports**, use `dladm`:

```text
root@Server47:~# dladm show-phys
LINK         MEDIA                STATE      SPEED  DUPLEX    DEVICE
myri10ge1    Ethernet             down       10000  full      myri10ge1
myri10ge0    Ethernet             down       10000  full      myri10ge0
bnx2         Ethernet             down       0      unknown   bnx2
bnx0         Ethernet             up         1000   full      bnx0
bnx1         Ethernet             down       0      unknown   bnx1
bnx3         Ethernet             down       0      unknown   bnx3
```

To create an aggregate device with **two links** (`myri10ge0` and `myri10ge1`) in **LACP mode** (`-L active`) with an [L2 failover policy](https://docs.oracle.com/cd/E19253-01/816-4554/fpjvl/index.html), run:

```bash
dladm create-aggr -l myri10ge0 -l myri10ge1 -L active -P L2 aggr1
```

The L2 policy determines the outgoing link by hashing the MAC (L2) header of each packet.

You can use `dladm show-aggr` to see the **current state**:

```text
root@Server47:~# dladm show-aggr
LINK            POLICY   ADDRPOLICY           LACPACTIVITY  LACPTIMER   FLAGS
aggr1           L2       auto                 active        short       ---
```

Next, **create an interface** for `aggr1`:

```text
root@Server47:~# ipadm create-if aggr1
root@Server47:~# ipadm show-if
IFNAME     STATE    CURRENT      PERSISTENT
lo0        ok       -m-v----46  ---
bnx0       ok       bm------46  -46
aggr1      down     bm------46  -46
```

You should now see that the LACP link is established on the Layer 2 switch:

```text
S4810(conf)#do show interfaces port-channel 9 brief
Codes: L - LACP Port-channel

    LAG  Mode  Status       Uptime      Ports
L    9    L2L3  up           00:00:00    Te 0/32    (Up)
                                  Te 0/33    (Up)
```

The last thing left to do is to **create an IP address** on top of the `aggr1` interface:

```bash
root@Server47:~# ipadm create-addr -T static -a 10.11.20.6/16 aggr1/v4
```

Again, depending on your topology, you might want to **add or edit your default route** to go over the aggregate interface.

---
