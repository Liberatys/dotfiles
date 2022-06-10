{ config, lib, pkgs, ... }:

with lib;
{
  options = {
    modules = {
      dev = {
        web = {
          enabled = mkEnableOption "web";
        };
      };
    };
  };

  config = mkIf config.modules.dev.web.enabled {
    home.packages = with pkgs; [
      google-chrome
    ];
  };
}
