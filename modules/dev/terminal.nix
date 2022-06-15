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
      ack
      bottom
      cookiecutter
      fzf
      mcfly
      nodePackages.zx
      pgcli
      rclone
      ripgrep
      rsync
      so
      wuzz
      fd
      jq
      tree

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
