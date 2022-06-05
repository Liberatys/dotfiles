{ config, lib, pkgs, ... }:

with lib;
{
  options = {
    modules = {
      system = {
        security = {
          enabled = mkEnableOption "security";
        };
      };
    };
  };

  config = mkIf config.modules.system.security.enabled {
    home.packages = with pkgs; [
      veracrypt
    ];
  };
}
