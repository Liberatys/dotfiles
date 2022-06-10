{ config, lib, pkgs, ... }:

with lib;
{
  options = {
    modules = {
      dev = {
        languages = {
          go = {
            enabled = mkEnableOption "go";
          };
        };
      };
    };
  };

  config = mkIf config.modules.dev.languages.go.enabled {
    home.packages = with pkgs; [
      go
    ];
  };
}
