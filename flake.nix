{
  description = "Env for Cyberpunk";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = { self, nixpkgs, flake-utils }:
    (flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          overlays = [ ];
        };
      in {
        devShell = pkgs.mkShell {
          buildInputs = with pkgs; [
            wineWowPackages.staging
            winetricks
            samba # for ntlm shenanigans
          ];
          WINEARCH="win64";
          WINEPREFIX="/home/nathan/.wine-cyberpunk2077"; # or W/E
          # winecfg # make prefix by running winecfg
          # install vkd3d-proton from https://github.com/HansKristian-Work/vkd3d-proton/releases/tag/v2.8 by running the script
          # wine64 ./setup_cyberpunk_2077_1.61_\(64bit\)_\(60064\).exe # then run the installer
          # winetricks win10 nocrashdialog fontsmooth=rgb sound=pulse # extra winetricks stuff from https://www.reddit.com/r/linux_gaming/comments/n9mtr0/burning_crusade_beta_classic_wine_errors/
          # cd ~/.wine-cyberpunk2077/dosdevices/c:/GOG Games/Cyberpunk 2077
          # env VKD3D_CONFIG=dxr11 VKD3D_FEATURE_LEVEL=12_1 WINEPREFIX="/home/nathan/.wine-cyberpunk2077" wine ../../users/Public/Desktop/Cyberpunk\ 2077.lnk 
          # (pulled from the desktop file) plus https://forum.manjaro.org/t/cyberpunk-2077-crashed-since-the-stable-update-2022-12-06/129153/2
        };
      }
    ));
}
