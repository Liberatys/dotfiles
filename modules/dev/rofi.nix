{ config, lib, pkgs, ... }:
{
  home.file.".config/rofi/rofi.rasi".source = ../../themes/rofi/rofi.rasi;

  programs.rofi = {
    enable = true;

    extraConfig = {
      bw = 1;
      columns = 2;
    };

    font = "FiraCode Nerd Font 14";
    theme = "rofi";

    package = pkgs.rofi.override {
      plugins = [ pkgs.rofi-calc pkgs.rofi-emoji ];
    };
  };
}
