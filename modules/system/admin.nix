{ config, lib, pkgs, ... }:

with lib;

{
  options = {
    modules = {
      system = {
        admin = {
          enabled = mkEnableOption "admin";
        };
      };
    };
  };

  config = mkIf config.modules.system.admin.enabled {
    home.packages = with pkgs; [
      pavucontrol
      wireshark
      arandr
      lshw
      guvcview
      yubikey-manager
      pinentry
    ];

    programs = {
      password-store = {
        enable = true;
      };
    };
  };
}
