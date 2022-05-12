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
      prefix = "C-a";
      shell = "${pkgs.fish}/bin/fish";
      keyMode = "vi";

      extraConfig = ''
        set -g mouse on

        bind h select-pane -L
        bind j select-pane -D
        bind k select-pane -U
        bind l select-pane -R

        bind v split-window -h
        bind s split-window -v


        bind q killp
      '';

      plugins = with pkgs; [
        pkgs.tmuxPlugins.gruvbox
        pkgs.tmuxPlugins.tmux-fzf
        pkgs.tmuxPlugins.fzf-tmux-url
        pkgs.tmuxPlugins.extrakto
      ];
    };
  };
}
