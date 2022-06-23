{ config, pkgs, lib, ... }:

with lib;
{
  options = {
    modules = {
      dev = {
        alacritty = {
          enabled = mkEnableOption "alacritty";
        };
      };
    };
  };

  config = mkIf config.modules.dev.alacritty.enabled {
    home.packages = with pkgs; [
    ];
  };
}
