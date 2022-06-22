{ config, lib, pkgs, ... }:

with lib;
{
  options = {
    modules = {
      dev = {
        languages = {
          nix = {
            enabled = mkEnableOption "nix";
          };
        };
      };
    };
  };

  config = mkIf config.modules.dev.languages.nix.enabled {
    home.packages = with pkgs; [
      nix-prefetch
      patchelf
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
