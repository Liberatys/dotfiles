{ config, lib, pkgs, ... }:

with lib;
{
  options = {
    modules = {
      dev = {
        languages = {
          ruby = {
            enabled = mkEnableOption "ruby";
          };
        };
      };
    };
  };

  config = mkIf config.modules.dev.languages.ruby.enabled {
    home.packages = with pkgs; [
    ];
  };
}
