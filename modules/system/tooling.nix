{ config, lib, pkgs, ... }:

with lib;

{
  options = {
    modules = {
      system = {
        tooling = {
          enabled = mkEnableOption "tooling";
        };
      };
    };
  };
  config = mkIf config.modules.system.tooling.enabled {
    home.packages = with pkgs; [
      # Communication
      discord
      konversation
      weechat

      # Media
      flameshot

      # Files / Office
      zathura

      # Passwords
      _1password
      _1password-gui
      bitwarden
      bitwarden-cli

      # Fonts
      (pkgs.nerdfonts.override { fonts = [ "FiraCode" ]; })

      # Spelling
      aspell
      aspellDicts.en
      aspellDicts.en-computers
      aspellDicts.en-science
    ];
  };
}
