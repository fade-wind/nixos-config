{ pkgs, ... }:
{
  services.kanidm = {
    package = pkgs.kanidm_1_10;
    client = {
      enable = true;
      settings = {
        uri = "https://idm.fade-lab.com";
      };
    };
    unix = {
      enable = true;

      settings = {
        home_prefix = "/home/";
        home_attr = "name";
        uid_attr_map = "name";
        kanidm = {
          pam_allowed_login_groups = [
            "unix-login"
          ];
        };
      };
    };
  };
}
