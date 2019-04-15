---
title: IPTV
categories: DD-WRT
date: 2019-04-15
---

<img class="aligncenter wp-image-1344 size-full" src="https://zaychik.info/wp-content/uploads/IPTV.jpg" width="617" height="407" />

-----
<p style="text-align: center;">**А нам би треба, щоб все працювало, ге?**</p>
<img class="aligncenter wp-image-335 size-full" src="https://zaychik.info/wp-content/uploads/en_ssh_ddwrt.jpg" width="621" height="197" />

<img class="aligncenter wp-image-336 size-full" src="https://zaychik.info/wp-content/uploads/en_jffs_ddwrt.jpg" width="500" height="400" />

<img class="aligncenter wp-image-342 size-full" src="https://zaychik.info/wp-content/uploads/ent_ssh_ddwrt.png" width="952" height="560" />

4. Четвертим ділом закидаємо udpxy для свого чіпа в папку jffs (Броадкому - броадкомове, Атеросу - атеросове) і даємо туди права.
**<span style="color: #008000;">(!)</span> Май на увазі, старче, що /jffs не очищається при перезавантаженні, а в /tmp все стирається сікундою:**
`wget -P /jffs/ http://***********
chmod +x /jffs/udpxy`

5. П’ятим ділом назначаємо IP нашому WAN інтерфейсові:
`ifconfig vlan2 down
ifconfig vlan2 10.10.***.*** netmask 255.255.252.0
ifconfig vlan2 up`

<img class="aligncenter wp-image-344 size-full" src="https://zaychik.info/wp-content/uploads/save_scrpt_ddwrt.png" width="656" height="419" />

7. Сьомим вставляємо туди:
`route add -net 78.137.1.128 netmask 255.255.255.128 gw 10.10.***.5
route add -net 91.105.204.0 netmask 255.255.255.0   gw 10.10.***.5
sleep 60
/jffs/udpxy -a 192.168.1.1 -p 8080
echo 2 >/proc/sys/net/ipv4/conf/all/force_igmp_version
route add -net 224.0.0.0/4 dev vlan2
echo "quickleave" > /tmp/igmprt.conf
echo "phyint vlan2 upstream ratelimit 0 threshold 1" >> /tmp/igmprt.conf
echo "phyint br0 downstream ratelimit 0 threshold 1" >> /tmp/igmprt.conf
echo "phyint br0:0 disabled" >> /tmp/igmprt.conf
echo "phyint eth0 disabled" >> /tmp/igmprt.conf
echo "phyint eth1 disabled" >> /tmp/igmprt.conf
echo "phyint etherip0 disabled" >> /tmp/igmprt.conf
echo "phyint vlan0 disabled" >> /tmp/igmprt.conf
echo "phyint vlan1 disabled" >> /tmp/igmprt.conf
echo "phyint lo disabled" >> /tmp/igmprt.conf
igmprt /tmp/igmprt.conf`

І жмемо Save startup.

8. Восьмим на вакантне місце заскакує:
`iptables -A FORWARD -s 192.168.1.0/24 -j ACCEPT
iptables -A FORWARD -d 192.168.1.0/24 -j ACCEPT
iptables -t nat -A POSTROUTING -o vlan2 -s 192.168.1.0/24 -j MASQUERADE
iptables -t filter -I INPUT -d 224.0.0.0/240.0.0.0 -j ACCEPT
iptables -t filter -I INPUT -s 224.0.0.0/240.0.0.0 -j ACCEPT
iptables -t filter -I FORWARD -d 224.0.0.0/240.0.0.0 -j ACCEPT
iptables -t filter -I FORWARD -s 224.0.0.0/240.0.0.0 -j ACCEPT
iptables -t mangle -A PREROUTING -d 224.0.0.0/240.0.0.0 -j TTL --ttl-inc 1`

І жмемо Save firewall.

-----

