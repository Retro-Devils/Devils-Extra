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
clear
echo "THIS INSTALLER USES QJOYPAD FOR CONTROLLER SUPPORT"
sleep 2
echo "YOU WILL NOT HAVE CONTROLLER SUPPORT WITHOUT QJOYPAD!!!!!"
sleep 2 
echo "YOU WILL KEYBOARD SUPPORT OFF RIP"
sleep 2 
echo "HOW TO STEP QJOYPAD"
sleep 2
echo "OPEN PIXEL DESKTOP"
sleep 2
echo "CLICK START THEN QJOYPAD"
sleep 2
echo "THEN  QJOYPAD TRAY ICON"
sleep 2
echo "SELECT bbcmicro LAYOUT"
sleep 2 
echo "THEN CLICK QUICK SET TO SET YOUR BUTTONS"
sleep 2 
echo "PRESS YOUR CONTROLLER BUTTON THEN KEYBOARD BUTTON. REPEAT AS NEEDED"
sleep 2 
sleep 10
echo "THANKS FOR INSTALLING ENJOY"
