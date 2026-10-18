---
title: Connect to HP printer
category: Lubuntu
date: 2019-04-15
---

---

*Install and configure an HP printer on Lubuntu with HPLIP.*

Modern Linux distributions support a large number of peripheral devices, including scanners, plotters, and printers. People new to Linux can encounter problems when installing a new printer. This article covers installing an HP printer on Ubuntu.

HPLIP (HP Linux Printing and Imaging System) was developed to support printing on most inkjet and many LaserJet printers, as well as scanning, faxing, and memory-card access.

HPLIP includes the following:

* System services for communicating with printers.
* The HP CUPS driver for two-way communication with HP printers (`hp:`).
* The HP CUPS driver for sending faxes (`hpfax:`).
* The HPIJS Ghostscript IJS driver for rasterizing PostScript or Ghostscript files.
* Utilities for printer maintenance, including ink-level monitoring and calibration.
* Utilities for downloading data from memory cards in multifunction devices.
* Fax utilities.
* A graphical interface for accessing these tools.
* The HPAIO driver for SANE (`hpaio`) and supported scanners.

The latest HPLIP version (2.8.12) is available on the [official website](https://hplipopensource.com/hplip-web/index.html). At the time of writing, it supported more than 1,536 printer models.

To determine whether *HPLIP* supports your HP printer model, follow this [link](https://hplipopensource.com/hplip-web/supported_devices/index.html).

After finding your printer model in the list of HPLIP-supported printers, note the recommended HPLIP version (_requires HPLIP version_ …). It specifies the _minimum version_ of *HPLIP* needed for your HP device to work correctly.

To view the installed *HPLIP* version, run:

```bash
$ dpkg -l hplip
```

The output will look similar to this:

Look for the line beginning with `ii`. Its third column contains the installed *HPLIP* version (2.8.7 in this example).

If your Ubuntu installation has an older *HPLIP* version than your printer requires, update it.

### Install the printer

To install the printer, run `sudo hp-setup` in a terminal, then complete the following steps:

1. Choose the connection type and select *USB* for modern devices.
2. Choose your printer model from the supported-printers list.
3. Click *Next* in the following two windows.
4. Finish the installation by clicking *Finish*.

After these steps, the printer is installed and a test page is printed.

*Set the default printer.*

To make your HP printer the default, choose *System* — *Preferences* — *Default Printer*. In the list of available printers, select the required printer and click _Use as Default_.

In Lubuntu, open *System* → *Printers* and add the network printer.

---
