{
  imports = [
    ./format.nix
    ./servers.nix
    ./treesitter.nix
  ];

  extraConfigLua = ''
    local sev = vim.diagnostic.severity

    vim.diagnostic.config({
    	severity_sort = true,
    	signs = {
    		text = {
    			[sev.ERROR] = " ",
    			[sev.WARN] = " ",
    			[sev.INFO] = " ",
    			[sev.HINT] = " ",
    		},
    	},
    })
  '';
}

