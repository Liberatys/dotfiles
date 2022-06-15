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
      # Services
      gist
      # CI/CD
      # sem => https://github.com/NixOS/nixpkgs/pull/176928

      # Learning
      exercism

      # Workflow
      meld
    ];
  };
}
