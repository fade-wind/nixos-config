{ pkgs, ... }:
{
  programs.firefox = {
    enable = true;
    policies = {
      ExtensionSettings = {
        # Gruvbox dark theme
        "{fcf02b85-0a24-412a-a28f-5727fc00e72b}" = {
          installation_mode = "force_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/gruvbox-dark-theme-firefox/latest.xpi";
        };
      };
    };

    profiles.default = {
      isDefault = true;

      settings = {
        "browser.startup.homepage" = "https://www.duckduckgo.com";
        "browser.search.region" = "US";
        "browser.search.isUS" = true;

        # Dark mode preference
        "layout.css.prefers-color-scheme.content-override" = 0;

        "extensions.autoDisableScopes" = 0;

        "sidebar.revamp" = true;
        "sidebar.verticalTabs" = true;
        "sidebar.visibility" = "always-show";
      };

      search = {
        default = "ddg";

        engines = {
          ddg = {
            name = "DuckDuckGo";
            urls = [
              {
                template = "https://duckduckgo.com/?q={searchTerms}";
              }
            ];
          };
          github = {
            name = "GitHub";
            urls = [
              {
                template = "https://github.com/search?q={searchTerms}";
              }
            ];
            definedAliases = [ "!gh" ];
          };
          youtube = {
            name = "YouTube";
            urls = [
              {
                template = "https://www.youtube.com/results?search_query={searchTerms}";
              }
            ];
            definedAliases = [ "!yt" ];
          };
          kubesearch = {
            name = "KubeSearch";
            urls = [
              {
                template = "https://kubesearch.dev#{searchTerms}";
              }
            ];
            definedAliases = [ "!ks" ];
          };
        };
      };

      extensions.packages = with pkgs.nur.repos.rycee.firefox-addons; [
        ublock-origin
        onepassword-password-manager
        sponsorblock
        clearurls
      ];
    };
  };
}
