Title: Dell. Configuring LACP between OpenIndiana and a Dell Force10 switch
Pub date: 24.07.2015
Category: Dell, 

<div class="entry-content">

Link aggregation is a method of bundling interfaces together to act as one for increased bandwith and/or failover. One of most used protocols, next to a couple of proprietary ones, for controlling such a channel bond is **LACP</strong>, the <a href="http://en.wikipedia.org/wiki/Link_aggregation#Link_Aggregation_Control_Protocol">Link Aggregation Control Protocol</a>.

<h2>1. Configuring LACP on Dell S4810</h2>
Let’s assume, we want to bond two 10G Ethernet ports together, namely **TenGigabitEthernet 0/32</strong> and **TenGigabitEthernet 0/33</strong>

`S4810(conf)#interface range tengigabitethernet 0/32 , tengigabitethernet 0/33
S4810(conf-if-range-te-0/32,te-0/33)#port-channel-protocol LACP
S4810(conf-if-range-te-0/32,te-0/33-lacp)#  port-channel 9 mode active
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
no shutdown`

Next, the port-channel interface needs to be configured as **layer 2 port</strong> and **activated afterwards</strong>:
`S4810(conf)#interface port-channel 9
S4810(conf-if-po-9)#description Uplink to Server47
S4810(conf-if-po-9)#switchport
S4810(conf-if-po-9)#no shutdown
S4810(conf-if-po-9)#show config
!
interface Port-channel 9
description Uplink to Server47
no ip address
switchport
no shutdown`

It’s always good practice to also change the description. Depending on your configuration, you might want to change the **vlan settings</strong> for this newly created port-channel as well:
`S4810(conf)#interface vlan 11
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
no shutdown`

