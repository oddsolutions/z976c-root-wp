#!/bin/bash

function pause(){
   read -p "$*"
}

echo "Connect your Z976C via USB"
echo "Go into Settings --> Developer Settings -> Enable 'USB Debugging'"
echo "Go into Settings --> Developer Settings -> Enable 'Verify apps over USB'"
echo "Go into Settings --> Security ==> Enable 'Unknown Sources'"
echo "Once you have completed the above, push enter to proceed."
pause
echo "You may be told that the applications being installed are malicious, please select the option to proceed.
pause
adb install .\payload\apks\tr.apk
adb install .\payload\apks\supersu.apk
adb push .\payload\rerun-stage1 /data/local/tmp
adb push .\payload\rerun-stage2 /data/local/tmp
adb push .\payload\stock-images/boot.img /data/local/tmp
adb push .\payload\stock-images/recovery.img /data/local/tmp
echo "Please open the TowelRoot app and click 'Make it Ra1n', then push enter."
pause
adb shell "su -c sh /data/local/tmp/rerun"-stage1
echo "Your device will now reboot."
echo "Once your device reboots, please re-open the TowelRoot app, click Make it Ra1n', then open the SuperSU app, and when prompted to 'Update the SU Binary' select the 'normal' option. Then, from the SuperSU app Settings, choose 'Convert to /System App'."
echo "Once the above completes, please hit enter to restore your stock recovery image."
pause
adb shell "su -c sh /data/local/tmp/rerun"-stage2
adb shell "rm -Rf /data/local/tmp/*"
echo "Congrats, you are have persistent root access and write protection is disabled! Hit enter to close this window.
pause
exit