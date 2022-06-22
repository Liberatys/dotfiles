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

    home.file.".vale.ini".source = ../../configs/vale/.vale.ini;
    home.file.".railsrc".source = ../../configs/shared/.railsrc;

    home.file.".local/share/fonts/MesloLGS NF Bold.ttf".source = ../../configs/fonts/MesloLGS_Bold.ttf;
    home.file.".local/share/fonts/MesloLGS NF Bold Italic.ttf".source = ../../configs/fonts/MesloLGS_Bold_Italic.ttf;
    home.file.".local/share/fonts/MesloLGS NF Italic.ttf".source = ../../configs/fonts/MesloLGS_Italic.ttf;
    home.file.".local/share/fonts/MesloLGS NF Regular.ttf".source = ../../configs/fonts/MesloLGS_Regular.ttf;
    home.file.".local/share/fonts/all-the-icons.ttf".source = ../../configs/fonts/all-the-icons.ttf;
    home.file.".local/share/fonts/file-icons.ttf".source = ../../configs/fonts/file-icons.ttf;

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
