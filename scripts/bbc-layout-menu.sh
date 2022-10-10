#!/bin/bash
function bbc-controller-layout() {
local choice

  while true; do
    choice=$(dialog --backtitle "$BACKTITLE" --title "BBC LAYOUT MENU  " \
     --ok-button Select --cancel-button Back \
     --menu "CHOOSE A LAYOUT " 30 70 50 \
      1 "LAYOUT 1: bbc-1 " \
      2 "LAYOUT 2: bbc-2 " \
      3 "LAYOUT 3: bbc-3 " \
      4 "LAYOUT 4: bbc-4 " \
      5 "LAYOUT 5: bbc-5 " \
      + "----------------" \
      6 "LAYOUT MENU HELP"
      2>&1 >/dev/tty)

    case "$choice" in
    1) layout1 ;;
    2) layout2 ;;
    3) layout3 ;;
    4) layout4 ;;
    5) layout5 ;;
    +) none ;;
    6) layout-help ;;
    *) break ;;
    esac
  done
}

function layout1() {
    cat >"/opt/retropie/emulators/b-em-bbc/b-em-allegro4-multiload.sh" << _EOF_
#!/bin/bash
function load_tape() {
cassload=();cassload=( "quotedbl" "t" "a" "p" "e" "Return" "c" "h" "a" "i" "n" "at" "at" "Return" )
xset -dpms s off s noblank
matchbox-window-manager -use_titlebar no -use_cursor no -kbdconfig /opt/retropie/emulators/b-em-bbc/matchbox_key_shortcuts &
qjoypad "bbc-1" &&
/opt/retropie/emulators/b-em-bbc/b-em \$1 -tape "\$2"|\
for index in \${!cassload[@]};do xdotool \$(if [[ \$index == 0 ]];then echo "sleep 1.5";fi) keydown \${cassload[\$index]} sleep 0.1 keyup \${cassload[\$index]};done
}
function load_disc() {
#dfs autoload with Shift_L+F12
xset -dpms s off s noblank
matchbox-window-manager -use_titlebar no -use_cursor no -kbdconfig /opt/retropie/emulators/b-em-bbc/matchbox_key_shortcuts 
qjoypad "bbc-1" &&
/opt/retropie/emulators/b-em-bbc/b-em \$1 -disc "\$2" | xdotool sleep 1.5 keydown Shift_L+F12 sleep 1 keyup Shift_L+F12
}
[[ "\$2" == *.uef ]] && load_tape \$1 "\$2"
[[ "\$2" == *.ssd ]] && load_disc \$1 "\$2"
_EOF_
}

function layout2() {
    cat >"/opt/retropie/emulators/b-em-bbc/b-em-allegro4-multiload.sh" << _EOF_
#!/bin/bash
function load_tape() {
cassload=();cassload=( "quotedbl" "t" "a" "p" "e" "Return" "c" "h" "a" "i" "n" "at" "at" "Return" )
xset -dpms s off s noblank
matchbox-window-manager -use_titlebar no -use_cursor no -kbdconfig /opt/retropie/emulators/b-em-bbc/matchbox_key_shortcuts &
qjoypad "bbc-2" &&
/opt/retropie/emulators/b-em-bbc/b-em \$1 -tape "\$2"|\
for index in \${!cassload[@]};do xdotool \$(if [[ \$index == 0 ]];then echo "sleep 1.5";fi) keydown \${cassload[\$index]} sleep 0.1 keyup \${cassload[\$index]};done
}
function load_disc() {
#dfs autoload with Shift_L+F12
xset -dpms s off s noblank
matchbox-window-manager -use_titlebar no -use_cursor no -kbdconfig /opt/retropie/emulators/b-em-bbc/matchbox_key_shortcuts 
qjoypad "bbc-2" &&
/opt/retropie/emulators/b-em-bbc/b-em \$1 -disc "\$2" | xdotool sleep 1.5 keydown Shift_L+F12 sleep 1 keyup Shift_L+F12
}
[[ "\$2" == *.uef ]] && load_tape \$1 "\$2"
[[ "\$2" == *.ssd ]] && load_disc \$1 "\$2"
_EOF_
}

