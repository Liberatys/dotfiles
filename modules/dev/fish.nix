{ config, lib, pkgs, ... }:

with lib;
{
  options = {
    modules = {
      dev = {
        fish = {
          enabled = mkEnableOption "fish";
        };
      };
    };
  };

  config = mkIf config.modules.dev.fish.enabled {
    home.packages = [
      pkgs.zoxide
      pkgs.any-nix-shell
    ];

    programs.fish = {
      enable = true;

      shellAliases = {
        # General
        "l" = "exa -a --icons --colour always";
        "docker-compose" = "docker compose";

        "nbuild" = "nix-build -E 'with import <nixpkgs> {}; callPackage ./default.nix {}'";

        # Editing
        "e" = "nvim";
        "f" = "emacsclient -c";

        # Navigation
        ".." = "cd ..";
        "..." = "cd ../../";
        "...." = "cd ../../../";
        "....." = "cd ../../../../";
        "j" = "z";

        # Notes
        "nn" = "cd $HOME/notes";
        "ne" = "cd $HOME/notes/README.org";
        "np" = "push-notes";

        # Mail
        "nm" = "neomutt";
        "ns" = "mbsync --all";

        # Building
        "cb" = "cargo build";
        "cr" = "cargo run";

        # Testing
        "ber" = "bundle exec rspec";

        "ts" = "tmux ls";
        "ta" = "tmux attach";

        # Git
        "lg" = "lazygit";
        "gl" = "git pull";
        "gp" = "git push";
        "gcs" = "git commit -s";
        "gd" = "git diff";
        "gpn" = "git push --no-verify";
        "gco" = "git checkout -b";

        "dkill" = "docker kill $(docker container ls -q)";

        # Java
        "gw" = "./gradlew";

        # Operations
        "ld" = "lazydocker";
        "tr" = "terraform";
      };
      shellAbbrs = {
        g = "git";
        d = "docker";
        k = "kubectl";
        p = "podman";
        t = "tmux";
      };
      shellInit = ''
        zoxide init fish | source
        mcfly init fish | source
        any-nix-shell fish --info-right | source
        direnv hook fish | source
        kubectl completion fish | source

        set -x dr '--dry-run=client -o yaml'
        set -x fd '--force --grace-period=0'

        set -x FONTAWESOME_NPM_AUTH_TOKEN ' '

        set -x NIXPKGS_ALLOW_UNFREE 1
        set -x PASSWORD_STORE_DIR $HOME/dotfiles/configs/password-store

        set -x GPG_TTY (tty)
        set -x SSH_AUTH_SOCK (gpgconf --list-dirs agent-ssh-socket)
        gpgconf --launch gpg-agent
      '';
      interactiveShellInit = ''
        fish_add_path $HOME/.cargo/bin
        fish_add_path $HOME/dotfiles/scripts
      '';
      plugins = [
        { name = "fish-pure"; src = pkgs.fishPlugins.pure; }
        { name = "done"; src = pkgs.fishPlugins.done; }
        { name = "fzf"; src = pkgs.fishPlugins.fzf-fish; }
      ];
    };
  };
}
