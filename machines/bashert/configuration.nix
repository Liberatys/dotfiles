{ config, pkgs, ... }:

{
  imports = [
    ./../../common.nix
    ./../../default_machine.nix
    ./hardware-configuration.nix
  ];

  networking = {
    useDHCP = false;
    interfaces.wlp9s0.useDHCP = true;
    wireless = {
      networks = {
        Ocean = {
          pskRaw = "85ea6bbccb6b4cc2f7e18306b3f499d747ff80d446fa1dc7ef670a1e0174096e";
        };
      };
      enable = true;
      userControlled = {
        enable = true;
      };
    };
  };

  home-manager.users."${config.dotfiles.params.username}" = {
    dotfiles = {
      dev.enabled = true;
      git.enabled = true;
      qutebrowser.enabled = true;
      remote.enabled = true;
      devops.enabled = true;
      workstation.enabled = true;
      company.enabled = true;
      lazy.enabled = true;
    };

    modules = {
      system = {
        admin = {
          enabled = true;
        };

        security = {
          enabled = true;
        };
      };

      admin = {
        mail = {
          enabled = true;
        };
      };

      dev = {
        fish = {
          enabled = true;
        };

        wm = {
          enabled = true;
        };

        tmux = {
          enabled = true;
        };
      };

      editors = {
        emacs = {
          enabled = true;
        };

        vscode = {
          enabled = false;
        };

        nvim = {
          enabled = true;
        };
      };
    };
  };
}
