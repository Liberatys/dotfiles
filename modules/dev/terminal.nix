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

      direnv = {
        enable = true;

        nix-direnv = {
          enable = true;
        };
      };

      nnn = {
        enable = true;
      };

      alacritty = {
        enable = true;

        settings = {
          import = [
            # TODO: Replace with xdg path
            "${config.xdg.configHome}/alacritty/theme.yml"
          ];
        };
      };
    };

    manual = {
      manpages = {
        enable = true;
      };
    };

    services = {
      lorri = {
        enable = true;
      };

      redshift = {
        enable = true;
        temperature = {
          day = 4500;
          night = 2800;
        };

        provider = "geoclue2";
      };
    };

    home.packages = with pkgs; [
      # Applications
      # Services
      awscli2
      heroku

      # Files
      exa

      # Tools
      ack
      bottom
      s-tui
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
