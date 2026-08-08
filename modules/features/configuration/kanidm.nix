{
  services.kanidm = {
    client = {
      enable = true;
      settings = {
        uri = "https://idm.fade-lab.com";
      };
    };
    unix = {
      enable = true;

      settings = {
        pam_allowed_login_groups = [
          "unix-login"
        ];
      };
    };
  };
}
