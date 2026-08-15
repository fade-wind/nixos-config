{ inputs, ... }:
{
  imports = [
    inputs.zen-browser.homeModules.beta
  ];

  programs.zen-browser = {
    enable = true;
    setAsDefaultBrowser = false;
    policies = {
      DisableAppUpdate = true;
      DisablePocket = true;
      DisableTelemetry = true;
      EnableTrackingProtection = {
        Value = true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
      };
    };
    profiles.default = {
      mods = [
        "e122b5d9-d385-4bf8-9971-e137809097d0" # No Top Sites
        "253a3a74-0cc4-47b7-8b82-996a64f030d5" # Floating History
        "4ab93b88-151c-451b-a1b7-a1e0e28fa7f8" # No Sidebar Scrollbar
        "7190e4e9-bead-4b40-8f57-95d852ddc941" # Tab title fixes
        "803c7895-b39b-458e-84f8-a521f4d7a064" # Hide Inactive Workspaces
        "906c6915-5677-48ff-9bfc-096a02a72379" # Floating Status Bar
      ];
      search = {
        force = true;
        default = "ddg";
        engines = {
          github = {
            name = "GitHub Search";
            urls = [
              {
                template = "https://github.com/search?q={searchTerms}";
              }
            ];
            definedAliases = [ "@gh" ];
          };
          kubesearch = {
            name = "KubeSearch";
            urls = [
              {
                template = "https://kubesearch.dev#{searchTerms}";
              }
            ];
            definedAliases = [ "@ks" ];
          };
        };
      };
    };
  };
}
