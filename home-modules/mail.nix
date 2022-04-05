{ config, pkgs, lib, ... }:

with lib;
{
  options = {
    dotfiles.mail.enabled = mkEnableOption "mail";
  };

  config = mkIf config.dotfiles.mail.enabled {

    programs = {
      notmuch = {
        enable = true;
        hooks = {
          preNew = "mbsync --all";
        };
      };

      mbsync = {
        enable = true;
      };

      msmtp = {
        enable = true;
      };
    };

    accounts.email = {
      accounts = {
        work = {
          address = "nick.flueckiger@renuo.ch";
          imap = {
            host = "imap.gmail.com";
          };

          mbsync = {
            enable = true;
            create = "maildir";
          };
          msmtp.enable = true;
          notmuch.enable = true;
          primary = true;
          realName = "Nick Anthony Flueckiger";
          signature = {
            text = ''
              Nick Flueckiger
              nick.flueckiger@renuo.ch
            '';
            showSignature = "append";
          };
          passwordCommand = "pass Email/renuo.ch";
          smtp = {
            host = "smtp.gmail.com";
          };
          userName = "nick.flueckiger@renuo.ch";
        };
      };
    };
  };
}
