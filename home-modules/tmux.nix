{ config, lib, pkgs, ... }:

with lib;
{
  options = {
    dotfiles.tmux.enabled = mkEnableOption "tmux";
  };

  config = mkIf config.dotfiles.tmux.enabled {
    programs.tmux = {
      enable = true;
      shortcut = "a";
      sensibleOnTop = true;
      shell = "${pkgs.fish}/bin/fish";
      keyMode = "vi";

      plugins = with pkgs; [
        pkgs.tmuxPlugins.gruvbox
        pkgs.tmuxPlugins.tmux-fzf
        pkgs.tmuxPlugins.fzf-tmux-url
      ];
    };
  };
}
