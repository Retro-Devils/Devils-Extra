#!/bin/bash

export NCURSES_NO_UTF8_ACS=1
###----------------------------###
### INSTALLER MENU FUNCTIONS   ###
###----------------------------###
if [ -f "opt/retropie/lr-mess/mess_libretro.so" ]; then install-mess; fi
function install-mess() {
dialog  --sleep 1 --title "LR MESS ERROR" --msgbox "
MESS NOT INSTALLED
INSTALLING NOW" 0 0
cd $HOME/RetroPie-Setup
sudo ./retropie_packages.sh lr-mess
}

function mess_menu() {
    local choice

    while true; do
        choice=$(dialog --backtitle "$BACKTITLE" --title " MESS SYSTEM INSTALLER V1.00 " \
            --ok-label Select --cancel-label Exit-Installer \
            --menu "CHOOSE SYSTEM TO INSTALL" 25 50 30 \
            1 "Adam" \
            2 "Advison " \
            2>&1 > /dev/tty)

        case "$choice" in
            1) install_core "adam"  ;;
            2) install-core "advision" ;;
            +) mess-extras ;;
            -) no ;;
            *) break       ;;
        esac
    done
    }
    
function install-core() {
if [ -f "$HOME/RetroPie-Setup/scriptmodules/libretrocores/lr-mess-"$1".sh" ]; then wget https://raw.githubusercontent.com/Retro-Devils/Devils-Extra/main/scriptmodules/libretrocores/lr-mess-"$1".sh -P $HOME/RetroPie-Setup/scriptmodules/libretrocores/; fi
cd $HOME/RetroPie-Setup
sudo ./retropie_packages.sh lr-mess-"$1"
}



mess-menu
