{ config, pkgs, ... }:

{
  imports = [
    ./../../shared/common.nix
    ./../../shared/default_machine.nix
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

        "Renuo Wifi" = {
          pskRaw = "fa9191956f902ec4d9ed7c6531c522a66f32db6b53efa262274ccb3f245d3cc8";
        };

        "Liberat Phone" = {
          pskRaw = "fa9191956f902ec4d9ed7c6531c522a66f32db6b53efa262274ccb3f245d3cc8";
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
      workstation.enabled = true;
    };

    modules = {
      system = {
        admin = {
          enabled = true;
        };

        tooling = {
          enabled = true;
        };

        security = {
          enabled = true;
        };

        manage = {
          enabled = true;
        };

        home = {
          enabled = true;
        };
      };

      work = {
        company = {
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

        devops = {
          enabled = true;
        };

        terminal = {
          enabled = true;
        };

        web = {
          enabled = true;
        };

        lazy = {
          enabled = true;
        };

        remote = {
          enabled = true;
        };

        git = {
          enabled = true;
        };

        database = {
          enabled = true;
        };

        wm = {
          enabled = true;
        };

        tmux = {
          enabled = true;
        };

        languages = {
          ruby = {
            enabled = true;
          };

          c = {
            enabled = true;
          };

          rust = {
            enabled = true;
          };

          nodejs = {
            enabled = true;
          };

          nix = {
            enabled = true;
          };

          python = {
            enabled = true;
          };
        };

      };

      browsers = {
        qutebrowser = {
          enabled = true;
        };

        librewolf = {
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
