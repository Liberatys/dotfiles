{ config, pkgs, nodes, ... }:

with pkgs.lib;

{
  imports = [
    (import "${builtins.fetchTarball https://github.com/rycee/home-manager/archive/master.tar.gz}/nixos")
    (import "${builtins.fetchTarball https://github.com/NixOs/nixos-hardware/archive/master.tar.gz}/lenovo/thinkpad/x1-extreme/gen2")
    ../nix/dotfiles-params.nix
  ];

  options = { };

  config = {
    dotfiles.params = {
      username = "liberatys";
      fullname = "Liberatys";
      signature = "Liberatys";
      email = "liberatys" + "@" + "hey.com";
    };

    time = {
      timeZone = "Europe/Zurich";
    };

    console = {
      keyMap = "us";
    };

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

    environment = {
      pathsToLink = [ "/share/fish" ];
    };

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
        experimental-features = nix-command flakes
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

      logind = {
        lidSwitch = "suspend";
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
          ../nix/dotfiles-params.nix
          ../modules/workstation.nix
          ../modules/dev.nix

          # System
          ../modules/system/security.nix
          ../modules/system/admin.nix
          ../modules/system/manage.nix
          ../modules/system/home.nix
          ../modules/system/tooling.nix

          # Admin
          ../modules/admin/mail.nix

          # Dev
          ../modules/dev/fish.nix
          ../modules/dev/wm.nix
          ../modules/dev/tmux.nix
          ../modules/dev/database.nix
          ../modules/dev/git.nix
          ../modules/dev/web.nix
          ../modules/dev/remote.nix
          ../modules/dev/lazy.nix
          ../modules/dev/devops.nix
          ../modules/dev/terminal.nix

          ## Dev - Languages
          ../modules/dev/languages/c.nix
          ../modules/dev/languages/go.nix
          ../modules/dev/languages/rust.nix
          ../modules/dev/languages/nodejs.nix
          ../modules/dev/languages/python.nix
          ../modules/dev/languages/ruby.nix
          ../modules/dev/languages/nix.nix

          # work
          ../modules/work/company.nix

          # Browsers
          ../modules/browsers/qutebrowser.nix
          ../modules/browsers/librewolf.nix

          # Editors
          ../modules/editors/emacs.nix
          ../modules/editors/neovim.nix
          ../modules/editors/vscode.nix
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
