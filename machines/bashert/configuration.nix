{ config, pkgs, ... }:

{
  imports = [
    ./../../common.nix
    ./../../modules/x11.nix
    ./hardware-configuration.nix
  ];

  config = {
    services = {
      xserver = {
        videoDrivers = [ "nvidia" ];
      };

      # blueman = {
      #   enable = true;
      # };

      xserver = {
        displayManager = {
          setupCommands = ''
            ${pkgs.xorg.xrandr}/bin/xrandr \
            --output HDMI-0 --mode 3840x2160 --primary \
            --output DP-0 --mode 3840x2160 --right-of HDMI-0 \
            || true
          '';
        };
      };
    };

    # hardware = {
    #   bluetooth = {
    #     enable = true;
    #   };
    # };

    boot = {
      loader = {
        systemd-boot = {
          enable = true;
        };
        efi = {
          canTouchEfiVariables = true;
        };
      };
    };

    sound = {
      enable = true;
    };

    virtualisation = {
      docker = {
        enable = true;
        liveRestore = false;
        autoPrune = {
          enable = true;
        };
      };
    };

    networking = {
      wireless = {
        enable = true;

        userControlled = {
          enable = true;
        };
      };
    };

    home-manager.users."${config.dotfiles.params.username}" = {
      dotfiles = {
        dev.enabled = true;
        fish.enabled = true;
        git.enabled = true;
        qutebrowser.enabled = true;
        wm.enabled = true;
        workstation.enabled = true;
        security.enabled = true;
        admin.enabled = true;
      };
    };
  };
}
