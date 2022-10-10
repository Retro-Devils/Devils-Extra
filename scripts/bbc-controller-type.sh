#!/bin/bash
function bbc-controller-layout() {
local choice

  while true; do
    choice=$(dialog --backtitle "$BACKTITLE" --title "BBC CONTROLLER MENU  " \
     --ok-button Select --cancel-button Back \
     --menu "CHOOSE A LAYOUT " 30 70 50 \
      1 "LAYOUT 1:  1,2,3,4,5,6--DPAD " \
      2 "LAYOUT 2:  W,A,S,D--" \
      3 "LAYOUT 3: " \
      4 "LAYOUT 4: " \
      5 "USE A SINGLE LAYOUT" \
      2>&1 >/dev/tty)

    case "$choice" in
    1)cat >"/opt/retropie/emulators/b-em-bbc-sh/b-em-allegro4-multiload.sh" << _EOF_
    #!/bin/bash
    function load_tape() {
    cassload=();cassload=( "quotedbl" "t" "a" "p" "e" "Return" "c" "h" "a" "i" "n" "at" "at" "Return" )
    xset -dpms s off s noblank
    matchbox-window-manager -use_titlebar no -use_cursor no -kbdconfig /opt/retropie/matchbox_key_shortcuts &
    qjoypad "bbc-" &&
    /opt/retropie/emulators/b-em-allegro4/b-em \$1 -tape "\$2"|\
    for index in \${!cassload[@]};do xdotool \$(if [[ \$index == 0 ]];then echo "sleep 1.5";fi) keydown \${cassload[\$index]} sleep 0.1 keyup \${cassload[\$index]};done
    }
    function load_disc() {
    #dfs autoload with Shift_L+F12
    xset -dpms s off s noblank
    matchbox-window-manager -use_titlebar no -use_cursor no -kbdconfig /opt/retropie/emulators/b-em-bbc-sh/matchbox_key_shortcuts &
    qjoypad "bbcmicro" &&
    /opt/retropie/emulators/b-em-allegro4/b-em \$1 -disc "\$2" | xdotool sleep 1.5 keydown Shift_L+F12 sleep 1 keyup Shift_L+F12
    } 
    ;;
    2)cat >"/opt/retropie/emulators/b-em-bbc-sh/b-em-allegro4-multiload.sh" << _EOF_
    #!/bin/bash
    function load_tape() {
    cassload=();cassload=( "quotedbl" "t" "a" "p" "e" "Return" "c" "h" "a" "i" "n" "at" "at" "Return" )
    xset -dpms s off s noblank
    matchbox-window-manager -use_titlebar no -use_cursor no -kbdconfig /opt/retropie/emulators/b-em-bbc-sh/matchbox_key_shortcuts &
    qjoypad "bbcmicro" &&
    /opt/retropie/emulators/b-em-allegro4/b-em \$1 -tape "\$2"|\
    for index in \${!cassload[@]};do xdotool \$(if [[ \$index == 0 ]];then echo "sleep 1.5";fi) keydown \${cassload[\$index]} sleep 0.1 keyup \${cassload[\$index]};done
    }
    function load_disc() {
    #dfs autoload with Shift_L+F12
    xset -dpms s off s noblank
    matchbox-window-manager -use_titlebar no -use_cursor no -kbdconfig /opt/retropie/emulators/b-em-bbc-sh/matchbox_key_shortcuts &
    qjoypad "bbcmicro" &&
    /opt/retropie/emulators/b-em-allegro4/b-em \$1 -disc "\$2" | xdotool sleep 1.5 keydown Shift_L+F12 sleep 1 keyup Shift_L+F12
    } ;;
    3)cat >"/opt/retropie/emulators/b-em-bbc-sh/b-em-allegro4-multiload.sh" << _EOF_
    #!/bin/bash
    function load_tape() {
    cassload=();cassload=( "quotedbl" "t" "a" "p" "e" "Return" "c" "h" "a" "i" "n" "at" "at" "Return" )
    xset -dpms s off s noblank
    matchbox-window-manager -use_titlebar no -use_cursor no -kbdconfig /opt/retropie/emulators/b-em-bbc-sh/matchbox_key_shortcuts &
    qjoypad "bbcmicro" &&
    /opt/retropie/emulators/b-em-allegro4/b-em \$1 -tape "\$2"|\
    for index in \${!cassload[@]};do xdotool \$(if [[ \$index == 0 ]];then echo "sleep 1.5";fi) keydown \${cassload[\$index]} sleep 0.1 keyup \${cassload[\$index]};done
    }
    function load_disc() {
    #dfs autoload with Shift_L+F12
    xset -dpms s off s noblank
    matchbox-window-manager -use_titlebar no -use_cursor no -kbdconfig /opt/retropie/emulators/b-em-bbc-sh/matchbox_key_shortcuts &
    qjoypad "bbcmicro" &&
    /opt/retropie/emulators/b-em-allegro4/b-em \$1 -disc "\$2" | xdotool sleep 1.5 keydown Shift_L+F12 sleep 1 keyup Shift_L+F12
    } ;;
    4) update-test ;;
    *) break ;;
    esac
  done
}

bbc-controller-type
