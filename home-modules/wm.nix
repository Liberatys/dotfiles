{ config, lib, pkgs, ... }:

with lib;
let
  wallpaper = ../assets/wallpaper.jpg;
in
{

  imports = [
    ./rofi.nix
  ];

  options = {
    dotfiles.wm.enabled = mkEnableOption "wm";
  };

  config = mkIf config.dotfiles.wm.enabled {

    xsession = {
      enable = true;

      windowManager.i3 = rec {
        enable = true;
        package = pkgs.i3-gaps;
        config = {
          modifier = "Mod4";

          bars = [ ];

          gaps = {
            inner = 12;
            outer = 5;
            smartGaps = true;
            smartBorders = "off";
          };

          keybindings = import ./i3-keybindings.nix config.modifier;

          startup = [
            {
              command = "$HOME/.config/polybar/launch.sh";
              always = true;
              notification = false;
            }
          ];
        };
      };
    };

    home.file.".config/polybar".source = ../dotfiles/polybar;

    home.packages = with pkgs; [
      betterlockscreen
      i3blocks
      polybar
      dunst
      feh
      unclutter
      xautolock
      xfontsel
      xorg.xbacklight
      xorg.xev
      xorg.xkill
      keynav
      parcellite
      pasystray
      libnotify
      lxappearance
      playerctl
    ];
  };
}
