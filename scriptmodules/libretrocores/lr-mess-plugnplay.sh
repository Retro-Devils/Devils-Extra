#!/usr/bin/env bash

# This file is part of The RetroPie Project
#
# The RetroPie Project is the legal property of its developers, whose names are
# too numerous to list here. Please refer to the COPYRIGHT.md file distributed with this source.
#
# See the LICENSE.md file at the top-level directory of this distribution and
# at https://raw.githubusercontent.com/RetroPie/RetroPie-Setup/master/LICENSE.md
#


rp_module_id="lr-mess-plugnplay"
rp_module_name="plugnplay with mame-softlist support"
rp_module_ext=".cmd .zip .7z .7z .cue .fba .iso .zip .cdi .chd .gdi .sh"
rp_module_desc="Use lr-mess and mame emulator for plugnplay and load roms and software supported by the mame database"
rp_module_help="ROM Extensions: $rp_module_ext\n
Above extensions are included for compatibility between different media installs.\n\n
ROM extensions only supported by this install:\n
.cmd .zip .7z \n\n
Put games or game-BIOS files in :\n
$romdir/plugnplay\n
Notes:\n
No specific BIOS info can be given here.\n
When using game-BIOS files,\n
no BIOS is needed in the BIOS directory.\n
If BIOS files are needed put them in :\n
$biosdir/mame\n
If the system doesn't boot then check :\n
/dev/runcommand.log\n\n"
rp_module_licence="GPL2 https://raw.githubusercontent.com/libretro/mame/master/LICENSE.md"
rp_module_section="exp"
rp_module_flags=""

function build_lr-mess-plugnplay() {
	true
}


function install_lr-mess-plugnplay() {
	true
}


function configure_lr-mess-plugnplay() {
	local _retroarch_bin="$rootdir/emulators/retroarch/bin/retroarch"
	local _mess_core=$(dirname "$md_inst")/lr-mess/mamemess_libretro.so
	local _mame_core=$(dirname "$md_inst")/lr-mame/mamearcade_libretro.so
	local _system="plugnplay"
	local _config="$configdir/$_system/retroarch.cfg"
	local _add_config_basename="$_config.add"
	local _emulatorscfg="$configdir/$_system/emulators.cfg"
	local _mameini="/opt/retropie/configs/mame/mame.ini"
	local _basename_coreconfig="$configdir/$_system/retroarch-core-options.cfg.basename"
	local _add_config_basename="$_config.basename"

	# create retroarch configuration
	ensureSystemretroconfig "$_system"

	# ensure it works without softlists, using a custom per-fake-core config
        iniConfig " = " "\"" "$_custom_coreconfig"
        iniSet "mame_softlists_enable" "disabled"
	iniSet "mame_softlists_auto_media" "disabled"
	iniSet "mame_boot_from_cli" "disabled"

	# this will get loaded too via --append_config
	iniConfig " = " "\"" "$_add_config"
	iniSet "core_options_path" "$_custom_coreconfig"
	#iniSet "save_on_exit" "false"

	# set permissions for configurations
 	chown $user:$user "$_custom_coreconfig" 
 	chown $user:$user "$_add_config" 

	# setup rom folder
	mkRomDir "$_system"

	# ensure run_mess.sh script is executable
	chmod 755 "$_script"

	# add the emulators.cfg as normal, pointing to the above script
	addEmulator 1 "$md_id" "$_system" "$_script $_retroarch_bin $_mess $_config apple1 $biosdir -cass %ROM%"

	# add system to es_systems.cfg as normal
	addSystem "$_system" "$md_name" "$md_ext"
}
