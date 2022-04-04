{ config, pkgs, nodes, ... }:

with pkgs.lib;

{
  imports = [
    ./nix/dotfiles-params.nix
    ./modules/x11.nix
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

    programs = {
      command-not-found = {
        enable = false;
      };
    };

    nix = {
      # Enable new nixos unified command
      extraOptions = ''
        extra-experimental-features = nix-command
      '';
    };

    boot = {
      cleanTmpDir = true;
    };

    services = {
      earlyoom = {
        enable = true;
        freeMemThreshold = 5;
      };

      # Discard unused space on the filesystem
      fstrim = {
        enable = true;
      };
    };

    users.extraUsers."${config.dotfiles.params.username}" = {
      home = "/home/${config.dotfiles.params.username}";
      isNormalUser = true;
      uid = 1000;
      extraGroups = [ "wheel" ]
        ++ pkgs.lib.optional config.virtualisation.docker.enable "docker"
        ++ pkgs.lib.optional config.networking.networkmanager.enable "networkmanager"
        ++ pkgs.lib.optional config.dotfiles.syncthing.enabled config.services.syncthing.group;
      shell = "${pkgs.fish}/bin/fish";
      openssh.authorizedKeys.keys = [
        config.dotfiles.params.sshKey
      ];
    };

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
        ];

        dotfiles.params = config.dotfiles.params;
        news.display = "silent";
      };
    };
  }
    }
