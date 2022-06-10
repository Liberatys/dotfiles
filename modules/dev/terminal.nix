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
    programs = {
      taskwarrior = {
        enable = true;

        dataLocation = "~/notes/task";
      };
    };

    services = {
      lorri = {
        enable = true;
      };
    };

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
      so
      cookiecutter
      bottom
      nodePackages.zx
      pgcli
      wuzz

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
