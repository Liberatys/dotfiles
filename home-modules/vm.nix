{ config, lib, pkgs, ... }:

with lib;
{
  options = {
    dotfiles.vm.enabled = mkEnableOption "vm";
  };

  config = mkIf config.dotfiles.vm.enabled {
    home.packages = with pkgs; [
    ];
  };
}
