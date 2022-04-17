{ config, lib, pkgs, ... }:

with lib;

{
  options = {
    dotfiles.admin.enabled = mkEnableOption "admin";
  };
  config = mkIf config.dotfiles.admin.enabled {
    home.packages = with pkgs; [
      pavucontrol
      arandr
      lshw
      guvcview
    ];
  };
}
