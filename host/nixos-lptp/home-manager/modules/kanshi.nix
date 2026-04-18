{
  services.kanshi = {
    enable = true;
    systemdTarget = "niri.service";

    profiles = {
      undocked = {
        outputs = [
          {
            criteria = "eDP-1";
            scale = 1.0;
            status = "enable";
          }
        ];
      };
    };
  };
}
