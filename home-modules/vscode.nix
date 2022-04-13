{ config, lib, pkgs, ... }:

with lib;
{
  options = {
    dotfiles.vscode.enabled = mkEnableOption "vscode";
  };

  config = mkIf config.dotfiles.vscode.enabled {

    programs = {
      enable = true;

      userSettings = {
        "[nix]"."editor.tabSize" = 2;
      };

      keybindings = [
      ];

      extensions = with pkgs; [
        vscode-extensions.golang.go
        vscode-extensions.bbenoist.nix
        vscode-extensions.vscodevim.vim
        vscode-extensions.vspacecode.whichkey
      ];
    };
  };
}
