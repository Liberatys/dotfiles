{ config, lib, pkgs, ... }:
let
  color1 = "#162025";
  color2 = "#662b37";
  color3 = "#bfbfbf";

in
{
  programs.rofi = {
    enable = true;

    extraConfig = {
      bw = 1;
      columns = 2;
    };

    font = "Fira Code 12";

    package = pkgs.rofi.override {
      plugins = [ pkgs.rofi-calc pkgs.rofi-emoji ];
    };
  };
}
