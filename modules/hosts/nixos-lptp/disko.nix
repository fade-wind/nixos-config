{
  fileSystems."/nix".neededForBoot = true;
  fileSystems."/pres-system".neededForBoot = true;

  disko.devices.nodev = {
    "/" = {
      fsType = "tmpfs";
      mountOptions = [
        "size=25%"
        "mode=775"
      ];
    };
  };

  disko.devices.disk.main = {
    device = "/dev/disk/by-id/nvme-KXG5AZNV512G_TOSHIBA_69HS112MTPDT";
    type = "disk";

    content = {
      type = "gpt";

      partitions = {
        boot = {
          name = "boot";
          size = "1M";
          type = "EF02";
        };

        esp = {
          name = "ESP";
          size = "1G";
          type = "EF00";

          content = {
            type = "filesystem";
            format = "vfat";
            mountpoint = "/boot";
          };
        };

        swap = {
          size = "8G";

          content = {
            type = "swap";
            resumeDevice = true;

          };
        };

        root = {
          name = "root";
          size = "100%";

          content = {
            type = "btrfs";
            extraArgs = [ "-f" ];

            subvolumes = {
              "/pres-system" = {
                mountOptions = [
                  "subvol=pres-system"
                  "noatime"
                ];
                mountpoint = "/pres-system";
              };

              "/nix" = {
                mountOptions = [
                  "subvol=nix"
                  "noatime"
                ];
                mountpoint = "/nix";
              };

              "/pres-user" = {
                mountOptions = [
                  "subvol=pres-user"
                  "noatime"
                ];
                mountpoint = "/pres-user";
              };
            };
          };
        };
      };
    };
  };
}

