{ config, lib, pkgs, ... }:

with lib;

{
  options = {
    dotfiles.x11.enabled = mkEnableOption "x11";
  };

  config = mkIf config.dotfiles.x11.enabled {
    environment.systemPackages = [ pkgs.arandr ];
    services.xserver = {
      libinput.enable = true;

      layout = "us";
      dpi = 240;
      enable = true;
      autorun = true;

      desktopManager.xterm.enable = true;

      displayManager = {
        lightdm = {
          enable = true;
          greeter.enable = false;
        };

        defaultSession = "none+i3";
      };
      xkbOptions = "caps:escape";
    };
  };
}
