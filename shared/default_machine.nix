{ config, pkgs, lib, ... }:

{
  imports = [
    ../nix/neovim-overlay.nix
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
    libyaml
    wget
    wpa_supplicant_gui
    alttab
  ];

  environment.variables = {
    EDITOR = "nvim";
    BROWSER = "firefox";
    VISUAL = "nvim";
  };

  services = {
    fwupd = {
      enable = true;
    };

    blueman = {
      enable = true;
    };

    fprintd = {
      enable = true;
    };

    xserver = {
      enable = true;
      autorun = true;
      xkbOptions = "caps:escape";
      videoDrivers = [ "displaylink" "modesetting" "nvidia" ];

      autoRepeatDelay = 200;
      autoRepeatInterval = 35;

      libinput = {
        enable = true;

        disableWhileTyping = true;
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
  };

  boot = {
    # TODO: Update LINUX-VERSION (EOF)
    kernelPackages = pkgs.linuxPackages_5_17;

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

  systemd = {
    services = {
      upower.enable = true;
      polybar.enable = true;
    };
  };
}
