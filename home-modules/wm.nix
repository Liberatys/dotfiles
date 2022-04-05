{ config, lib, pkgs, ... }:

with lib;
let
  wallpaper = ../assets/wallpaper.jpg;
in
{
  options = {
    dotfiles.wm.enabled = mkEnableOption "wm";
  };

  config = mkIf config.dotfiles.wm.enabled {
    home.packages = with pkgs; [
      betterlockscreen
      i3blocks
      dunst
      feh
      rofi
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

    xsession = {
      windowManager = {
        i3 = {
          enable = true;
          package = pkgs.i3-gaps;

          config = rec {
            modifier = "Mod4";
            startup = [
              {
                command = "exec i3-msg workspace 1";
                always = true;
                notification = false;
              }
            ];
          };

        };
      };
    };
  };
}
