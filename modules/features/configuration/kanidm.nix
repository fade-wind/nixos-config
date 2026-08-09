{ inputs, pkgs, ... }:
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
        gid_attr_map = "name";
        kanidm = {
          pam_allowed_login_groups = [
            "unix-login"
          ];
          map_group = [
            {
              local = "wheel";
              "with" = "sys-admin";
            }
            {
              local = "flatpak";
              "with" = "sys-admin";
            }
            {
              local = "audio";
              "with" = "sys-admin";
            }
            {
              local = "networkmanager";
              "with" = "sys-admin";
            }
            {
              local = "podman";
              "with" = "sys-admin";
            }
            {
              local = "video";
              "with" = "sys-admin";
            }
            {
              local = "storage";
              "with" = "sys-admin";
            }
          ];
        };
      };
    };
  };
  systemd.user.services.home-manager-zpeppler = {
    wantedBy = [ "default.target" ];

    serviceConfig = {
      Type = "oneshot";
      ExecStart = "${inputs.self.homeConfigurations.zpeppler.activationPackage}/activate";
    };
  };
}
