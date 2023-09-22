# z976c-root: Persistent root and write-protection disablement for the ZTE Majesty

An exploit chain intended to allow one to root and disable system partition write protection on the ZTE Majesty (z976c).

This uses an old vulnerability discovered by Sean Beapure (beaups) that involves booting the standard Android boot image from the recovery partition.

This is due to the fact that when booted into the recovery context, system partition write protection is disabled.

# Standard Disclaimer

You are solely responsible for any potential damage(s) caused to your device by this exploit.

# Requirements

- Chromecast With Google TV (sabrina) without USB password mitigation<sup>1</sup>
- Either a USB A to C, or a C to C cable
- A PC running some flavor of 64-bit GNU Linux
- `libusb-dev` installed
- `fastboot` & `mke2fs` installed from the [SDK Platform tools](https://developer.android.com/studio/releases/platform-tools)

<sup>1</sup>: The USB password mitigation has been enabled on units manufactured in December 2020 and after. For units manufactured before, the mitigation was enabled by software update in February 2021. To discern this, look at the `MFP` date on the bar-code sticker on the bottom of your device's box. If you've powered it on and OTA'd, your firmware version needs to be below the February 2021 patch level.
It's not possible to disable/change the password since it's burnt into the chip (efuses).

# FAQ

Does this unlock my bootloader, let me run TWRP, or a custom ROM?

- No.

Can I OTA after running this?

- No, but there are also 0 OTA updates available for this device.

Can I undo this?

- You can use the "Unroot" option in SuperSU, all other changes are undone by the exploit toolkit after it succeeds.

# Content
- /rereun-stage1: Gains initial root on the device, and flashes the boot image to the recovery partition
- /rerun-stage2: Post-exploitation, this reflashes the stock recovery image to the recovery partition
- /apks/: Applications used in the exploit
- /stock-images: Stock images used in the exploit

# Guide
1. Clone/Download this repo locally, change your shell's directory to it & ensure you have `adb`` installed
2. For GNU/Linux users, run `rerun.sh`, for Windows users, run `rerun.bat`
3. Follow the instructions presented by the script

# Notices
This exploit chain only persistently modifies the system partition. You can undo this with the "Unroot" option in the SuperSU app.
