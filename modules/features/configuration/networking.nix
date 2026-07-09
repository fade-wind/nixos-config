{ vars, ... }:
{
  networking = {
    hostName = vars.hostname;
    networkmanager.enable = true;
    firewall.allowedTCPPorts = [
      22
      9090
    ];
  };
}
