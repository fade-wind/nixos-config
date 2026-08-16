{ inputs, pkgs, ... }:
let
  open-vsx = inputs.nix-vscode-extensions.extensions.${pkgs.stdenv.hostPlatform.system}.open-vsx;
in
{
  programs.vscodium = {
    enable = true;

    profiles.default = {
      extensions = (with pkgs.vscode-extensions; [
        vscodevim.vim]) ++ 
        [ 
          open-vsx.navernoedenis.gruvbox-material-icons
        ];
    };
  };
}
