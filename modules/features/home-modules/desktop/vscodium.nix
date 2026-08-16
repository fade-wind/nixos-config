{ inputs, pkgs, ... }:
let
  open-vsx = inputs.nix-vscode-extensions.extensions.${pkgs.stdenv.hostPlatform.system}.open-vsx;
in
{
  programs.vscodium = {
    enable = true;

    profiles.default = {
      extensions = (with pkgs.vscode-extensions; [
        vscodevim.vim
        jnoortheen.nix-ide
        redhat.vscode-yaml
        ms-kubernetes-tools.vscode-kubernetes-tools
        irongeek.vscode-env
        signageos.signageos-vscode-sops
        ]) ++ 
        (with open-vsx; [ 
          navernoedenis.gruvbox-material-icons
          jeanp413.open-remote-ssh
          snrico-moonlight.gruvbox-material-community
          blueglassblock.better-json5
          hverlin.mise-vscode
        ]);
      userSettings = {
        "workbench.colorTheme" = "Gruvbox Material Dark";
        "workbench.iconTheme" = "gruvbox-material-icons";
        "workbench.activityBar.location" = "top";
        "workbench.browser.showInTitleBar" = true;
        "window.menuBarVisibility" = "compact";
        "editor.minimap.enabled" = false;
      };
    };
  };
}
