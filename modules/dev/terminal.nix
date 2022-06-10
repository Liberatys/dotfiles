{ config, lib, pkgs, ... }:

with lib;
{
  options = {
    modules = {
      dev = {
        terminal = {
          enabled = mkEnableOption "terminal";
        };
      };
    };
  };

  config = mkIf config.modules.dev.terminal.enabled {
    home.packages = with pkgs; [
      # Applications
      alacritty

      # Services
      awscli2
      heroku

      # Files
      nnn
      exa

      # Tools
      rclone
      ripgrep
      rsync
      mcfly
      fzf

      # Dev-Tools
      gnumake

      # Documentation
      tealdeer
      zeal

      # Packages
      texlive.combined.scheme-full
      texstudio
    ];
  };
}
