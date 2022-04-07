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
      email = "nick" + "" + ".flueckiger" + "@" + "renuo.ch";
    };

    time.timeZone = "Europe/Zurich";
    console.keyMap = "us";

    programs = {
      command-not-found = {
        enable = false;
      };
    };

    environment.pathsToLink = [ "/share/fish" ];

    services = {
      earlyoom = {
        enable = true;
        freeMemThreshold = 5;
      };

      autorandr = {
        enable = true;
      };

      # Discard unused space on the filesystem
      fstrim = {
        enable = true;
      };
    };

    hardware = {
      enableAllFirmware = true;
      enableRedistributableFirmware = true;
      pulseaudio = {
        enable = true;
      };

      firmware = [ pkgs.wireless-regdb ];
    };

    swapDevices = [{ device = "/swapfile"; size = 1024; }];

    nixpkgs = {
      config = {
        allowUnfree = true;
        allowBroken = true;
      };
    };

    users.extraUsers."${config.dotfiles.params.username}" = {
      home = "/home/${config.dotfiles.params.username}";
      isNormalUser = true;
      uid = 1000;
      extraGroups = [ "wheel" "networkmanager" ]
        ++ pkgs.lib.optional config.virtualisation.docker.enable "docker";
      shell = "${pkgs.fish}/bin/fish";
      passwordFile = "/etc/passwordFile-${config.dotfiles.params.username}"; # will be set during nixos-up
    };

    users.users.root.hashedPassword = "!";

    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;

      users."${config.dotfiles.params.username}" = {
        imports = [
          ./nix/dotfiles-params.nix
          ./home-modules/fish.nix
          ./home-modules/qutebrowser.nix
          ./home-modules/wm.nix
          ./home-modules/workstation.nix
          ./home-modules/git.nix
          ./home-modules/dev.nix
          ./home-modules/security.nix
          ./home-modules/admin.nix
          ./home-modules/mail.nix
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
