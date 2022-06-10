{ config, lib, pkgs, ... }:

with lib;
{
  options = {
    modules = {
      dev = {
        languages = {
          nodejs = {
            enabled = mkEnableOption "nodejs";
          };
        };
      };
    };
  };

  config = mkIf config.modules.dev.languages.nodejs.enabled {
    home.packages = with pkgs; [
      nodePackages.npm
      yarn
    ];
  };
}
