{ pkgs, ... }:

{
  programs.firefox = {
    enable = true;

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
      ];
    };
  };
}
