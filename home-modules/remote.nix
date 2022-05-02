{ config, pkgs, lib, ... }:

with lib;
{
  options = {
    dotfiles.remote.enabled = mkEnableOption "remote";
  };

  config = mkIf config.dotfiles.remote.enabled {

    home.packages = with pkgs; [
      remmina
    ];
  };
}
