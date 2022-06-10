{ config, lib, pkgs, ... }:

with lib;
{
  options = {
    modules = {
      dev = {
        languages = {
          rust = {
            enabled = mkEnableOption "rust";
          };
        };
      };
    };
  };

  config = mkIf config.modules.dev.languages.rust.enabled {
    home.packages = with pkgs; [
      rustup
      crate2nix
      pkg-config
    ];
  };
}
