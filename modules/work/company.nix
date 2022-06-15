{ config, lib, pkgs, ... }:

with lib;
{
  options = {
    modules = {
      work = {
        company = {
          enabled = mkEnableOption "company";
        };
      };
    };
  };

  config = mkIf config.modules.work.company.enabled {
    home.packages = with pkgs; [
      zoom-us
      slack
      libreoffice
      teams
    ];
  };
}
