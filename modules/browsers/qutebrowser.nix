{ config, lib, pkgs, ... }:

with lib;
{
  options = {
    modules = {
      browsers = {
        qutebrowser = {
          enabled = mkEnableOption "qutebrowser";
        };
      };
    };
  };

  config = mkIf config.modules.browsers.qutebrowser.enabled {
    home.packages = [ pkgs.qutebrowser ];

    home.file.".config/qutebrowser/config.py".text = ''
      c.aliases = {}
      c.tabs.tabs_are_windows = False
      c.tabs.show = "multiple"
      c.statusbar.show = "in-mode"
      c.downloads.location.directory = "~/Downloads"
      c.content.pdfjs = True
      c.editor.command = ["alacritty", "nvim", "{}"]
      c.content.javascript.enabled = False
      config.load_autoconfig()
    '';
  };
}
