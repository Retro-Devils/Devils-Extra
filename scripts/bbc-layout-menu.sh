#!/bin/bash
function bbc-controller-layout() {
local choice

  while true; do
    choice=$(dialog --backtitle "$BACKTITLE" --title "BBC LAYOUT MENU  " \
     --ok-button Select --cancel-button Back \
     --menu "CHOOSE A LAYOUT " 30 70 50 \
      1 "LAYOUT 1:  1,2,3,4,5,6--DPAD " \
      2 "LAYOUT 2:  W,A,S,D--" \
      3 "LAYOUT 3: " \
      4 "LAYOUT 4: " \
      2>&1 >/dev/tty)

    case "$choice" in
    1) layout1 ;;
    2) layout2 ;;
    3) layout3 ;;
    4) layout4 ;;
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

bbc-controller-layout
