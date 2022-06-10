{ config, lib, pkgs, ... }:

with lib;
{
  options = {
    modules = {
      dev = {
        languages = {
          python = {
            enabled = mkEnableOption "python";
          };
        };
      };
    };
  };

  config = mkIf config.modules.dev.languages.python.enabled {
    home.packages = with pkgs; [
      python37
      python37Packages.virtualenv
      python37Packages.pip
    ];
  };
}
