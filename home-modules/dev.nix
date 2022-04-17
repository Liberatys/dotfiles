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

    home.sessionVariables = {
      DIRENV_LOG_FORMAT = "";
      EDITOR = "nvim";
    };

    home.packages = with pkgs; [
      # Services
      gist
      kubectl
      awscli2

      # CLI / Terminal
      alacritty
      fzf
      so
      ranger
      exa
      cookiecutter
      bottom
      rclone
      ripgrep
      rsync
      mcfly
      nodePackages.zx

      # Workflow
      meld
      lazydocker
      lazygit
      gnumake

      # Documentation
      tealdeer
      texlive.combined.scheme-full

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
