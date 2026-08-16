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
        "editor.fontFamily" = "'JetBrainsMono Nerd Font','Droid Sans Mono', monospace";
        "editor.wordWrap" = "on";
        "workbench.colorTheme" = "Gruvbox Material Dark";
        "editor.tabSize" = 2;
        "editor.fontSize" = 16;
        "editor.cursorStyle" = "block";
        "editor.minimap.size" = "fit";
        "workbench.activityBar.compact" = true;
        "workbench.activityBar.location" = "top";
        "workbench.iconTheme" = "gruvbox-material-icons";
        "workbench.preferredDarkColorTheme" = "Gruvbox Material Dark";
        "workbench.sideBar.location" = "right";
        "redhat.telemetry.enabled" = false;
        "vs-kubernetes" = {
            "vs-kubernetes.crd-code-completion" = "enabled";
        };
        "chat.agent.enabled" = false;
        "editor.lineNumbers" = "relative";
        "vim.smartRelativeLine" = true;
        "vscode-kubernetes.helm-path" = "${pkgs.kubernetes-helm}/bin/helm";
        "vscode-kubernetes.kubectl-path" = "${pkgs.kubectl}/bin/kubectl";
      };
    };
  };
}
