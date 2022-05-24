{ config, lib, pkgs, ... }:

with lib;
{
  options = {
    dotfiles.company.enabled = mkEnableOption "company";
  };

  config = mkIf config.dotfiles.company.enabled {
    home.packages = with pkgs; [
      zoom-us
      slack
      slack-term
    ];
  };
}
