{ config, lib, pkgs, ... }:

with lib;
{
  options = {
    modules = {
      browsers = {
        librewolf = {
          enabled = mkEnableOption "librewolf";
        };
      };
    };
  };

  config = mkIf config.modules.browsers.librewolf.enabled {
    home.packages = with pkgs; [
      librewolf
    ];
  };
}
