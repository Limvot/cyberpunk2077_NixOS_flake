#!/usr/bin/env bash
#abbriviated from the classic https://stackoverflow.com/questions/59895/how-do-i-get-the-directory-where-a-bash-script-is-located-from-within-the-script
cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null
nix develop -c bash -c 'cd ~/.wine-cyberpunk2077/dosdevices/c:/GOG\ Games/Cyberpunk\ 2077 && env VKD3D_CONFIG=dxr11 VKD3D_FEATURE_LEVEL=12_1 WINEPREFIX="/home/nathan/.wine-cyberpunk2077" wine ../../users/Public/Desktop/Cyberpunk\ 2077.lnk'
