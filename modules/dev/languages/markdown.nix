{ config, lib, pkgs, ... }:

with lib;
{
  options = {
    modules = {
      dev = {
        languages = {
          markdown = {
            enabled = mkEnableOption "markdown";
          };
        };
      };
    };
  };

  config = mkIf config.modules.dev.languages.markdown.enabled {
    home.packages = with pkgs; [
      pandoc
      vale
      glow
    ];
  };
}
