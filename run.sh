#!/usr/bin/env bash
nix develop -c bash -c 'cd ~/.wine-cyberpunk2077/dosdevices/c:/GOG\ Games/Cyberpunk\ 2077 && env VKD3D_CONFIG=dxr11 VKD3D_FEATURE_LEVEL=12_1 WINEPREFIX="/home/nathan/.wine-cyberpunk2077" wine ../../users/Public/Desktop/Cyberpunk\ 2077.lnk'
