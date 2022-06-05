{ config, pkgs, lib, ... }:

with lib;
{
  options = {
    modules = {
      editors = {
        nvim = {
          enabled = mkEnableOption "nvim";
        };
      };
    };
  };

  config = mkIf config.modules.editors.nvim.enabled {

    home.packages = with pkgs; [ neovim ];

    xdg.configFile = {
      nvim = {
        source = ../../configs/nvim;
        recursive = true;
      };
    };
  };
}
