
Run `nix develop` to drop into a shell with the needed wine and winetricks.
Make sure to have previously put the options
```
hardware.opengl.driSupport = true;
hardware.opengl.driSupport32Bit = true;
```
in your NixOS config to make sure you have Vulkan support installed in Mesa.

Then follow the comments. Reproduced here:
(replace nathan with your user, both in these commands and in the flake)
```
winecfg # make prefix by running winecfg
#install vkd3d-proton from https://github.com/HansKristian-Work/vkd3d-proton/releases/tag/v2.8 by running the script
wine64 ./setup_cyberpunk_2077_1.61_\(64bit\)_\(60064\).exe # then run the installer
winetricks win10 nocrashdialog fontsmooth=rgb sound=pulse # extra winetricks stuff from https://www.reddit.com/r/linux_gaming/comments/n9mtr0/burning_crusade_beta_classic_wine_errors/
cd ~/.wine-cyberpunk2077/dosdevices/c:/GOG Games/Cyberpunk 2077
env VKD3D_CONFIG=dxr11 VKD3D_FEATURE_LEVEL=12_1 WINEPREFIX="/home/nathan/.wine-cyberpunk2077" wine ../../users/Public/Desktop/Cyberpunk\ 2077.lnk 
```
