#!/bin/bash

# 
# Attention: you don't need this script if your Android device is rooted.
# Please check the following instructions:
# http://stackoverflow.com/questions/2604727/how-can-i-connect-to-android-with-adb-over-tcp
# 
# Instructions
#
# To connect your device by Wi-Fi
# 1. Connect your device via USB
# 2. Run this script with no options
# 3. Your phone can be debugged via Wi-Fi if text "Connected to <PHONE_IP>:5555 has appeared
# 4. Otherwise repeat step 2
#
# To disconnect your device print '''adb usb''' while it is not connected to computer via USB

PHONE_IP=`adb shell ip -f inet addr show wlan0 | grep "inet" | sed -e 's/\/[0-9]*//g' | awk '{print $2}'`

adb tcpip 5555
adb connect $PHONE_IP:5555
