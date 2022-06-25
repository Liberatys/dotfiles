{ config, pkgs, lib, ... }:

with lib;

let
  doom-emacs = pkgs.callPackage
    (builtins.fetchTarball {
      url = https://github.com/nix-community/nix-doom-emacs/archive/master.tar.gz;
    })
    {
      doomPrivateDir = ../../configs/doom;
    };
in
{
  options = {
    modules = {
      editors = {
        emacs = {
          enabled = mkEnableOption "emacs";
        };
      };
    };
  };

  config = mkIf config.modules.editors.emacs.enabled {
    home.packages = [
      doom-emacs
      pkgs.graphviz
      pkgs.plantuml
    ];

    services = {
      emacs = {
        enable = true;
        package = doom-emacs;
      };
    };
  };
}
