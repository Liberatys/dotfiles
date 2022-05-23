{ config, lib, pkgs, ... }:

with lib;

{
  options = {
    dotfiles.dev.enabled = mkEnableOption "dev";
  };
  config = mkIf config.dotfiles.dev.enabled {

    services = {
      lorri = {
        enable = true;
      };
    };

    programs = {
      taskwarrior = {
        enable = true;

        dataLocation = "~/notes/task";
      };
    };

    home.sessionVariables = {
      DIRENV_LOG_FORMAT = "";
      EDITOR = "nvim";
    };

    home.packages = with pkgs; [
      # Services
      gist
      awscli2

      # CLI / Terminal
      alacritty
      fzf
      so
      nnn
      exa
      cookiecutter
      bottom
      rclone
      ripgrep
      rsync
      mcfly
      nodePackages.zx
      pgcli
      wuzz

      # Workflow
      meld
      lazydocker
      lazygit
      gnumake

      # Documentation
      tealdeer
      texlive.combined.scheme-full
      texstudio

      # Communication
      konversation

      # Languages

      ## Javascript
      nodePackages.npm

      ## Ruby
      bundix

      ## Rust
      rustup
      crate2nix
      pkg-config

      # Markdown
      glow

      ## GO
      go

      # CC
      gcc

      ## Python
      python37
      python37Packages.virtualenv

      ## Nix
      nix-prefetch
      patchelf
      nix-top
      nix-prefetch-git
      node2nix
      nix-tree
      niv
      nixpkgs-fmt
      cachix
    ];
  };
}
