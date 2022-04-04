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

      # Development
      meld

      # Apps
      xclip
      xsel
      macchanger
      gthumb

      # Services
      gist
      slack
      whois
      zoom-us
      kubectl
      awscli2

      # FONTS
      (pkgs.nerdfonts.override { fonts = [ "FiraCode" ]; })

      # CLI
      aspell
      aspellDicts.en
      aspellDicts.en-computers
      aspellDicts.en-science
      bandwhich
      cookiecutter
      cpufrequtils
      cpulimit
      curl
      direnv
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

      # TERMINAL
      lazydocker
      lazygit
      nvim
      ranger
      rclone
      ripgrep
      rsync
      tmux

      # python
      python37
      python37Packages.virtualenv

      # nix
      nix-prefetch
      patchelf
      nix-top
      nix-tree
      niv
      nixpkgs-fmt
      cachix
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
