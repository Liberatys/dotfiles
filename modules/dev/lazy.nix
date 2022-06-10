{ config, lib, pkgs, ... }:

with lib;
{
  options = {
    modules = {
      dev = {
        lazy = {
          enabled = mkEnableOption "lazy";
        };
      };
    };
  };

  # All applications needed for devops operations / observation and work
  config = mkIf config.modules.dev.lazy.enabled {
    home.packages = with pkgs; [
      lazydocker
    ];

    programs = {
      lazygit = {
        enable = true;

        settings = {
          reporting = "off";
          notARepository = "create";
          gui = {
            splitDiff = "always";
            language = "en";
            sidePanelWidth = 0.3;
          };
          git = {
            commit = {
              signOff = true;
            };
            log = {
              showGraph = "always";
            };
          };
        };
      };
    };
  };
}
