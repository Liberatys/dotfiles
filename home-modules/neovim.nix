{ config, pkgs, lib, ... }:

with lib;
{
  options = {
    dotfiles.nvim.enabled = mkEnableOption "nvim";
  };

  config = mkIf config.dotfiles.nvim.enabled {

    home.packages = with pkgs; [ neovim ];

    xdg.configFile = {
      nvim = {
        source = ../dotfiles/nvim;
        recursive = true;
      };
    };
  };
}
