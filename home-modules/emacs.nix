{ config, pkgs, lib, ... }:

with lib;

let
  doom-emacs = pkgs.callPackage
    (builtins.fetchTarball {
      url = https://github.com/nix-community/nix-doom-emacs/archive/master.tar.gz;
    })
    {
      doomPrivateDir = ../dotfiles/doom;
    };
in
{
  options = {
    dotfiles.emacs.enabled = mkEnableOption "emacs";
  };

  config = mkIf config.dotfiles.emacs.enabled {
    home.packages = [ doom-emacs ];

    services = {
      emacs = {
        enable = true;
        package = doom-emacs;
      };
    };
  };
}
