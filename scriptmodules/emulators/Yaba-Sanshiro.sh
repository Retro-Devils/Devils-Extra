#!/usr/bin/env bash

# This file is part of The RetroPie Project
#
# The RetroPie Project is the legal property of its developers, whose names are
# too numerous to list here. Please refer to the COPYRIGHT.md file distributed with this source.
#
# See the LICENSE.md file at the top-level directory of this distribution and
# at https://raw.githubusercontent.com/RetroPie/RetroPie-Setup/master/LICENSE.md
#

rp_module_id="yabasanshiro"
rp_module_desc="SEGA Saturn emulator Yaba Sanshiro"
rp_module_help="ROM Extensions: .cue .chd\n\nCopy your SEGA Saturn ios images to $romdir/saturn"
rp_module_licence="GPL2 https://github.com/devmiyax/yabause/blob/master/LICENSE"
rp_module_repo="git https://github.com/devmiyax/yabause.git pi4"
rp_module_section="exp"
rp_module_flags="!64bit"

function depends_yabasanshiro() {
    local depends=(cmake pkg-config python-pip cmake build-essential protobuf-compiler libprotobuf-dev libsecret-1-dev libssl-dev libsdl2-dev libboost-all-dev )
    getDepends "${depends[@]}"
}

function sources_yabasanshiro() {
    gitPullOrClone "$md_build" https://github.com/devmiyax/yabause.git pi4 bd9f235
    #git submodule update --init --recursive
}

function build_yabasanshiro() {
    mkdir build
    cd build
    cmake ../yabause/ -DGIT_EXECUTABLE=/usr/bin/git -DYAB_PORTS=retro_arena -DYAB_WANT_DYNAREC_DEVMIYAX=ON -DYAB_WANT_ARM7=ON -DCMAKE_TOOLCHAIN_FILE=../yabause/src/retro_arena/pi4.cmake -DCMAKE_INSTALL_PREFIX="$md_inst"
    make clean
    make -j4
    md_ret_require="$md_build/build/src/retro_arena/yabasanshiro"
}

function install_yabasanshiro() {
    cd build
    make install
}

function configure_yabasanshiro() {
    mkRomDir "saturn"
    addEmulator 1 "$md_id" "saturn" "$md_inst/yabasanshiro -r 3 -i %ROM%"
    addSystem "saturn"
}