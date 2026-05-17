{ pkgs, ... }:
let
  yamlFile = ./config.yml;
  jsonFile = pkgs.runCommand "yaml-to-json" {
    nativeBuildInputs = [ pkgs.remarshal ];
  } "yaml2json ${yamlFile} > $out";
  config = builtins.fromJSON (builtins.readFile jsonFile);
in
{
  programs.lazygit = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true; 
    settings = config; 
  };
}
