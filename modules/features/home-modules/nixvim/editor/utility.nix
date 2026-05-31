{ pkgs, ... }:
let
  sshfs-nvim = pkgs.vimUtils.buildVimPlugin {
    name = "sshfs-nvim";
    src = pkgs.fetchFromGitHub {
      owner = "uhs-robert";
      repo = "sshfs.nvim";
      rev = "57f586251d788dae38fd12998b9a208f7d54c1ef";
      hash = "sha256-Vcdjd0WbeSFIeRyCxzHNdFwC33l3hKAvZ3kKCDTDHco=";
    };
  };
in
{
  plugins.persistence = {
    enable = true;
    settings = {
      options = [
        "buffers"
        "curdir"
        "options"
        "tabpages"
        "winsize"
      ];
      pre_save.__raw = ''
        function()
          local cwd = vim.fn.getcwd()
          if cwd == vim.fn.expand("~") or cwd:match("/tmp") then
            return false
          end
        end
      '';
    };
  };
  extraPlugins = [ sshfs-nvim ];
  extraConfigLua = ''
    require("sshfs").setup()
  '';
  autoCmd = [
    {
      event = "VimEnter";
      callback.__raw = ''
        function()
          if vim.g.neovide then
            vim.cmd("Dashboard")
          else
            require("persistence").load({
              silent = true,
            })
            vim.cmd("filetype detect")
          end
        end
      '';
    }
    {
      event = "SessionLoadPost";
      callback.__raw = ''
        function()
          for _, buf in ipairs(vim.api.nvim_list_bufs()) do
            if vim.api.nvim_buf_is_valid(buf) then
              local name  = vim.api.nvim_buf_get_name(buf)

              if name:match("neo%-tree") or name:match("toggleterm") then
                vim.api.nvim_buf_delete(buf, { force = true })
              end
            end
          end
        end
      '';
    }
  ];
}

