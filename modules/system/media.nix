{ config, lib, pkgs, ... }:

with lib;
{
  options = {
    modules = {
      system = {
        media = {
          enabled = mkEnableOption "media";
        };
      };
    };
  };

  config = mkIf config.modules.system.media.enabled {
    home.packages = with pkgs; [
      # Audio
      mplayer

      # Clipboard
      xclip

      # Download/Loader
      curl
      wget

      # Video
      ffmpeg
      graphviz
      imagemagick
      ffmpegthumbnailer
      viu

      # PDF
      pdftk

      # ZIP
      unzip
      zip
      gnome.file-roller
    ];
  };
}
