#!/bin/bash
export NCURSES_NO_UTF8_ACS=1
###----------------------------###
### INSTALLER MENU FUNCTIONS   ###
###----------------------------###
function bbc-install-menu() {
    local choice

    while true; do
        choice=$(dialog --backtitle "$BACKTITLE" --title "BBC MICRO INSTALLER V1.1 " \
            --ok-label Select --cancel-label Exit-Installer \
            --menu "Pi.D.E.I INSTALLER" 25 50 30 \
            1 "Install/Update BBC Micro " \
            2 "BBC Micro Information   " \
            - "__________        __                  " \
            - "\______   \ _____/  |________  ____   " \
            - " |       _// __ \   __\_  __ \/  _ \  " \
            - " |    |   \  ___/|  |  |  | \(  <_> ) " \
            - " |____|_  /\___  >__|  |__|   \____/  " \
            - "        \/     \/                     " \
            - "________              .__.__          " \
            - "\______ \   _______  _|__|  |   ______" \
            - " |    |  \_/ __ \  \/ /  |  |  /  ___/" \
            - " |    '   \  ___/\   /|  |  |__\___ \ " \
            - "/_______  /\___  >\_/ |__|____/____  >" \
            - "        \/     \/                  \/ " \
            2>&1 > /dev/tty)

        case "$choice" in
            1) install-bbc  ;;
            2) bbc-info     ;;
            -) no ;;
	          +) none ;;
            *) break       ;;
        esac
    done
}

function install-bbc() {
if [ -f "$HOME/RetroPie-Setup/scriptmodules/emulators/b-em-2.2.sh" ]; then sudo rm $HOME/RetroPie-Setup/scriptmodules/emulators/b-em-2.2.sh; fi
if [ -f "$HOME/RetroPie-Setup/scriptmodules/extras/Devils-Extras/emulators/b-em-2.2.sh" ]; then sudo rm $HOME/RetroPie-Setup/scriptmodules/extras/Devils-Extras/emulators/b-em-2.2.sh; fi
if [ -f "$HOME/RetroPie-Setup/scriptmodules/emulators/extras/b-em-2.2.sh" ]; then sudo rm $HOME/RetroPie-Setup/scriptmodules/emulators/extras/b-em-2.2.sh; fi
wget https://raw.githubusercontent.com/Retro-Devils/Devils-Extra/main/scriptmodules/emulators/b-em-2.2.sh -P $HOME/RetroPie-Setup/scriptmodules/emulators/
chmod 777 $HOME/RetroPie-Setup/scriptmodules/emulators/b-em-2.2.sh
sudo chmod -R sudo chmod 777 /opt/retropie/emulators/b-em-allegro4
sleep 3
sudo $HOME/RetroPie-Setup/retropie_packages.sh b-em-pico-pi
sleep 2
wget https://raw.githubusercontent.com/Retro-Devils/Devils-Extra/main/scripts/bbcmicro.lyt -P $HOME/.qjoypad3/
sleep 2
dialog  --sleep 1 --title "BBC INSTALLER INFO" --msgbox " 
THIS INSTALLER USES QJOYPAD FOR CONTROLLER SUPPORT
YOU WILL KEYBOARD SUPPORT OFF RIP
<------------------------------------------------>
HOW TO STEP QJOYPAD
OPEN PIXEL DESKTOP
CLICK START THEN QJOYPAD THEN
QJOYPAD TRAY ICON
SELECT bbcmicro LAYOUT
THEN CLICK QUICK SET TO SET YOUR BUTTONS
PRESS YOUR CONTROLLER BUTTON THEN KEYBOARD BUTTON. REPEAT AS NEEDED" 0 0

dialog  --sleep 1 --title "BBC INSTALLER EXIT INFO" --msgbox " 
THANKS FOR INSTALLING
REPORT ERRORS TO DEVILS
PLEASE ENJOY" 0 0
}

function bbc-info() {
dialog  --sleep 1 --title "BBC MICRO INFO" --msgbox " 
BBC Micro INFO 
The British Broadcasting Corporation Microcomputer System, or BBC Micro, is a series of microcomputers &
associated peripherals designed and built by Acorn Computers in the 1980s for the BBC Computer Literacy Project." 0 0
}

bbc-install-menu
