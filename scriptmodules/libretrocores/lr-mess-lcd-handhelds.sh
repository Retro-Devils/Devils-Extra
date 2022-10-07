#!/usr/bin/env bash

# This file is part of The RetroPie Project
#
# The RetroPie Project is the legal property of its developers, whose names are
# too numerous to list here. Please refer to the COPYRIGHT.md file distributed with this source.
#
# See the LICENSE.md file at the top-level directory of this distribution and
# at https://raw.githubusercontent.com/RetroPie/RetroPie-Setup/master/LICENSE.md
#


rp_module_id="lr-mess-lcd-handhelds"
rp_module_name="lcd-handhelds with mame-softlist support"
rp_module_ext=".cmd .zip .7z .7z .cue .fba .iso .zip .cdi .chd .gdi .sh"
rp_module_desc="Use lr-mess and mame emulator for all_in1 and load roms and software supported by the mame database"
rp_module_help="ROM Extensions: $rp_module_ext\n
Above extensions are included for compatibility between different media installs.\n\n
ROM extensions only supported by this install:\n
.cmd .zip .7z \n\n
Put games or game-BIOS files in :\n
$romdir/lcd-handhelds\n
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

function depends_lr-mess-lcd-handhelds() {
	local _mess=$(dirname "$md_inst")/lr-mess/mess_libretro.so
	if [[ ! -f "$_mess" ]]; then cd $HOME/RetroPie-Setup && sudo ./retropie_packages.sh lr-mess install_bin; fi
	if [[ ! -f $HOME/.mame/mame.ini ]]; then cd $HOME/RetroPie-Setup && sudo ./retropie_packages.sh lr-mame install_bin; fi
	if [[ ! -f /opt/retropie/libretrocores/lr-mame/mamearcade_libretro.so]]; then cd $HOME/RetroPie-Setup && sudo ./retropie_packages.sh mame install_bin; fi
}

function sources_lr-mess-lcd-handhelds() {
	true
}

function build_lr-mess-lcd-handhelds() {
	true
}


function install_lr-mess-lcd-handhelds() {
	true
}


