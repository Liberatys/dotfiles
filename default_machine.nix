{ config, pkgs, lib, ... }:

{
  imports = [
    ./nix/neovim-overlay.nix
  ];

  hardware = {
    bluetooth = {
      enable = true;
    };

    nvidia = {
      package = config.boot.kernelPackages.nvidiaPackages.stable;
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
    tpacpi-bat
    wget
    wpa_supplicant_gui
    asdf-vm
    alttab
  ];

  environment.variables = {
    EDITOR = "nvim";
    BROWSER = "librewolf";
    VISUAL = "emacs";
  };

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
        dates = "weekly";
      };
    };
  };

  services.xserver = {
    enable = true;
    autorun = true;
    xkbOptions = "caps:escape";
    videoDrivers = [ "displaylink" "modesetting" "nvidia" ];

    autoRepeatDelay = 200;
    autoRepeatInterval = 35;

    libinput = {
      enable = true;
    };

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


      sessionCommands = ''
        ${lib.getBin pkgs.xorg.xrandr}/bin/xrandr --setprovideroutputsource 2 0
      '';


      lightdm = {
        enable = true;

        greeter = {
          enable = true;
        };

        greeters = {
          mini = {
            enable = true;
            user = "liberatys";
            extraConfig = ''
              [greeter]
              show-password-label = true
              [greeter-theme]
              background-image = ""
            '';
          };
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
