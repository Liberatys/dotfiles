{ config, lib, pkgs, ... }:
{
  xdg.configFile."rofi/themes".source = ../themes/rofi;

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
