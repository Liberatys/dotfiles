{ config, lib, pkgs, ... }:

with lib;

{
  options = {
    dotfiles.workstation.enabled = mkEnableOption "workstation";
  };
  config = mkIf config.dotfiles.workstation.enabled {
    fonts.fontconfig.enable = true;

    home.packages = with pkgs; [
      # Screenshots / Video
      flameshot

      # Utility
      mplayer

      # Office
      zathura
      texstudio

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

      # Services
      gist
      slack
      slack-term
      zoom-us
      _1password
      bitwarden
      bitwarden-cli
      firefox

      # FONTS
      (pkgs.nerdfonts.override { fonts = [ "FiraCode" ]; })

      # CLI
      aspell
      aspellDicts.en
      aspellDicts.en-computers
      aspellDicts.en-science
      cookiecutter
      cpufrequtils
      cpulimit
      curl
      dnsutils
      dos2unix
      fd
      ffmpeg
      file
      findutils
      fzf
      gettext
      ghostscript
      gnupg
      graphviz
      htop
      imagemagick
      iw
      jq
      mpv
      mtr
      multitail
      ncdu
      nload
      nmap
      openssl
      pandoc
      paperkey
      pdftk
      powerstat
      powertop
      pv
      pwgen
      sqlite
      sshfs
      tree
      units
      unzip
      up
      watch
      weechat
      wget
      yq
      zbar
      zip
    ];

    programs.direnv = {
      enable = true;
      nix-direnv.enable = true;
    };

    manual.manpages.enable = true;

    home.file.".profile" = {
      text = ''
        export NIX_PATH=nixpkgs=${pkgs.path}
        export TMPDIR=/tmp
        export TMP=$TMPDIR
      '';
      executable = true;
    };
  };
}
