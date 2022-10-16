#!/bin/bash
cd /home/pi/RetroPie/roms/wine/games/.installs/Spooky-Castle/
WINEDEBUG=-all LD_LIBRARY_PATH="/opt/retropie/supplementary/mesa/lib/" setarch linux32 -L /opt/retropie/emulators/wine/bin/wine "/home/pi/RetroPie/roms/wine/games/.installs/Spooky-Castle/Spooky_Castle.exe"