function layout3() {
    cat >"/opt/retropie/emulators/b-em-bbc/b-em-allegro4-multiload.sh" << _EOF_
#!/bin/bash
function load_tape() {
cassload=();cassload=( "quotedbl" "t" "a" "p" "e" "Return" "c" "h" "a" "i" "n" "at" "at" "Return" )
xset -dpms s off s noblank
matchbox-window-manager -use_titlebar no -use_cursor no -kbdconfig /opt/retropie/emulators/b-em-bbc/matchbox_key_shortcuts &
qjoypad "bbc-3" &&
/opt/retropie/emulators/b-em-bbc/b-em \$1 -tape "\$2"|\
for index in \${!cassload[@]};do xdotool \$(if [[ \$index == 0 ]];then echo "sleep 1.5";fi) keydown \${cassload[\$index]} sleep 0.1 keyup \${cassload[\$index]};done
}
function load_disc() {
#dfs autoload with Shift_L+F12
xset -dpms s off s noblank
matchbox-window-manager -use_titlebar no -use_cursor no -kbdconfig /opt/retropie/emulators/b-em-bbc/matchbox_key_shortcuts 
qjoypad "bbc-3" &&
/opt/retropie/emulators/b-em-bbc/b-em \$1 -disc "\$2" | xdotool sleep 1.5 keydown Shift_L+F12 sleep 1 keyup Shift_L+F12
}
[[ "\$2" == *.uef ]] && load_tape \$1 "\$2"
[[ "\$2" == *.ssd ]] && load_disc \$1 "\$2"
_EOF_
}

function layout4() {
    cat >"/opt/retropie/emulators/b-em-bbc/b-em-allegro4-multiload.sh" << _EOF_
#!/bin/bash
function load_tape() {
cassload=();cassload=( "quotedbl" "t" "a" "p" "e" "Return" "c" "h" "a" "i" "n" "at" "at" "Return" )
xset -dpms s off s noblank
matchbox-window-manager -use_titlebar no -use_cursor no -kbdconfig /opt/retropie/emulators/b-em-bbc/matchbox_key_shortcuts &
qjoypad "bbc-4" &&
/opt/retropie/emulators/b-em-bbc/b-em \$1 -tape "\$2"|\
for index in \${!cassload[@]};do xdotool \$(if [[ \$index == 0 ]];then echo "sleep 1.5";fi) keydown \${cassload[\$index]} sleep 0.1 keyup \${cassload[\$index]};done
}
function load_disc() {
#dfs autoload with Shift_L+F12
xset -dpms s off s noblank
matchbox-window-manager -use_titlebar no -use_cursor no -kbdconfig /opt/retropie/emulators/b-em-bbc/matchbox_key_shortcuts 
qjoypad "bbc-4" &&
/opt/retropie/emulators/b-em-bbc/b-em \$1 -disc "\$2" | xdotool sleep 1.5 keydown Shift_L+F12 sleep 1 keyup Shift_L+F12
}
[[ "\$2" == *.uef ]] && load_tape \$1 "\$2"
[[ "\$2" == *.ssd ]] && load_disc \$1 "\$2"
_EOF_
}

function layout-help() {
dialog  --sleep 1 --title "BBC LAYOUT HELP" --msgbox " 
WHY EVEN MAKE THIS?
     - We want everyone to enjoy alL the games.
HOWS THIS WORK?
     - This edits BBC emu launch commands to load different qjoypad layouts.
     - Each layout has the name of layout next to it. Example bbc-1
HOW DO I USE IT ?
     - Open pixel desktop
     - Open qjoypad
     - Click qjoypad icon in tray.
     - Add a new layout.
     - Name bbc-1, bbc-2, bbc-3, bbc-4, or bbc-5
     - Map your buttons to keyboard .
     - Save your new layout .
     - Enjoy!
WHERE DID THIS COME FROM?
     - We Retro Devils made this from stratch to enjoy BBC." 0 0
}
     

bbc-controller-layout
