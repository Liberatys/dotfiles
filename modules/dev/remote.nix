{ config, pkgs, lib, ... }:

with lib;
{
  options = {
    modules = {
      dev = {
        remote = {
          enabled = mkEnableOption "remote";
        };
      };
    };
  };

  config = mkIf config.modules.dev.remote.enabled {

    home.packages = with pkgs; [
      remmina
      openfortivpn
      openvpn
    ];
  };
}
