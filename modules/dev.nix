{ config, lib, pkgs, ... }:

with lib;

{
  options = {
    dotfiles.dev.enabled = mkEnableOption "dev";
  };
  config = mkIf config.dotfiles.dev.enabled {

    home.sessionVariables = {
      DIRENV_LOG_FORMAT = "";
      EDITOR = "nvim";
    };

    home.packages = with pkgs; [
      # Learning
      exercism
      # Workflow
      meld
    ];
  };
}
