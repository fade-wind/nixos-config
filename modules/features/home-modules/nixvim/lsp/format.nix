{ pkgs, ... }:

{
  extraPackages = with pkgs; [
    prettier
    nixfmt
    oxfmt
    shfmt
    taplo
  ];

  plugins.conform-nvim = {
    enable = true;
    settings = {
      format_on_save = {
        lsp_format = "fallback";
        timeout_ms = 500;
      };
      formatters_by_ft = {
        nix = [ "nixfmt" ];
        markdown = [ "oxfmt" ];
        sh = [ "shfmt" ];
        bash = [ "shfmt" ];
        zsh = [ "shfmt" ];
        toml = [ "taplo" ];
        json = [ "oxfmt" ];
        jsonc = [ "oxfmt" ];
        yaml = [ "oxfmt" ];
        mdx = [ "oxfmt" ];
      };
    };
  };

  autoCmd = [
    {
      event = "BufWritePre";
      callback.__raw = ''
        function ()
          local buf = vim.fn.bufnr()
          local last = vim.fn.line("$")
          -- Remove extra trailing blank lines, keeping at most one
          while last > 1 and vim.fn.getline(last) == "" and vim.fn.getline(last - 1) == "" do
            vim.fn.deletebufline(buf, last)
            last = last - 1
          end
          -- Ensure exactly one trailing newline
          if vim.fn.getline(last) ~= "" then
            vim.fn.append(last, "")
          end
        end
      '';
    }
  ];
}

