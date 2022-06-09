{ config, lib, pkgs, ... }:

with lib;

{
  options = {
    modules = {
      system = {
        manage = {
          enabled = mkEnableOption "manage";
        };
      };
    };
  };

  config = mkIf config.modules.system.manage.enabled {
    home.packages = with pkgs; [
      light
      brightnessctl
    ];
  };
}

