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
        "chat.agent.enabled" = false;
        "editor.cursorStyle" = "block";
        "editor.fontFamily" = "'JetBrainsMono Nerd Font','Droid Sans Mono', monospace";
        "editor.fontSize" = 16;
        "editor.lineNumbers" = "relative";
        "editor.minimap.enabled" = "false";
        "editor.tabSize" = 2;
        "editor.wordWrap" = "on";
        "redhat.telemetry.enabled" = false;
        "terminal.integrated.defaultProfile.linux" = "zsh";
        "terminal.integration.profiles.linux" = {
          zsh = {
            path = "${pkgs.zsh}/bin/zsh";
          };
        };
        "vim.smartRelativeLine" = true;
        "vs-kubernetes" = {
            "vs-kubernetes.crd-code-completion" = "enabled";
        };
        "vscode-kubernetes.helm-path" = "${pkgs.kubernetes-helm}/bin/helm";
        "vscode-kubernetes.kubectl-path" = "${pkgs.kubectl}/bin/kubectl";
        "window.controlsStyle" = "hidden";
        "window.menuBarVisibility" = "compact";
        "window.titleBarStyle" = "custom";
        "workbench.activityBar.compact" = true;
        "workbench.activityBar.location" = "top";
        "workbench.colorTheme" = "Gruvbox Material Dark";
        "workbench.iconTheme" = "gruvbox-material-icons";
        "workbench.navigationControl.enabled" = false;
        "workbench.preferredDarkColorTheme" = "Gruvbox Material Dark";
        "workbench.sideBar.location" = "left";
      };
    };
  };
}
