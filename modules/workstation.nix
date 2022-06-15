{ config, lib, pkgs, ... }:

with lib;

{
  options = {
    dotfiles.workstation.enabled = mkEnableOption "workstation";
  };
  config = mkIf config.dotfiles.workstation.enabled {
    fonts.fontconfig.enable = true;

    home.packages = with pkgs; [
      # Utility
      mplayer

      # Apps
      xclip
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
      curl
      dnsutils
      dos2unix
      ffmpeg
      file
      findutils
      gettext
      gnupg
      graphviz
      imagemagick
      iw
      mpv
      mtr
      multitail
      ncdu
      nload
      pandoc
      paperkey
      pdftk
      powerstat
      powertop
      pv
      pwgen
      sshfs
      units
      unzip
      up
      watch
      wget
      yq
      zbar
      zip
    ];

    programs = {
      direnv = {
        enable = true;
        nix-direnv.enable = true;
      };
    };

    services.redshift = {
      enable = true;
      temperature = {
        day = 4500;
        night = 2800;
      };

      provider = "geoclue2";
    };

    manual = {
      manpages = {
        enable = true;
      };
    };
  };
}
