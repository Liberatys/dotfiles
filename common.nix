{ config, pkgs, nodes, ... }:

with pkgs.lib;

{
  imports = [
    (import "${builtins.fetchTarball https://github.com/rycee/home-manager/archive/master.tar.gz}/nixos")
    (import "${builtins.fetchTarball https://github.com/NixOs/nixos-hardware/archive/master.tar.gz}/lenovo/thinkpad/x1-extreme/gen2")
    ./nix/dotfiles-params.nix
  ];

  options = { };

  config = {
    dotfiles.params = {
      username = "liberatys";
      fullname = "Nick Anthony Flueckiger";
      signature = "Nick <Liberatys> Flueckiger";
      email = "nick" + ".anthony" + ".flueckiger" + "@" + "hey.com";
    };

    time.timeZone = "Europe/Zurich";
    console.keyMap = "us";

    programs = {
      command-not-found = {
        enable = false;
      };

      gnupg.agent = {
        enable = true;
        enableSSHSupport = true;
      };
    };

    location = {
      provider = "geoclue2";
    };

    environment.pathsToLink = [ "/share/fish" ];

    hardware = {
      enableAllFirmware = true;
      enableRedistributableFirmware = true;
      pulseaudio = {
        enable = true;
      };

      firmware = [ pkgs.wireless-regdb ];
    };

    swapDevices = [{ device = "/swapfile"; size = 6144; }];

    nixpkgs = {
      config = {
        allowUnfree = true;
        allowBroken = true;
      };
    };

    nix = {
      trustedUsers = [ "root" "liberatys" ];
      allowedUsers = [ "@wheel" ];

      extraOptions = ''
        experimental-features = nix-command
      '';

      package = pkgs.nixUnstable;

      gc = {
        automatic = true;
        dates = "weekly";
      };

      autoOptimiseStore = true;
      buildCores = 4;
      maxJobs = 4;
    };

    security = {
      auditd = {
        enable = true;
      };

      sudo = {
        execWheelOnly = true;
      };

      audit = {
        enable = true;

        rules = [
          "-a exit,always -F arch=b64 -S execve"
        ];
      };
    };

    users.extraUsers."${config.dotfiles.params.username}" = {
      home = "/home/${config.dotfiles.params.username}";
      isNormalUser = true;
      uid = 1000;
      extraGroups = [ "wheel" "networkmanager" "docker" "wireshark" ]
        ++ pkgs.lib.optional config.virtualisation.docker.enable "docker";
      shell = "${pkgs.fish}/bin/fish";
      passwordFile = "/etc/passwordFile-${config.dotfiles.params.username}"; # will be set during nixos-up
    };

    services = {
      postgresql = {
        enable = true;
        package = pkgs.postgresql_11;
      };

      redis = {
        enable = true;
      };

      locate = {
        enable = true;
      };

      lorri = {
        enable = true;
      };

      clamav = {
        daemon = {
          enable = true;
        };

        updater = {
          enable = true;
        };
      };

      earlyoom = {
        enable = true;
        freeMemThreshold = 5;
      };

      udev.packages = [ pkgs.yubikey-personalization ];

      pcscd.enable = true;

      autorandr = {
        enable = true;
      };

      # Discard unused space on the filesystem
      fstrim = {
        enable = true;
      };
    };

    users.users.root.hashedPassword = "!";

    networking = {
      hostName = "liberatys";

      firewall = {
        enable = true;
      };
    };

    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;

      users."${config.dotfiles.params.username}" = {
        imports = [
          ./nix/dotfiles-params.nix
          ./modules/qutebrowser.nix
          ./modules/workstation.nix
          ./modules/git.nix
          ./modules/dev.nix
          ./modules/mail.nix
          ./modules/tmux.nix
          ./modules/remote.nix
          ./modules/devops.nix
          ./modules/company.nix
          ./modules/lazy.nix

          # System
          ./modules/system/security.nix
          ./modules/system/admin.nix

          # Dev
          ./modules/dev/fish.nix
          ./modules/dev/wm.nix

          # Editors
          ./modules/editors/emacs.nix
          ./modules/editors/neovim.nix
          ./modules/editors/vscode.nix
        ];

        dotfiles = {
          params = config.dotfiles.params;
        };

        news = {
          display = "silent";
        };
      };
    };
  };
}
