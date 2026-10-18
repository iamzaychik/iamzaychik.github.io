---
title: Configure Wi-Fi Hotspot
category: Mikrotik
date: 2019-04-15
---

---

*Configure a legacy RouterOS wireless hotspot with separate guest and work
networks.*

### Configure the provider connection

- Open `IP->DHCP Client`.
- Click `+` and select `Interface: Ether1`.
- Check assigned addresses on the `Status` tab.
- This setup supports different providers without reconfiguring the device.

### Configure DNS and the guest bridge

- Open `IP->DNS`.
- Enable `Allow Remote Requests`.
- Optionally set DNS server `8.8.8.8`.
- Block DNS requests from the WAN interface with input firewall rules.
- Create a new bridge in `Bridge`.
- Add `Ether10` through the `Ports` tab.
- Open `IP->Address`.
- Assign `192.168.10.1/24` to `Bridge1`.

### Configure the hotspot

- Open `IP->Hotspot` and click `Hotspot Setup`.
- Select `Bridge1` and click `Next`.
- Keep the detected hotspot address `192.168.10.1/24`.
- Keep the client range `192.168.10.2-192.168.10.254`.
- Select `none` for the certificate.
- Leave the SMTP server field unchanged.
- Set the DNS server to `8.8.8.8`.
- Set the DNS name and local HotSpot user credentials.
- Enable `Masquerade Network`.

### Configure hotspot limits

- Open `Server Profiles` and edit `hsprof1`.
- Clear `Cookie` and enable `Trial`.
- Set `Trial Uptime Limit` and `Trial Uptime Reset` for time-based access.
- Use a one-hour limit and a twelve-hour reset for a café-style hotspot.
- Set maximum uptime to `0` and reset to `1 minute` for advertising hotspots.
- Open `User Profiles`.
- Set `Keepalive Timeout` to `01:00:00`.
- Clear `Shared Users`.
- Set `Rate Limit` to `1m/1m`.
- Set `Open Status Page` to `HTTP Login`.

### Configure the hotspot DHCP network

- Open `IP->DHCP Server` and the `Networks` tab.
- Edit the hotspot network.
- Set `DNS Servers` to `192.168.10.1`.
- Connect a laptop to `Ether10`.
- Open `www.google.ru` and follow the `Click Here` guest link.
- Verify the client on the `Active` tab.
- Use `Remove` or `-` to disconnect a test client.

### Customize the login page

- Open `Files`.
- Delete `alogin` and `status`.
- Copy the `login` file to a computer.
- Copy the `Click Here` link from the page.

```text
$(link-login-only)?dst=$(link-orig-esc)&amp;username=T-$(mac-esc)
```

- Add the direct-access link to the custom page.
- Add a provider redirect link to the image.

```text
$(link-login-only)?dst=http://google.ru/&amp;username=T-$(mac-esc)
```

- Save the page as a WEB document.
- Upload the page and its image directory to `Hotspot`.
- Reopen the hotspot after disconnecting the test user.
- Correct links if the editor changes their characters.
- Use `lanmart.ru` to test the redirect.
- Replace `www.google.ru` with the required provider website.
- Verify direct access opens the required site, such as `www.lanmart.ru`.
- Redirect users because some browsers mishandle direct post-login navigation.

### Configure the work network

- Create `bridge_work` in `Bridge`.
- Rename the hotspot bridge to `bridge_hotspot`.
- Assign `192.168.11.1/24` to `bridge_work`.
- Add `Ether9` to `bridge_work`.
- Create a NAT rule in `IP->Firewall`, `NAT`.
- Set `Src. Address` to `192.168.11.0/24`.
- Set the action to `masquerade`.
- Keep automatic hotspot rules above the work-network rule.

### Configure work-network DHCP

- Open `IP->DHCP Server` and click `DHCP Setup`.
- Set `DHCP Server Interface` to `bridge_work`.
- Set `DHCP Address Space` to `192.168.11.0/24`.
- Set `Gateway for DHCP Network` to `192.168.11.1`.
- Set `Address to Give Out` to `192.168.11.2-192.168.11.254`.
- Set `DNS Servers` to `192.168.11.1`.
- Set `Lease Time` to `3d 00:00:00`.

### Limit work-network traffic

