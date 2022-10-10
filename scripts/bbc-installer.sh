#!/bin/bash
export NCURSES_NO_UTF8_ACS=1

echo "BBC INSTALLER WILL NOW BEGIN"
sleep 5
echo "IF YOU WANNA CANCEL PLEASE PRESS CONTROL+C NOW"
sleep 5
wget https://raw.githubusercontent.com/Retro-Devils/Devils-Extra/main/scriptmodules/emulators/b-em-2-2.sh -P $HOME/RetroPie-Setup/scriptmodules/emulators/
sleep 1
wget https://raw.githubusercontent.com/Retro-Devils/Devils-Extra/main/scripts/bbc-layout-menu.sh -P $HOME/RetroPie/roms/ports/
sleep 5
echo "INSTALLER WILL NOW INSTALL B-EM 2.2 EMULATOR"
sudo ./retropie_packages.sh b-em-2-2
sleep 2
echo "INSTALLER WILL NOW GRAB A BLANK QJOYPAD LAYOUT NAMED bbcmicro "
wget https://raw.githubusercontent.com/Retro-Devils/Devils-Extra/main/scripts/bbcmicro.lyt -P $HOME/.qjoypad/
sleep 2
echo "OPEN PIXEL DESKTOP THEN QJOYPAD TO EDIT bbcmicro LAYOUT"
sleep 2
echo "USE BBC LAYOUT MENU TO SELECT NEW LAYOUT"
echo "YOU MUST HAVE/MADE LAYOUTS TO SWITCH TO/FROM"
echo "LAYOUT NAMES AS FOLLOWS bbc-1,bbc-2,bbc-3,bbc-4"
echo "PLEASE SEE LAYOUT MENU IN PORTS FOR MORE"
sleep 10
echo "THANKS FOR INSTALLING ENJOY"
