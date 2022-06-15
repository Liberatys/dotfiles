{ config, lib, pkgs, ... }:

with lib;

{
  options = {
    modules = {
      system = {
        home = {
          enabled = mkEnableOption "home";
        };
      };
    };
  };

  config = mkIf config.modules.system.home.enabled {

    home.sessionVariables = {
      DIRENV_LOG_FORMAT = "";
      EDITOR = "nvim";
    };

    home.file.".profile" = {
      text = ''
        export NIX_PATH=nixpkgs=${pkgs.path}
        export TMPDIR=/tmp
        export TMP=$TMPDIR
      '';
      executable = true;
    };
  };
}