- Open `Queues` and the `Queues Types` tab.
- Create `PCQ_Download` with `Kind: PCQ`.
- Set `Rate` to `5M`.
- Set `Limit` to `500 KiB`.
- Set `Total Limit` to `20000 KiB`.
- Enable `Dst. Address`.
- Copy it as `PCQ_Upload`.
- Enable `Src. Address` and clear `Dst. Address`.
- Create a `Simple Queues` rule for `bridge_work`.
- Set the upload queue type to `PCQ_Upload`.
- Set the download queue type to `PCQ_Download`.
- Verify the limits with `Torch`.

### Configure wireless interfaces

- Open `System->Identity`.
- Set the central router name to `LANMART_Router`.
- Open `Wireless` and rename the adapter to `wlan_hotspot`.
- Enable `Advanced Mode`.
- Set `Mode` to `ap bridge`.
- Set `Band` to `2GHz-B/G`.
- Set `Frequency` to `2412`.
- Set `SSID` to `LANMART-FREE-WI-FI`.
- Set `Radio Name` to `LANMART_MAIN`.
- Set `Scan List` to `2400-2500`.
- Set `Wireless Protocol` to `802.11`.
- Set `Frequency Mode` to `superchannel`.
- Clear `Default Authenticate` and `Default Forward`.
- Set `Rate Selection` to `Advanced`.
- Set `Rate` to `Configured`.
- Clear the B-mode rate checkboxes.
- Set `Distance` to `indoors`.
- Set `Periodic Calibration` to `enabled`.
- Set `Calibration Interval` to `00:00:10`.
- Set `Hw. Protection Mode` to `RTS/CTS`.
- Set `Preamble Mode` to `both`.
- The `short` preamble option may reduce compatibility with some clients.
- Enable four HT receive/transmit channel checkboxes.
- Enable both MIMO channels to improve speed and range.
- Leave `WDS` unchanged.
- Clear `Enable Polling` on `Nstreme`.
- Set `Tx Power Mode` to `All Rates Fixed`.
- Set `Tx Power` to `18`.
- Avoid excessive power because clients may hear but not reach the access point.

### Configure the work wireless network

- Create a security profile in `Wireless -> Security Profiles`.
- Set `Name` to `profile_work`.
- Set `Mode` to `dynamic keys`.
- Enable `WPA PSK` and `WPA2 PSK`.
- Set `Unicast` and `Group Ciphers` to `tkip` and `aes ccm`.
- Set `WPA and WPA2 Pre-Shared Key` to `12345678`.
- Create a `Virtual AP` in `Wireless -> Interfaces`.
- Set its name to `wlan_work`.
- Enable `Advanced Mode`.
- Set `SSID` to `LANMART-WORK`.
- Set `Master Interface` to `wlan_hotspot`.
- Set `Security Profile` to `profile_work`.
- Clear `Default Authenticate` and `Default Forward`.
- Add an `Access List` rule.
- Set `Signal Strength Range` to `-77..120`.
- Use `-90` when roaming is not required.
- Create a separate phone profile when client transmit power differs
  significantly.
- Clear `Forwarding` to isolate wireless clients.

### Attach wireless interfaces to bridges

- Add `wlan_hotspot` to `bridge_hotspot` through `Bridge -> Ports`.
- Add `wlan_work` to `bridge_work`.
- Verify `LANMART-FREE-WI-FI` through the hotspot.
- Verify `LANMART-WORK` without provider redirection.
- Confirm the clients use `wlan_hotspot` and `wlan_work` respectively.
- Confirm signal level `-42` and channel rates during testing.
- Confirm guest address `192.168.10.253`.
- Confirm work address `192.168.11.253`.

### Isolate multiple access points

- Connect each access point through a unique VLAN.
- Create a bridge with traffic isolation.
- Open `Bridge -> Filters`.
- Set `In. Bridge` and `Out. Bridge` to `bridge_hotspot`.
- Set the action to `drop`.
- The bridge filter blocks client-to-client traffic on `bridge_hotspot`.
- Clients can still reach the central router and the services explicitly allowed
  by firewall rules.

[Official HotSpot documentation](https://manual.mikrotik.com/docs/authentication-authorization-accounting/hotspot-captive-portal/)

[Official queue documentation](https://manual.mikrotik.com/docs/firewall-and-quality-of-service/queues/)

[Official legacy Wireless documentation](https://manual.mikrotik.com/docs/wireless/abgn/wireless-interface/)

---
