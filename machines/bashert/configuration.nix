{ config, pkgs, ... }:

{
  imports = [
    ./../../common.nix
    ./hardware-configuration.nix
  ];

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

  services.xserver = {
    videoDrivers = [ "intel" "nvidia" ];

    enable = true;

    desktopManager = {
      xterm = {
        enable = false;
      };
    };

    windowManager = {
      i3 = {
        enable = true;
      };
    };

    displayManager = {
      lightdm = {
        enable = true;
      };

      defaultSession = "none+i3";
    };
  };

  networking = {
    networkmanager = {
      enable = true;
    };
  };

  environment.systemPackages = with pkgs; [
    i3
  ];

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
}
