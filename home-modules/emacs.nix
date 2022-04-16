{ config, pkgs, lib, ... }:

with lib;

let
  doom-emacs = pkgs.callPackage (builtins.fetchTarball {
    url = https://github.com/nix-community/nix-doom-emacs/archive/master.tar.gz;
  }) {
    doomPrivateDir = ./doom.d;
  };
in
  {
    options = {
      dotfiles.emacs.enabled = mkEnableOption "emacs";
    };

    home.packages = [ doom-emacs ];

    services = {
      emacs = {
        enable = true;
      };
    };

    config = mkIf config.dotfiles.emacs.enabled {
      home.packages = with pkgs; [ neovim ];

      xdg.configFile = {
        doom = {
          source = ../dotfiles/doom;
          recursive = true;
        };
      };
    };
  }
