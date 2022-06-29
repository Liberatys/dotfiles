{ config, lib, pkgs, ... }:

with lib;

{
  options = {
    dotfiles.workstation.enabled = mkEnableOption "workstation";
  };
  config = mkIf config.dotfiles.workstation.enabled {
    home.packages = with pkgs; [
      # Utility

      # Apps
      xsel
      macchanger
      gthumb

      # TOOLS
      whois
      bandwhich
      s-tui
      entr

      # CLI
      cookiecutter
      cpufrequtils
      cpulimit
      dnsutils
      dos2unix
      file
      findutils
      gettext
      gnupg
      iw
      mpv
      mtr
      multitail
      ncdu
      nload
      paperkey
      powerstat
      powertop
      pv
      pwgen
      sshfs
      units
      up
      watch
      yq
      zbar
    ];
  };
}
