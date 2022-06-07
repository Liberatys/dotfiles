{ config, lib, pkgs, ... }:

with lib;
{
  options = {
    modules = {
      dev = {
        git = {
          enabled = mkEnableOption "git";
        };
      };
    };
  };

  config = mkIf config.modules.dev.git.enabled {
    home.packages = with pkgs; [
      git-lfs
      gitAndTools.hub
      gitAndTools.gh
    ];

    programs.git = {
      enable = true;
      userName = config.dotfiles.params.username;
      userEmail = config.dotfiles.params.email;
      aliases = {
        co = "checkout";
        st = "status -sb";
        cs = "commit -s";
      };
      delta = {
        enable = true;

        options = {
          side-by-side = true;
        };
      };
      signing = {
        key = "0xFB1F2C864F01DA19";
      };
      ignores = [
        ".envrc"
        ".direnv"
        ".vscode"
      ];
      extraConfig = {
        init = {
          defaultBranch = "main";
        };
        core = {
          editor = "nvim";
        };
        "pull" = {
          ff = "only";
        };
        "commit" = {
          verbose = "true";
          gpgsign = true;
        };
        "filter \"lfs\"" = {
          process = "git-lfs filter-process";
          required = true;
          clean = "git-lfs clean -- %f";
          smudge = "git-lfs smudge -- %f";
        };
        hub = {
          protocol = "git";
        };
        advice = {
          detachedHead = false;
        };
      };
    };
  };
}
 
