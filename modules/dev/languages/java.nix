{ config, lib, pkgs, ... }:

with lib;
{
  options = {
    modules = {
      dev = {
        languages = {
          java = {
            enabled = mkEnableOption "java";
          };
        };
      };
    };
  };

  config = mkIf config.modules.dev.languages.java.enabled {
    home.packages = with pkgs; [
      jd-gui
      jdk
    ];
  };
}
