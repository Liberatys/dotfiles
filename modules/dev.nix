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
      # CI/CD
      # sem => https://github.com/NixOS/nixpkgs/pull/176928

      # Learning
      exercism

      # CLI / Terminal
      so
      cookiecutter
      bottom
      nodePackages.zx
      pgcli
      wuzz

      # Workflow
      meld

      # Communication
      konversation
      discord

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
      python37Packages.pip

      ## Nix
      nix-prefetch
      patchelf
      nix-top
      nix-prefetch-git
      nixpkgs-review
      node2nix
      nix-tree
      niv
      nixpkgs-fmt
      cachix
    ];
  };
}
