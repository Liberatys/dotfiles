{ config, pkgs, ... }:

{
  imports = [
    ./nix/neovim-overlay.nix
  ];

  hardware = {
    bluetooth = {
      enable = true;
    };

    opengl = {
      enable = true;
    };

    pulseaudio = {
      enable = true;
    };
  };

  environment.systemPackages = with pkgs; [
    curl
    wget
    wpa_supplicant_gui
    asdf-vm
  ];

  services = {
    fwupd = {
      enable = true;
    };
    blueman = {
      enable = true;
    };
  };

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;

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
    libinput = {
      enable = true;
    };

    enable = true;
    autorun = true;
    xkbOptions = "caps:escape";

    desktopManager = {
      xterm = {
        enable = false;
      };
    };

    displayManager = {
      session = [
        {
          manage = "desktop";
          name = "xsession";
          start = ''exec $HOME/.xsession'';
        }
      ];

      lightdm = {
        enable = true;
        greeters = {
          pantheon = {
            enable = true;
          };

          gtk = {
            enable = false;
          };
        };

        greeter = {
          enable = true;
        };
      };
    };
  };

  systemd = {
    services = {
      upower.enable = true;
      polybar.enable = true;
    };
  };
}
