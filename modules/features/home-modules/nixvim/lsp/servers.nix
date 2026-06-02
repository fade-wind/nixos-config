{ inputs, pkgs, ... }:
let
  powershell-nvim = pkgs.vimUtils.buildVimPlugin {
    name = "powershell-nvim";
    src = pkgs.fetchFromGitHub {
      owner = "TheLeoP";
      repo = "powershell.nvim";
      rev = "3ac437e45ff54bb4c0ce64ff044cd0c47e396a25";
      hash = "sha256-ycv3mCRRZ+DPi2FpU1i75ev2Xmm0QctHFw/BvdGrxPE=";
    };
  };
in
{
  extraPackages = with pkgs; [
    nil
    lua-language-server
    luajit
    jinja-lsp
    marksman
    taplo
    docker-ls
    docker-compose-language-service
    typescript-language-server
    bash-language-server
    yaml-language-server
    vscode-langservers-extracted
    powershell-editor-services
  ];
  plugins.lsp = {
    enable = true;
    servers = {
      lua_ls = {
        enable = true;
        settings = {
          Lua = {
            runtime = {
              version = "LuaJIT";
            };
            diagnostics = {
              globals = [
                "vim"
                "require"
              ];
            };
          };
        };
      };
      ansiblels = {
        enable = true;
        package = pkgs.ansible-language-server;
        settings = {
          python = {
            interpreterPath = "$HOME/.venv/bin/python";
          };
        };
      };
      jinja_lsp = {
        filetypes = [
          "jinja_lsp"
        ];
      };
      nil_ls = {
        enable = true;
        # settings = {
        #   flake = {
        #     autoArchive = true;
        #     autoEvalInputs = true;
        #   };
        # };
      };
      powershell_es = {
        enable = true;
        package = pkgs.powershell-editor-services;
        filetypes = [
          "pwsh"
        ];
      };
      marksman.enable = true;
      bashls = {
        enable = true;
        filetypes = [
          "sh"
          "bash"
          "zsh"
        ];
      };
      taplo.enable = true;
      jsonls.enable = true;
      yamlls.enable = true;
      dockerls.enable = true;
      docker_compose_language_server.enable = true;
      ts_ls.enable = true;
    };
  };
  plugins = {
    render-markdown.enable = true;
  };
  extraPlugins = [ powershell-nvim ];
  extraConfigLua = ''
    require("powershell").setup({
      bundle_path="${pkgs.powershell-editor-services}/share/powershell-editor-services",
    })
  '';
  filetype = {
    extension = {
      j2 = "jinja";
      md = "markdown";
      ps1 = "pwsh";
    };
    pattern = {
      ".*/playbooks./.*%.ya?ml" = "yaml.ansible";
      ".*/roles/*.*%.ya?ml" = "yaml.ansible";
      ".*/group_vars/all/*.*%.ya?ml" = "yaml.ansible";
    };
  };
  autoCmd = [
    {
      event = "BufReadPost";
      pattern = [
        "*main.yml"
        "*main.yaml"
        "*test.yml"
      ];
      callback.__raw = ''
        function()
          vim.bo.filetype = "yaml.ansible"
        end
      '';
    }
  ];
}

