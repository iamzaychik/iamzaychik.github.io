---
title: Connect to HP printer
category: Lubuntu
date: 2019-04-15
---

-----

Modern Linux distributions support a large number of peripheral devices, including scanners, plotters, and printers. People new to Linux can encounter problems when installing a new printer. This article covers installing an HP printer on Ubuntu.

HPLIP (HP Linux Printing and Imaging System) was developed to support printing on most inkjet and many LaserJet printers, as well as scanning, faxing, and memory-card access.

HPLIP includes the following:
<ul>
   *system services for communicating with printers;
   *the HP CUPS driver for two-way communication with HP printers (`hp:`);
   *the HP CUPS driver for sending faxes (`hpfax:`);
   *the HPIJS Ghostscript IJS driver for rasterizing PostScript or Ghostscript files and converting faxes to PostScript;
   *utilities for printer maintenance, including ink-level monitoring, print-head cleaning, and calibration;
   *utilities for downloading data from memory cards in modern multifunction devices, such as scanner-printer-copiers;
   *fax utilities;
   *a graphical interface for accessing these tools;
   *the HPAIO driver for SANE (`hpaio`), which supports scanning on flatbed multifunction devices and devices with automatic document feeders.
</ul>


The latest HPLIP version (2.8.12) is available on the * <a href="https://hplipopensource.com/hplip-web/index.html">official website</a>. At the time of writing, it supported more than 1,536 printer models.

To determine whether **HPLIP** supports your HP printer model, follow this * <a href="https://hplipopensource.com/hplip-web/supported_devices/index.html">link</a>.

After finding your printer model in the list of HPLIP-supported printers, note the recommended HPLIP version (_requires HPLIP version_ …). It specifies the _minimum version_ of **HPLIP** needed for your HP device to work correctly.

To view the installed **HPLIP** version, run:

**dpkg -l hplip**

The output will look similar to this:

Look for the line beginning with `ii`. Its third column contains the installed **HPLIP** version (2.8.7 in this example).

If your Ubuntu installation has an older **HPLIP** version than your printer requires, update it.

<h3>Install the printer</h3>

To install the printer, run `<span style="color: #0000ff;">sudo hp-setup</span>` in a terminal, then complete the following steps:
<ol>
   *Choose the connection type. Modern devices usually connect through USB, so select **USB**, then click _Next_.
   *Choose your printer model. It should be detected automatically; otherwise, select it manually from the supported-printers list.
   *Click _Next_ in the following two windows.
   *Finish the installation by clicking _Finish_.
</ol>

After these steps, the printer is installed and a test page is printed.

**Set the default printer.**

To make your HP printer the default, choose **System** — **Preferences** — **Default Printer**. In the list of available printers, select the required printer and click _Use as Default_.

In Lubuntu, open **System** → **Printers** and add the network printer.

-----
