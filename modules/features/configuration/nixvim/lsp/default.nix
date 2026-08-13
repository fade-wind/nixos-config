{
  imports = [
    ./format.nix
    ./servers.nix
    ./treesitter.nix
  ];

  programs.nixvim.extraConfigLua = ''
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