function configure_install-lr-mess-lcd-handhelds() {
	local _retroarch_bin="$rootdir/emulators/retroarch/bin/retroarch"
	local _mess_core=$(dirname "$md_inst")/lr-mess/mamemess_libretro.so
	local _mame_core=$(dirname "$md_inst")/lr-mame/mamearcade_libretro.so
	local _system="all_in1"
	local _config="$configdir/$_system/retroarch.cfg"
	local _add_config_basename="$_config.add"
	local _emulatorscfg="$configdir/$_system/emulators.cfg"
	local _mameini="/opt/retropie/configs/mame/mame.ini"
	local _basename_coreconfig="$configdir/$_system/retroarch-core-options.cfg.basename"
	local _add_config_basename="$_config.basename"

if [[ non-arcade == non-arcade ]];then
	#plain command
	#(used for loading .cmd files, amongst others)
	addEmulator 0 "lr-mess-cmd" "$_system" "$_retroarch_bin --config $_config -v -L $_mess %ROM%"
	
	#plain commands
	#works on the pi
	#using single-quotes for loading lr-mess options
	#adding 2 rompaths if available 
	#lr-mess option -cfg_directory is not added, it should use the propper directory
	#
	#in order to save files we need to add the savepaths to retroarch as options
	#"-c -ui_active etc" is placed before "-rompath" and a / is added after the last rompath , this way the options are not added in the savestate filename
	#only issue after is that the savestate filename still contains 1 space in the beginning of the filename and double quotes
	#to fix this issue of double quotes the basename can be single quoted to remove them in the filename (we still have 1 space !) 
	#
	addEmulator 0 "lr-mess-basename" "$_system" "$_retroarch_bin --config $_config --appendconfig $_add_config_basename -S /home/pi/RetroPie/roms/$_system -s /home/pi/RetroPie/roms/$_system -v -L $_mess_core 'mame  -cfg_directory $configdir/$_system/lr-mess -c -ui_active -rompath /home/pi/RetroPie/BIOS/mame;/home/pi/RetroPie/roms/$_system/ '%BASENAME%''"
	addEmulator 0 "lr-mess-basename-autoframeskip" "$_system" "$_retroarch_bin --config $_config --appendconfig $_add_config_basename -S /home/pi/RetroPie/roms/$_system -s /home/pi/RetroPie/roms/$_system -v -L $_mess_core 'mame  -cfg_directory $configdir/$_system/lr-mess -c -ui_active -autoframeskip -rompath /home/pi/RetroPie/BIOS/mame;/home/pi/RetroPie/roms/$_system/ '%BASENAME%''"
	addEmulator 0 "lr-mess-basename-frameskip_10" "$_system" "$_retroarch_bin --config $_config --appendconfig $_add_config_basename -S /home/pi/RetroPie/roms/$_system -s /home/pi/RetroPie/roms/$_system -v -L $_mess_core 'mame  -cfg_directory $configdir/$_system/lr-mess -c -ui_active -frameskip 10 -rompath /home/pi/RetroPie/BIOS/mame;/home/pi/RetroPie/roms/$_system/ '%BASENAME%''"
	
	#tests for basename loaders using the run_mess script
	#works ok,but the .cmd files and savestate files are saved in /home/pi
	#-> turned off <-
	#(can be used, with adapted run_mess script, for .cmd file generation if needed)
	#addEmulator 0 "lr-run_mess-basename" "$_system" "$_script $_retroarch_bin $_mess_core $_config  $biosdir/mame\;/home/pi/RetroPie/roms/$_system -c -ui_active %BASENAME%"
	#addEmulator 0 "lr-run_mess-basename-autoframeskip" "$_system" "$_script $_retroarch_bin $_mess_core $_config  $biosdir/mame\;/home/pi/RetroPie/roms/$_system -c -ui_active -autoframeskip %BASENAME%"
	#addEmulator 0 "lr-run_mess-basename-frameskip_10" "$_system" "$_script $_retroarch_bin $_mess_core $_config  $biosdir/mame\;/home/pi/RetroPie/roms/$_system -c -ui_active -frameskip 10 %BASENAME%"
else
	#use lr-mame instead of lr-mess
	addEmulator 0 "lr-mame-basename" "$_system" "$_retroarch_bin --config $_config --appendconfig $_add_config_basename -S /home/pi/RetroPie/roms/$_system -s /home/pi/RetroPie/roms/$_system -v -L $_mame_core 'mame  -cfg_directory $configdir/$_system/lr-mame -c -ui_active -rompath /home/pi/RetroPie/BIOS/mame;/home/pi/RetroPie/roms/$_system/ '%BASENAME%''"
	addEmulator 0 "lr-mame-basename-autoframeskip" "$_system" "$_retroarch_bin --config $_config --appendconfig $_add_config_basename -S /home/pi/RetroPie/roms/$_system -s /home/pi/RetroPie/roms/$_system -v -L $_mame_core 'mame  -cfg_directory $configdir/$_system/lr-mame -c -ui_active -autoframeskip -rompath /home/pi/RetroPie/BIOS/mame;/home/pi/RetroPie/roms/$_system/ '%BASENAME%''"
	addEmulator 0 "lr-mame-basename-frameskip_10" "$_system" "$_retroarch_bin --config $_config --appendconfig $_add_config_basename -S /home/pi/RetroPie/roms/$_system -s /home/pi/RetroPie/roms/$_system -v -L $_mame_core 'mame  -cfg_directory $configdir/$_system/lr-mame -c -ui_active -frameskip 10 -rompath /home/pi/RetroPie/BIOS/mame;/home/pi/RetroPie/roms/$_system/ '%BASENAME%''"
fi

	addEmulator 0 "mame-basename" "$_system" "/opt/retropie/emulators/mame/mame -rompath /home/pi/RetroPie/BIOS/mame\;/home/pi/RetroPie/roms/$_system -v -c -ui_active -statename $_system/%BASENAME%  $([[ $_system == *90º ]]&&echo "-rol") %BASENAME%"
	addEmulator 0 "mame-basename-autoframeskip" "$_system" "/opt/retropie/emulators/mame/mame -rompath /home/pi/RetroPie/BIOS/mame\;/home/pi/RetroPie/roms/$_system -v -c -ui_active -statename $_system/%BASENAME% -autoframeskip  $([[ $_system == *90º ]]&&echo "-rol") %BASENAME%"
	addEmulator 0 "mame-basename-frameskip_10" "$_system" "/opt/retropie/emulators/mame/mame -rompath /home/pi/RetroPie/BIOS/mame\;/home/pi/RetroPie/roms/$_system -v -c -ui_active -statename $_system/%BASENAME% -frameskip 10  $([[ $_system == *90º ]]&&echo "-rol") %BASENAME%"

	# add system to es_systems.cfg
	#the line used by @valerino didn't work for the original RetroPie-setup 
	#therefore the information is added in a different way
	#the system name is also used as description because, for example, handhelds are generated with game system names
	addSystem "$_system" "all_in1" ".cmd .zip .7z .7z .cue .fba .iso .zip .cdi .chd .gdi .sh"

	#sort the emulators.cfg file
	sort -o $_emulatorscfg $_emulatorscfg
	#if containing a default line then remember the default line,
	#delete it, remove the empty line and put it back at the end of the file
	cat $_emulatorscfg|while read line
	do if [[ $line == default* ]]; then 
	sed -i "s/$line//g" $_emulatorscfg
	#https://stackoverflow.com/questions/16414410/delete-empty-lines-using-sed
	sed -i -r "/^\s*$/d" $_emulatorscfg
	echo $line >> $_emulatorscfg
	fi
	done
	chown $user:$user "$_emulatorscfg"
	
	# using a custom per-fake-core config for basename loaders using softlist
	iniConfig " = " "\"" "$_basename_coreconfig"
	iniSet "mame_boot_from_cli" "enabled"
        iniSet "mame_mouse_enable" "enabled"

	# this will get loaded too via --appendconfig
	iniConfig " = " "\"" "$_add_config_basename"
	iniSet "core_options_path" "$_basename_coreconfig"
	[[ $_system == *90º ]]&&iniSet "screen_orientation" "3"

	# set permissions for configurations
 	chown $user:$user "$_basename_coreconfig" 
 	chown $user:$user "$_add_config_basename" 

	#added for test
	local _add_config="$_config.add"
	local _custom_coreconfig="$configdir/$_system/custom-core-options.cfg"
	local _script="$scriptdir/scriptmodules/run_mess.sh"
    
	mkRomDir "$_system"
	ensureSystemretroconfig "$_system"
    
	echo "enable cheats in $configdir/all/retroarch-core-options.cfg"
	iniConfig " = " "\"" "$configdir/all/retroarch-core-options.cfg"
	iniSet "mame_cheats_enable" "enabled"
	chown $user:$user "$configdir/all/retroarch-core-options.cfg"

	echo "enable cheats for mame in /opt/retropie/configs/mame/mame.ini"    
	iniConfig " " "" "$_mameini"
	iniSet "cheatpath"  "$romdir/mame/cheat"
	iniSet "cheat" "1"
	chown $user:$user "$_mameini"

	echo "enable translation ai_service for RetroArch in $configdir/all/retroarch.cfg"
	iniConfig " = " "\"" "$configdir/all/retroarch.cfg"
	iniSet "ai_service_enable" "true"
	iniSet "ai_service_mode" "0"
	iniSet "ai_service_pause" "true"
	iniSet "ai_service_source_lang" "0"
	iniSet "ai_service_target_lang" "1"
	iniSet "ai_service_url" "http://ztranslate.net/service?api_key=HEREISMYKEY"
	iniSet "input_ai_service" "t"
	iniSet "#input_ai_service_btn" "11"
	chown $user:$user "$configdir/all/retroarch.cfg"
}

