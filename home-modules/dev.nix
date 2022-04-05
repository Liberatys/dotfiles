{ config, lib, pkgs, ... }:

with lib;

{
  options = {
    dotfiles.dev.enabled = mkEnableOption "dev";
  };
  config = mkIf config.dotfiles.dev.enabled {
    home.packages = with pkgs; [

      # Services
      gist
      kubectl
      awscli2

      # CLI / Terminal
      alacritty
      fzf
      neovim
      ranger
      rclone
      ripgrep
      rsync
      tmux

      # Workflow
      meld
      lazydocker
      lazygit
      make

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
