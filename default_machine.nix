{ config, pkgs, ... }:

{
  hardware = {
    bluetooth = {
      enable = true;
    };

    opengl = {
      enable = true;
    };
  };

  environment.systemPackages = with pkgs; [
    neovim
    curl
    wget
    wpa_supplicant_gui
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
    videoDrivers = [ "displaylink" "modesetting" "nvidia" ];

    autoRepeatDelay = 200;
    autoRepeatInterval = 50;

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
