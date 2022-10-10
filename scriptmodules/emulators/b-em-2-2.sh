#!/usr/bin/env bash

# This file is part of The RetroPie Project
#
# The RetroPie Project is the legal property of its developers, whose names are
# too numerous to list here. Please refer to the COPYRIGHT.md file distributed with this source.
#
# See the LICENSE.md file at the top-level directory of this distribution and
# at https://raw.githubusercontent.com/RetroPie/RetroPie-Setup/master/LICENSE.md
#

rp_module_id="b-em-2-2"
rp_module_desc="B Em 2.2 BBC Micro Emu. With controller support. \"
rp_module_help="ROM Extensions: .ssd\n\nCopy your BBC Micro games to $romdir/bbcmicro\n\n- use F11/WIN-key for the gui\n- use qjoypad to map controls\n- use ctrl+c to exit the emulator\n"
rp_module_section="exp"
rp_module_flags=""

function depends_b-em-2-2() {
    getDepends xorg matchbox-window-manager build-essential cmake libdrm-dev libx11-xcb-dev libxcb-dri3-dev libepoxy-dev liballegro5-dev ruby libasound2-dev xdotool
}

function sources_b-em-2-2() {
    downloadAndExtract "https://github.com/raspberrypi/pico-sdk/archive/master.zip" "$md_build"
    downloadAndExtract "https://github.com/raspberrypi/pico-extras/archive/master.zip" "$md_build"
    #downloadAndExtract "https://github.com/kilograham/b-em/archive/pico.zip" "$md_build"
    downloadAndExtract "https://github.com/FollyMaddy/b-em/archive/pico.zip" "$md_build"
}

function build_b-em-2-2() {
    rm -r $md_build/b-em-pico/pi_build
    mkdir $md_build/b-em-pico/pi_build
    cd $md_build/b-em-pico/pi_build
    if isPlatform "rpi4"; then
    #;-) next line works, makes a working xbeeb and xmaster
    sudo -u root cmake -DPICO_SDK_PATH=$md_build/pico-sdk-master -DPI_BUILD=1 -DPICO_PLATFORM=host -DDRM_PRIME=1 -DX_GUI=1 -DPICO_EXTRAS_PATH=$md_build/pico-extras-master ..
    #!!! next line doesn't work, xbeeb and xmaster don't work (bus error)
    #cmake -DPICO_SDK_PATH=$md_build/pico-sdk-master -DPI_BUILD=1 -DPICO_PLATFORM=host -DDRM_PRIME=1 -DX_GUI=1 -DPICO_EXTRAS_PATH=$md_build/pico-extras-master ..
    else
    #tested on RPI3, but other platforms could work with this line too
    sudo -u root cmake -DPICO_SDK_PATH=$md_build/pico-sdk-master -DPI_BUILD=1 -DPICO_PLATFORM=host -DX_GUI=1 -DPICO_EXTRAS_PATH=$md_build/pico-extras-master ..
    fi
    make -j4
}

function install_b-em-2-2() {
    md_ret_files=(        
        'b-em-pico/pi_build/src/pico/xmaster'
        'b-em-pico/pi_build/src/pico/xbeeb'
    )
}

function configure_b-em-2-2() {
    cat >"$md_inst/matchbox_key_shortcuts" << _EOF_
<ctrl>c=close
_EOF_

    cat >"$md_inst/xbeeb.sh" << _EOF_
#!/bin/bash
xset -dpms s off s noblank
matchbox-window-manager -use_titlebar no -use_cursor no -kbdconfig $md_inst/matchbox_key_shortcuts &
qjoypad "bbcmicro" &
/opt/retropie/emulators/b-em-2-2/xbeeb -disc "\$1"|xdotool sleep 1 keydown Shift_L+F12 sleep 0.1 keyup Shift_L+F12
_EOF_
    chmod +x "$md_inst/xbeeb.sh"

    cat >"$md_inst/xmaster.sh" << _EOF_
#!/bin/bash
xset -dpms s off s noblank
matchbox-window-manager -use_titlebar no -use_cursor no -kbdconfig $md_inst/matchbox_key_shortcuts &
qjoypad "bbcmicro" &
/opt/retropie/emulators/b-em-2-2/xmaster -disc "\$1"|xdotool sleep 1 keydown Shift_L+F12 sleep 0.1 keyup Shift_L+F12
_EOF_
    chmod +x "$md_inst/xmaster.sh"

    mkRomDir "bbcmicro"
    addEmulator 1 "xbeeb" "bbcmicro" "XINIT:$md_inst/xbeeb.sh %ROM%"
    addEmulator 0 "xmaster" "bbcmicro" "XINIT:$md_inst/xmaster.sh %ROM%"
    addSystem "bbcmicro" "BBC Micro" ".ssd"
}