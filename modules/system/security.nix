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
      gnome.seahorse
      cryptsetup
    ];

    home.file.".gnupg/gpg.conf".source = ../../configs/gpg/gpg.conf;
    home.file.".gnupg/gpg-agent.conf".source = ../../configs/gpg/gpg-agent.conf;
  };
}
