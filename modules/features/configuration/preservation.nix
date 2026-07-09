{ vars, ... }:
{
  preservation = {
    enable = true;
    preserveAt."/pres-system" = {

      files = [
        {
          file = "/etc/machine-id";
          inInitrd = true;
        }
      ];

      directories = [
        "/etc/nixos"
        "/var/lib/AccountsService/"
        "/var/lib/systemd/timers"
        "/var/lib/nixos"
        "/var/lib/noctalia-greeter"
        "/var/log"
        "/etc/NetworkManager/system-connections"
        "/etc/ssh"
      ];
    };
    preserveAt."/pres-user" = {
      users.${vars.username} = {
        directories = [
          "Desktop"
          "Documents"
          "Downloads"
          "Games"
          "Music"
          "Pictures"
          "Projects"
          "Templates"
          "Videos"
          ".ssh"
          ".local/share/atuin"
          ".local/share/zoxide"
          ".local/share/Steam"
          ".local/state/nvim"
          ".local/share/icons"
          ".config/GIMP/3.0"
          ".venv"
          ".kube"
        ];
        files = [
          ".local/share/applications/org.gimp.GIMP.desktop"
        ];
      };
    };
  };
}
