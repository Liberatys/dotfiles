{ config, lib, pkgs, ... }:

with lib;

{
  options = {
    modules = {
      system = {
        home = {
          enabled = mkEnableOption "home";
        };
      };
    };
  };
  config = mkIf config.modules.system.home.enabled {

    home.sessionVariables = {
      DIRENV_LOG_FORMAT = "";
      EDITOR = "nvim";
    };
  };
}
