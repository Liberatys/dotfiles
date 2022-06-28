{ config, lib, pkgs, ... }:

with lib;
{
  options = {
    modules = {
      browsers = {
        firefox = {
          enabled = mkEnableOption "firefox";
        };
      };
    };
  };

  config = mkIf config.modules.browsers.firefox.enabled {
    programs = {
      firefox = {
        enable = true;

        profiles = {
          Liberatys = {
            id = 0;
            isDefault = true;

            settings = {
              "browser.display.background_color" = "#000000";
              "browser.startup.homepage" = "https://github.com/";
              "browser.translation.ui.show" = false;
              "browser.urlbar.eventTelemetry.enabled" = false;
              "browser.urlbar.suggest.bookmark" = true;
              "browser.urlbar.suggest.history" = false;
              "browser.urlbar.suggest.openpage" = false;
              "devtools.theme" = "dark";
              "extensions.pocket.enabled" = false;
              "extensions.recommendations.hideNotice" = true;
              "extensions.ui.dictionary.hidden" = false;
              "extensions.ui.locale.hidden" = false;
              "identity.fxaccounts.enabled" = false;

              "privacy.clearOnShutdown.cookies" = false;
              "privacy.clearOnShutdown.openWindows" = false;
              "privacy.clearOnShutdown.siteSettings" = false;

              # Password Manager
              "signon.rememberSignons" = false;
              "signon.generation.enabled" = false; # Disable password generation
              "signon.management.page.breach-alerts.enabled" = false; # Disable password breach alerts

              # Telemetry
              "privacy.trackingprotection.cryptomining.enabled" = true;
              "privacy.trackingprotection.enabled" = true;
              "privacy.trackingprotection.fingerprinting.enabled" = true; # Blocks Fingerprinting
              "privacy.trackingprotection.origin_telemetry.enabled" = false;
              "security.app_menu.recordEventTelemetry" = false;
              "security.certerrors.recordEventTelemetry" = false;
              "security.identitypopup.recordEventTelemetry" = false;
              "security.protectionspopup.recordEventTelemetry" = false;
              "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
              "toolkit.telemetry.debugSlowSql" = false;
              "toolkit.telemetry.ecosystemtelemetry.enabled" = false;
              "toolkit.telemetry.geckoview.streaming" = false;
              "toolkit.telemetry.isGeckoViewMode" = false;
              "toolkit.telemetry.shutdownPingSender.enabledFirstSession" = false;
              "toolkit.telemetry.testing.overrideProductsCheck" = false;
            };

            # TODO: Move into a file
            userChrome = ''
              ${builtins.readFile ../../themes/firefox/userChrome.css}
            '';
          };
        };
      };
    };
  };
}
