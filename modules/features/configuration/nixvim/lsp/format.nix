{ pkgs, ... }:

{
  extraPackages = with pkgs; [
    prettier
    nixfmt
    oxfmt
    shfmt
    taplo
    yamlfmt
  ];

  plugins.conform-nvim = {
    enable = true;
    settings = {
      format_on_save = {
        lsp_format = "fallback";
        timeout_ms = 500;
      };
      formatters = {
        ansible_lint = {
          command = "$HOME/.venv/bin/ansible-lint";
        };
      };
      formatters_by_ft = {
        "*" = [ "trim_whitespace" ];
        nix = [ "nixfmt" ];
        markdown = [ "oxfmt" ];
        sh = [ "shfmt" ];
        bash = [ "shfmt" ];
        zsh = [ "shfmt" ];
        toml = [ "taplo" ];
        json = [ "oxfmt" ];
        jsonc = [ "oxfmt" ];
        "yaml.ansible" = [
          "ansible_lint"
        ];
        yaml = [ "yamlfmt" ];
        mdx = [ "oxfmt" ];
      };
    };
  };
}

