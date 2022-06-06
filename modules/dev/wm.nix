{ config, lib, pkgs, ... }:

with lib;
{

  imports = [
    ./rofi.nix
  ];

  options = {
    modules = {
      dev = {
        wm = {
          enabled = mkEnableOption "wm";
        };
      };
    };
  };

  config = mkIf config.modules.dev.wm.enabled {

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
              command = "$HOME/.config/polybar/launch.sh --docky";
              always = true;
              notification = false;
            }
            {
              command = "nitrogen --restore";
              always = true;
              notification = false;
            }
            {
              command = "setxkbmap -option \"caps:escape\"";
              always = true;
              notification = false;
            }
          ];
        };
      };
    };

    home.file.".config/polybar".source = ../../configs/polybar;

    home.packages = with pkgs; [
      betterlockscreen
      i3blocks
      polybar
      dunst
      feh
      gnome.nautilus
      unclutter
      xautolock
      xfontsel
      xorg.xbacklight
      xorg.xev
      xorg.xkill
      keynav
      parcellite
      nitrogen
      pasystray
      libnotify
      lxappearance
      playerctl
    ];
  };
}
