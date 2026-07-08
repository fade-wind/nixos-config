{ vars, pkgs, ... }:
{
#  users.mutableUsers = false;
  users.users.${vars.username} = {
    initialPassword = "12345";
#    hashedPasswordFile = "/pres-machine/passwd";
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = [
      "wheel"
      "audio"
      "networkmanager"
      "podman"
      "video"
      "storage"
    ];
  };
}
