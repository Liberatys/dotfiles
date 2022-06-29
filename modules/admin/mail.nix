{ config, pkgs, lib, ... }:

let
  realName = "Nick Flueckiger";
  maildir = "/home/liberatys/Mail";

  servers = {
    gmail = {
      flavor = "gmail.com";

      neomutt = {
        enable = true;

        mailboxName = "work";
      };

      notmuch = {
        enable = true;
      };

      mbsync = {
        enable = true;

        create = "maildir";
        remove = "none";
        expunge = "both";
      };

      msmtp = {
        enable = true;
      };

      imap = {
        host = "imap.gmail.com";
        port = 993;
        tls = {
          enable = true;
        };
      };

      smtp = {
        host = "smtp.gmail.com";
        port = 465;
        tls = {
          enable = true;
        };
      };
    };
  };

in

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
      accounts.email = {
        maildirBasePath = "${maildir}";

        accounts = {
          work = servers.gmail // {
            inherit realName;

            userName = "nick.flueckiger@renuo.ch";
            address = "nick.flueckiger@renuo.ch";

            primary = true;

            signature = {
              text = ''
                Nick Flückiger
                Software Entwickler, Eidg. FZ Informatiker
                🌎  Renuo AG   📍  Industriestrasse 44, 8304 Wallisellen
                📞  +41 44 500 83 50
              '';
              showSignature = "append";
            };

            passwordCommand = "pass Email/renuo.ch";
          };
        };
      };

      home.packages = with pkgs; [
        feh
        w3m
      ];

      programs = {
        neomutt = {
          enable = true;

          vimKeys = true;

          sort = "reverse-date";

          sidebar = {
            enable = true;
          };

          extraConfig = ''
            color header blue default ".*"
            color header brightmagenta default "^(From)"
            color header brightcyan default "^(Subject)"
            color header brightwhite default "^(CC|BCC)"

            mono bold bold
            mono underline underline
            mono indicator reverse
            mono error bold
            color normal default default
            color indicator brightyellow default # currently selected message. default makes bar clear, disabled arrow to save space.
            color sidebar_highlight red default
            color sidebar_divider brightblack black
            color sidebar_flagged red black
            color sidebar_new green black
            color normal brightyellow default
            color error red default
            color tilde black default
            color message cyan default
            color markers red white
            color attachment white default
            color search brightmagenta default
            color status brightyellow black
            color hdrdefault brightgreen default
            color quoted green default
            color quoted1 blue default
            color quoted2 cyan default
            color quoted3 yellow default
            color quoted4 red default
            color quoted5 brightred default
            color signature brightgreen default
            color bold black default
            color underline black default
            color normal default default

            color body brightred default "[\-\.+_a-zA-Z0-9]+@[\-\.a-zA-Z0-9]+" # Email addresses
            color body brightblue default "(https?|ftp)://[\-\.,/%~_:?&=\#a-zA-Z0-9]+" # URL
            color body green default "\`[^\`]*\`" # Green text between ` and `
            color body brightblue default "^# \.*" # Headings as bold blue
            color body brightcyan default "^## \.*" # Subheadings as bold cyan
            color body brightgreen default "^### \.*" # Subsubheadings as bold green
            color body yellow default "^(\t| )*(-|\\*) \.*" # List items as yellow
            color body brightcyan default "[;:][-o][)/(|]" # emoticons
            color body brightcyan default "[;:][)(|]" # emoticons
            color body brightcyan default "[ ][*][^*]*[*][ ]?" # more emoticon?
            color body brightcyan default "[ ]?[*][^*]*[*][ ]" # more emoticon?

            color index yellow default '.*'
            color index_author red default '.*'
            color index_number blue default
            color index_subject cyan default '.*'

            color index brightyellow black "~N"
            color index_author brightred black "~N"
            color index_subject brightcyan black "~N"

            color progress black cyan

            bind browser d noop
            bind index gt noop
            bind index gT noop
            bind index gg noop
            bind index g noop
            bind index dT noop
            bind index,pager,browser dd noop
            bind index,pager,browser dt noop

            bind attach <return> view-mailcap
            bind attach l view-mailcap
            bind editor <space> noop
            bind pager c imap-fetch-mail
            bind index G last-entry
            bind index gg first-entry
            bind pager,attach h exit
            bind pager j next-line
            bind pager k previous-line
            bind pager l view-attachments
            bind index D delete-message
            bind index U undelete-message
            bind index L limit
            bind index h noop
            bind index l display-message
            bind browser h goto-parent
            bind browser l select-entry
            bind pager,browser gg top-page
            bind pager,browser G bottom-page
            bind index,pager,browser d half-down
            bind index,pager,browser u half-up
            bind index,pager R group-reply
            bind index \031 previous-undeleted	# Mouse wheel
            bind index \005 next-undeleted		# Mouse wheel
            bind pager \031 previous-line		# Mouse wheel
            bind pager \005 next-line		# Mouse wheel
            bind editor <Tab> complete-query

            bind index,pager \Ck sidebar-prev
            bind index,pager \Cj sidebar-next
            bind index,pager \Co sidebar-open
            bind index,pager \Cp sidebar-prev-new
            bind index,pager \Cn sidebar-next-new
            bind index,pager B sidebar-toggle-visible

            bind index,pager @ compose-to-sender
            bind index,pager D purge-message
            bind index <tab> sync-mailbox
            bind index <space> collapse-thread

            bind editor <Tab> complete-query
            bind editor ^T complete
          '';
        };

        notmuch = {
          enable = true;

          hooks = {
            preNew = "mbsync --all";
          };
        };

        mbsync = {
          enable = true;

          extraConfig = ''
            MaxMessages 200

            ExpireUnread yes
          '';
        };

        msmtp = {
          enable = true;
        };
      };

      services = {
        imapnotify = {
          enable = true;
        };
      };

      systemd.user.services.mbsync-oneshot = {
        Unit = {
          Description = "mbsync oneshot synchronisation";
        };
        Service = {
          Type = "oneshot";
          ExecStart = "${config.programs.mbsync.package}/bin/mbsync --all";
          RemainAfterExit = true;
        };
        Install.WantedBy = [ "default.target" ];
      };
    };
  }
