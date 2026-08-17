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
          ".local/share/mise"
          ".local/state/nvim"
          ".local/state/noctalia"
          ".local/share/icons"
          ".config/1Password"
          ".config/mozilla/firefox"
          ".config/GIMP/3.0"
          ".config/VSCodium/User/globalStorage"
          ".config/vekstop/sessiondata"
          ".venv"
          ".kube"
          ".talos"
        ];
        files = [
          ".local/share/applications/org.gimp.GIMP.desktop"
        ];
      };
    };
  };
}
