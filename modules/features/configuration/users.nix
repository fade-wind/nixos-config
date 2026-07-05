{ vars, pkgs, ... }:
{
  users.users.${vars.username} = {
    hashedPasswordFile = "/persistent/passwd";
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
