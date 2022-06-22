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
      htop
      wireshark
      nmap
      openssl
      openconnect
      arandr
      lshw
      nix-index
      nix-tree
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
