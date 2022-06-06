{ config, lib, pkgs, ... }:

with lib;
{
  options = {
    modules = {
      editors = {
        vscode = {
          enabled = mkEnableOption "vscode";
        };
      };
    };
  };

  config = mkIf config.modules.editors.vscode.enabled {

    programs.vscode = {
      enable = true;

      userSettings = {
        "[nix]"."editor.tabSize" = 2;
      };

      keybindings = [
      ];

      extensions = with pkgs.vscode-extensions; [
        golang.go
        pkief.material-icon-theme
        yzhang.markdown-all-in-one
        ms-python.python
        editorconfig.editorconfig
        eamodio.gitlens
        dbaeumer.vscode-eslint
        james-yu.latex-workshop
        bbenoist.nix
        vscodevim.vim
        vspacecode.whichkey
        jdinhlife.gruvbox
        github.vscode-pull-request-github
        ms-azuretools.vscode-docker
      ];
    };
  };
}
