#!/bin/bash
export NCURSES_NO_UTF8_ACS=1

echo "BBC INSTALLER WILL NOW BEGIN"
sleep 5
echo "IF YOU WANNA CANCEL PLEASE PRESS CONTROL+C NOW"
sleep 5
wget https://raw.githubusercontent.com/Retro-Devils/Devils-Extra/main/scriptmodules/emulators/b-em-2-2.sh -P $HOME/RetroPie-Setup/scriptmodules/emulators/
sleep 3
echo "INSTALLER WILL NOW INSTALL B-EM 2.2 EMULATOR"
sudo $HOME/RetroPie-Setup//retropie_packages.sh b-em-2-2
sleep 2
echo "INSTALLER WILL NOW GRAB A BLANK QJOYPAD LAYOUT NAMED bbcmicro "
wget https://raw.githubusercontent.com/Retro-Devils/Devils-Extra/main/scripts/bbcmicro.lyt -P $HOME/.qjoypad/
sleep 2
dialog  --sleep 1 --title "BBC INSTALLER INFO" --msgbox " 
THIS INSTALLER USES QJOYPAD FOR CONTROLLER SUPPORT
echo YOU WILL KEYBOARD SUPPORT OFF RIP
<------------------------------------------------>
HOW TO STEP QJOYPAD
OPEN PIXEL DESKTOP
CLICK START THEN QJOYPADTHEN
QJOYPAD TRAY ICON
SELECT bbcmicro LAYOUT
THEN CLICK QUICK SET TO SET YOUR BUTTONS
PRESS YOUR CONTROLLER BUTTON THEN KEYBOARD BUTTON. REPEAT AS NEEDED" 0 0

dialog  --sleep 1 --title "BBC INSTALLER INFO" --msgbox " 
THANKS FOR INSTALLING
REPORT ERRORS TO DEVILS
PLEASE ENJOY" 0 0
