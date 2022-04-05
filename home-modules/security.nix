{ config, lib, pkgs, ... }:

with lib;
{
  options = {
    dotfiles.security.enabled = mkEnableOption "security";
  };

  config = mkIf config.dotfiles.security.enabled {
    home.packages = with pkgs; [
      veracrypt
    ];
  };
}
