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

    home.packages = with pkgs; [

      # Services
      gist
      kubectl
      awscli2

      # CLI / Terminal
      alacritty
      fzf
      ranger
      rclone
      ripgrep
      rsync
      mcfly

      # Workflow
      meld
      lazydocker
      lazygit
      gnumake

      # Documentation
      tealdeer

      # Languages

      ## Ruby
      bundix

      ## Rust
      rustup

      ## GO
      go

      ## Python
      python37
      python37Packages.virtualenv

      ## Nix
      nix-prefetch
      patchelf
      nix-top
      nix-tree
      niv
      nixpkgs-fmt
      cachix
    ];
  };
}
