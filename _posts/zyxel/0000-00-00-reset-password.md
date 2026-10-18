---
title: Basic commands
category: Zyxel
date: 2019-04-15
---

---

*Reset a ZyXEL system password by restoring factory settings.*

The ZyXEL system password can be reset only by restoring the device to its factory settings.

1. On ZyXEL consumer devices, reset the settings with the RESET button.

2. Some devices, such as Ethernet switches, do not have a RESET button. To reset the password, write a `*.rom` configuration file with factory settings to the device. The ROM file is usually included in the firmware archive. This method also supports resetting the password through the device console port.

Perform the following steps:

2.1. Connect the ZyXEL device console port to the computer serial port (COM port). Enter `ATBA5` to change the port speed to 115200.

2.2. Start a terminal program, such as HyperTerminal on Windows, with these settings: speed — 9600 bits/s; data bits — 8; parity — none; stop bits — 1; flow control — none.

2.3. Power on the device. The terminal program should display the device boot messages.

2.4. During boot, the prompt `Press any key to enter Debug Mode within 3 seconds` appears. Press any key to enter Debug mode.

2.5. Enter `ATSH` to check the device software version.

2.6. Download the firmware ZIP archive for your device from the [ZyXEL website](http://zyxel.ru/support/download).

2.7. Extract the archive to disk. The firmware archive also contains a configuration file (ROM file) with default settings.

2.8. Enter `ATBA5`. Set the terminal speed to 115200.

2.9. Enter `ATLC` to start writing the ROM file to the device.

2.10. In HyperTerminal, open Transfer > Send file and select the Xmodem protocol. Select Browse and specify the path to the ROM file on disk. Select Send to start writing the ROM file.

2.10. After the file is written successfully, enter `ATGO` to reboot the device.

Attention: A factory reset deletes all user settings. The default password for ZyXEL devices is `1234`.

To flash a `*.bin` file, enter `ATUR` instead of `ATLC` in step 2.9.

After the file is written successfully, the device reboots automatically.

---
