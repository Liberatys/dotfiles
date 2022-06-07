{ config, pkgs, lib, ... }:

with lib;
{
  options = {
    modules = {
      admin = {
        mail = {
          enabled = mkEnableOption "mail";
        };
      };
    };
  };

  config = mkIf config.modules.admin.mail.enabled {
    programs = {
      neomutt = {
        enable = true;

        vimKeys = true;
      };

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
          realName = "Nick Anthony Flueckiger";
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
