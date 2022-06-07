{ config, lib, pkgs, ... }:

with lib;
{
  options = {
    modules = {
      dev = {
        tmux = {
          enabled = mkEnableOption "tmux";
        };
      };
    };
  };

  config = mkIf config.modules.dev.tmux.enabled {
    programs.tmux = {
      enable = true;
      shortcut = "a";
      sensibleOnTop = true;
      prefix = "C-a";
      shell = "${pkgs.fish}/bin/fish";
      keyMode = "vi";

      extraConfig = ''
        set -g mouse on
        set-window-option -g mode-keys vi

        unbind n
        unbind -T copy-mode-vi Space;
        unbind -T copy-mode-vi Enter;

        bind -T copy-mode-vi v send-keys -X begin-selection
        bind -T copy-mode-vi y send-keys -X copy-pipe-and-cancel "xsel --clipboard"

        bind h select-pane -L
        bind j select-pane -D
        bind k select-pane -U
        bind l select-pane -R

        bind v split-window -h
        bind s split-window -v

        bind m copy-mode

        bind S-Left previous-window
        bind S-Right next-window

        bind r source-file ~/.config/tmux/tmux.conf \; display "Reloaded ~/.tmux.conf"
        bind n command-prompt "rename-window '%%'"

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
