---
title: Installation
category: ClamAV
date: 2026-04-24
---

-----

```bash
# Add Epel repository to download ClamAV in your Amazon Linux.
$ sudo amazon-linux-extras install epel

# Install ClamAV and Clamd using YUM Command
$ sudo yum install clamav clamd -y

# Remove Example Strings from the Configuration file.
$ sudo sed -i -e "s/^Example/#Example/" /etc/clamd.d/scan.conf
$ sudo sed -i -e "s/^Example/#Example/" /etc/freshclam.conf

# Run Virus Defination Database update
$ sudo freshclam

# Uncomment the following line in /etc/clamd.d/scan.conf
  #LocalSocket /var/run/clamd.scan/clamd.sock

# Start Clamd Service
$ sudo systemctl start clamd@scan

# Also, run the following command to run the service automatically if system reboots.
$ sudo systemctl enable clamd@scan

# Create the directories
$ mkdir /usr/local/src/virusdetectiondirectory
$ mkdir /var/log/clamav/

# Setup a Cron job to schedule and update and scan.
0 5 * * * /usr/bin/freshclam > /var/log/clamav/freshclam.log
30 5 * * * /usr/bin/clamscan -ir / -l /var/log/clamav/clamd.log --copy=/usr/local/src/virusdetectiondirectory --exclude-dir="/sys/"
*/30 * * * * /usr/bin/clamscan -ir /tmp -l /var/log/clamav/clamd.log --copy=/usr/local/src/virusdetectiondirectory

# Disable or Modify SELINUX
# To disable SELINUX run following command
$ setenforce 0

# To modify SELINUX to Allow ClamAV run following command
$ sudo setsebool -P antivirus_can_scan_system 1
$ sudo setsebool -P clamd_use_jit 1

# To Verify SELINUX run following Command
$ sudo getsebool -a | grep antivirus

# It is OK if you get the below result.
antivirus_can_scan_system –&gt; on
antivirus_use_jit –&gt; off
```

-----

[Source](https://devopsmyway.com/install-clamav-on-amazon-linuxec2/)

-----
