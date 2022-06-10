{ config, lib, pkgs, ... }:

with lib;
{
  options = {
    modules = {
      dev = {
        languages = {
          c = {
            enabled = mkEnableOption "c";
          };
        };
      };
    };
  };

  config = mkIf config.modules.dev.languages.c.enabled {
    home.packages = with pkgs; [
      gcc
    ];
  };
}
