{ pkgs, ... }:
let
  mdx-language-server = pkgs.buildNpmPackage rec {
    pname = "mdx-language-server";
    version = "0.6.3";
    src = pkgs.fetchurl {
      url = "https://registry.npmjs.org/@mdx-js/language-server/-/language-server-${version}.tgz";
      hash = "sha256-rNYJYQjnA7u02nP4a7EL/yJbjGdwP0RLQpAhr/I9xLs=";
    };
    postPatch = ''
      ln -s ${./mdx-language-server-package-lock.json} package-lock.json
    '';
    npmDepsHash = "sha256-fY+lG+eu+hX7RFyWRiGOA1VXEt4hTmud6KB5XDaBeFo=";
    dontNpmBuild = true;
    meta = {
      description = "Language server for MDX";
      homepage = "https://github.com/mdx-js/mdx-analyzer";
      mainProgram = "mdx-language-server";
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
  ];
  plugins.lsp = {
    enable = true;
    servers = {
      lua_ls = {
        enable = true;
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
      ansiblels = {
        enable = true;
        package = null;
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
        flake = {
          autoArchive = true;
          autoEvalInputs = true;
        };
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
      mdx_analyzer = {
        enable = true;
        package = mdx-language-server;
        extraOptions.init_options.typescript.tsdk = "${pkgs.typescript}/lib/node_modules/typescript/lib";
      };
    };
  };
  plugins = {
    render-markdown.enable = true;
  };
  filetype = {
    extension = {
      j2 = "jinja";
      md = "markdown";
    };
    pattern = {
      ".*/playbooks./.*%.ya?ml" = "yaml.ansible";
      ".*/roles.*/tasks/.*%.ya?ml" = "yaml.ansible";
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

