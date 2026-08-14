{ inputs, pkgs, ... }:
{
  programs.nixvim.extraPackages = with pkgs; [
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
  ];
  programs.nixvim.plugins.lsp = {
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
      docker_compose_language_service.enable = true;
      ts_ls.enable = true;
    };
  };
  programs.nixvim.plugins = {
    render-markdown.enable = true;
  };
  programs.nixvim.filetype = {
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
  programs.nixvim.autoCmd = [
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
