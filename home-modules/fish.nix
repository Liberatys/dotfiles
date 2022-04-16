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
        ".." = "cd ..";
        "..." = "cd ../../";
        "...." = "cd ../../../";
        "....." = "cd ../../../../";
        "ber" = "bundle exec rspec";
        "cb" = "cargo build";
        "cr" = "cargo run";
        "e" = "nvim";
        "gcs" = "git commit -s";
        "gl" = "git pull";
        "gp" = "git push";
        "j" = "z";
        "l" = "exa -a --icons --colour always";
        "ld" = "lazydocker";
        "lg" = "lazygit";
      };
      shellAbbrs = {
        g = "git";
      };
      shellInit = ''
        zoxide init fish | source
        mcfly init fish | source
        any-nix-shell fish --info-right | source
        direnv hook fish | source
      '';
      interactiveShellInit = ''
        fish_add_path $HOME/.cargo/bin
      '';
      plugins = [
        { name = "fish-pure"; src = pkgs.fishPlugins.pure; }
        { name = "done"; src = pkgs.fishPlugins.done; }
        { name = "fzf"; src = pkgs.fishPlugins.fzf-fish; }
      ];
    };
  };
}
