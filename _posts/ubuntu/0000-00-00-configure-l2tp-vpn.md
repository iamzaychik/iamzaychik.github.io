---
title: Configure L2TP VPN
category: Ubuntu
date: 2020-10-21
---

-----

* Install packages
```bash
$ sudo apt-get update
$ sudo apt-get install network-manager-l2tp
$ sudo apt-get install network-manager-l2tp-gnome
```

* Go to Settings -> Network -> VPN. Click the **+** button.
* Select **Layer 2 Tunneling Protocol (L2TP)**.
* Enter anything you like in the **Name** field.
* Enter `Your VPN Server IP` for the **Gateway**.
* Enter `Your VPN Username` for the **User name**.
* Right-click the **?** in the **Password** field, select **Store the password only for this user**.
* Enter `Your VPN Password` for the **Password**.
* Leave the **NT Domain** field blank.
* Click the **IPsec Settings...** button.
* Check the **Enable IPsec tunnel to L2TP host** checkbox.
* Leave the **Gateway ID** field blank.
* Enter `Your VPN IPsec PSK` for the **Pre-shared key**.
* Expand the **Advanced** section.
* Enter `aes128-sha1-modp2048!` for the **Phase1 Algorithms**.
* Enter `aes128-sha1-modp2048!` for the **Phase2 Algorithms**.
* Click **OK**, then click **Add** to save the VPN connection information.

-----

```bash
echo "
function vpn_on()
{
    nmcli c up \$1
#    sudo ip route add 192.168.10.1 dev ppp0
    sudo ip route add 172.16.0.0/12 dev ppp0
    sudo ip route add 10.0.0.0/8 dev ppp0
    sudo ip route add 192.168.240.0/20 dev ppp0
}

function vpn_off()
{
    nmcli c down Production || nmcli c down QA || true
    nmcli radio wifi off
    nmcli radio wifi on
}" >> ~/.bash_aliases
```

-----
