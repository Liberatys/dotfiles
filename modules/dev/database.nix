{ config, lib, pkgs, ... }:

with lib;
{
  options = {
    modules = {
      dev = {
        database = {
          enabled = mkEnableOption "database";
        };
      };
    };
  };

  config = mkIf config.modules.dev.database.enabled {
    home.packages = [
      pkgs.beekeeper-studio
    ];
  };
}