Of course, depending on the actual network topology, your mileage might vary here.
Note that the port-channel will stay in a ‘down’ state until it can exchange LACPDUs with the remote end:
`S4810(conf)#do show interfaces port-channel 9 brief
Codes: L - LACP Port-channel
LAG  Mode  Status       Uptime      Ports
L   9    L2L3  down         00:00:00`
<div class="line number1 index0 alt2"></div>
</div>
<h2>2. Configuring LACP on OpenIndiana</h2>
First, disable the **NWAM</strong> (Network Auto Magic) service:
<div>
<div id="highlighter_255906" class="syntaxhighlighter bash">
<div class="toolbar"><a class="toolbar_item command_help help" href="https://possiblelossofprecision.net/?p=1937#">?</a></div>
<table border="0" cellspacing="0" cellpadding="0">
<tbody>
<tr>
<td class="gutter">
<div class="line number1 index0 alt2">1</div>
<div class="line number2 index1 alt1">2</div></td>
<td class="code">
<div class="container">
<div class="line number1 index0 alt2"><code class="bash comments"># svcadm disable svc:/network/physical:nwam`</div>
<div class="line number2 index1 alt1"><code class="bash comments"># svcadm enable svc:/network/physical:default`</div>
</div></td>
</tr>
</tbody>
</table>
</div>
</div>
To **list the available physical ports</strong>, use `dladm`
<div>
<div id="highlighter_778897" class="syntaxhighlighter bash">
<div class="toolbar"><a class="toolbar_item command_help help" href="https://possiblelossofprecision.net/?p=1937#">?</a></div>
<table border="0" cellspacing="0" cellpadding="0">
<tbody>
<tr>
<td class="gutter">
<div class="line number1 index0 alt2">1</div>
<div class="line number2 index1 alt1">2</div>
<div class="line number3 index2 alt2">3</div>
<div class="line number4 index3 alt1">4</div>
<div class="line number5 index4 alt2">5</div>
<div class="line number6 index5 alt1">6</div>
<div class="line number7 index6 alt2">7</div>
<div class="line number8 index7 alt1">8</div></td>
<td class="code">
<div class="container">
<div class="line number1 index0 alt2"><code class="bash plain">root@Server47:~`<code class="bash comments"># dladm show-phys`</div>
<div class="line number2 index1 alt1"><code class="bash plain">LINK         MEDIA                STATE      SPEED  DUPLEX    DEVICE`</div>
<div class="line number3 index2 alt2"><code class="bash plain">myri10ge1    Ethernet             down       10000  full      myri10ge1`</div>
<div class="line number4 index3 alt1"><code class="bash plain">myri10ge0    Ethernet             down       10000  full      myri10ge0`</div>
<div class="line number5 index4 alt2"><code class="bash plain">bnx2         Ethernet             down       0      unknown   bnx2`</div>
<div class="line number6 index5 alt1"><code class="bash plain">bnx0         Ethernet             up         1000   full      bnx0`</div>
<div class="line number7 index6 alt2"><code class="bash plain">bnx1         Ethernet             down       0      unknown   bnx1`</div>
<div class="line number8 index7 alt1"><code class="bash plain">bnx3         Ethernet             down       0      unknown   bnx3`</div>
</div></td>
</tr>
</tbody>
</table>
</div>
</div>
To create an aggregate device with **two links</strong> (`myri10ge0` and `myri10ge1`) in **LACP mode</strong> (`-L active`) with and <a href="http://docs.oracle.com/cd/E19253-01/816-4554/fpjvl/index.html">L2 failover policy</a> (Determines the outgoing link by hashing the MAC (L2) header of each packet), run:
<div>
<div id="highlighter_916088" class="syntaxhighlighter bash">
<div class="toolbar"><a class="toolbar_item command_help help" href="https://possiblelossofprecision.net/?p=1937#">?</a></div>
<table border="0" cellspacing="0" cellpadding="0">
<tbody>
<tr>
<td class="gutter">
<div class="line number1 index0 alt2">1</div></td>
<td class="code">
<div class="container">
<div class="line number1 index0 alt2"><code class="bash plain">dladm create-aggr -l myri10ge0 -l myri10ge1 -L active -P L2 aggr1`</div>
</div></td>
</tr>
</tbody>
</table>
</div>
</div>
You can use `dladm show-aggr` to see the **current state</strong>:
<div>
<div id="highlighter_384042" class="syntaxhighlighter bash">
<div class="toolbar"><a class="toolbar_item command_help help" href="https://possiblelossofprecision.net/?p=1937#">?</a></div>
<table border="0" cellspacing="0" cellpadding="0">
<tbody>
<tr>
<td class="gutter">
<div class="line number1 index0 alt2">1</div>
<div class="line number2 index1 alt1">2</div>
<div class="line number3 index2 alt2">3</div></td>
<td class="code">
<div class="container">
<div class="line number1 index0 alt2"><code class="bash plain">root@Server47:~`<code class="bash comments"># dladm show-aggr`</div>
<div class="line number2 index1 alt1"><code class="bash plain">LINK            POLICY   ADDRPOLICY           LACPACTIVITY  LACPTIMER   FLAGS`</div>
<div class="line number3 index2 alt2"><code class="bash plain">aggr1           L2       auto                 active        short       -----`</div>
</div></td>
</tr>
</tbody>
</table>
</div>
</div>
Next, **create an interface</strong> `aggr1`:
<div>
<div id="highlighter_890121" class="syntaxhighlighter bash">
<div class="toolbar"><a class="toolbar_item command_help help" href="https://possiblelossofprecision.net/?p=1937#">?</a></div>
<table border="0" cellspacing="0" cellpadding="0">
<tbody>
<tr>
<td class="gutter">
<div class="line number1 index0 alt2">1</div>
<div class="line number2 index1 alt1">2</div>
<div class="line number3 index2 alt2">3</div>
<div class="line number4 index3 alt1">4</div>
<div class="line number5 index4 alt2">5</div>
<div class="line number6 index5 alt1">6</div></td>
<td class="code">
<div class="container">
<div class="line number1 index0 alt2"><code class="bash plain">root@Server47:~`<code class="bash comments"># ipadm create-if aggr1`</div>
<div class="line number2 index1 alt1"><code class="bash plain">root@Server47:~`<code class="bash comments"># ipadm show-if`</div>
<div class="line number3 index2 alt2"><code class="bash plain">IFNAME     STATE    CURRENT      PERSISTENT`</div>
<div class="line number4 index3 alt1"><code class="bash plain">lo0        ok       -m-`<code class="bash functions">v`<code class="bash plain">------46 ---`</div>
<div class="line number5 index4 alt2"><code class="bash plain">bnx0       ok       bm--------46 -46`</div>
<div class="line number6 index5 alt1"><code class="bash plain">aggr1      down     bm--------46 -46`</div>
</div></td>
</tr>
</tbody>
</table>
</div>
</div>
You should now see that the LACP link is established on the layer 2 switch:
<div>
<div id="highlighter_820689" class="syntaxhighlighter bash">
<div class="toolbar"><a class="toolbar_item command_help help" href="https://possiblelossofprecision.net/?p=1937#">?</a></div>
<table border="0" cellspacing="0" cellpadding="0">
<tbody>
<tr>
<td class="gutter">
<div class="line number1 index0 alt2">1</div>
<div class="line number2 index1 alt1">2</div>
<div class="line number3 index2 alt2">3</div>
<div class="line number4 index3 alt1">4</div>
<div class="line number5 index4 alt2">5</div>
<div class="line number6 index5 alt1">6</div></td>
<td class="code">
<div class="container">
<div class="line number1 index0 alt2"><code class="bash plain">S4810(conf)`<code class="bash comments">#do show interfaces port-channel 9 brief`</div>
<div class="line number2 index1 alt1"><code class="bash plain">Codes: L - LACP Port-channel`</div>
<div class="line number3 index2 alt2"></div>
<div class="line number4 index3 alt1"><code class="bash spaces">    `<code class="bash plain">LAG  Mode  Status       Uptime      Ports          `</div>
<div class="line number5 index4 alt2"><code class="bash plain">L   9    L2L3  up           00:00:00    Te 0`<code class="bash plain">/32`    <code class="bash plain">(Up)`</div>
<div class="line number6 index5 alt1"><code class="bash spaces">                                        `<code class="bash plain">Te 0`<code class="bash plain">/33`    <code class="bash plain">(Up)`</div>
</div></td>
</tr>
</tbody>
</table>
</div>
</div>
The last thing left to do is to **create an IP address</strong> on top of the `aggr1` interface:
<div>
<div id="highlighter_451142" class="syntaxhighlighter bash">
<div class="toolbar"><a class="toolbar_item command_help help" href="https://possiblelossofprecision.net/?p=1937#">?</a></div>
<table border="0" cellspacing="0" cellpadding="0">
<tbody>
<tr>
<td class="gutter">
<div class="line number1 index0 alt2">1</div></td>
<td class="code">
<div class="container">
<div class="line number1 index0 alt2"><code class="bash plain">root@Server47:~`<code class="bash comments"># ipadm create-addr -T static -a 10.11.20.6/16 aggr1/v4`</div>
</div></td>
</tr>
</tbody>
</table>
</div>
</div>
Again, depending on your topology, you might want to **add/edit you default route</strong> to go over the aggragate interface.

-----

&nbsp;

<footer class="entry-meta"></footer>