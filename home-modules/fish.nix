{ config, lib, pkgs, ... }:

with lib;
{
  options = {
    dotfiles.fish.enabled = mkEnableOption "fish";
  };

  config = mkIf config.dotfiles.fish.enabled {
    home.packages = [
      pkgs.zoxide
      pkgs.any-nix-shell
    ];

    programs.fish = {
      enable = true;

      shellAliases = {
        # General
        "l" = "exa -a --icons --colour always";

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

        # Building
        "cb" = "cargo build";
        "cr" = "cargo run";

        # Testing
        "ber" = "bundle exec rspec";

        # Git
        "lg" = "lazygit";
        "gl" = "git pull";
        "gp" = "git push";
        "gcs" = "git commit -s";

        # Operations
        "ld" = "lazydocker";
        "tr" = "terraform";
      };
      shellAbbrs = {
        g = "git";
        d = "docker";
        k = "kubectl";
        p = "podman";
      };
      shellInit = ''
        zoxide init fish | source
        mcfly init fish | source
        any-nix-shell fish --info-right | source
        direnv hook fish | source
        kubectl completion fish | source

        set -x dr '--dry-run=client -o yaml'
        set -x fd '--force --grace-period=0'
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
