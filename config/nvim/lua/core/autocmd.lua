local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

autocmd("BufEnter", {
	group = augroup("Neotree_start_directory", { clear = true }),
	desc = "Start Neo-tree with directory",
	once = true,
	callback = function()
		if package.loaded["neo-tree"] then
			return
		else
			local stats = vim.uv.fs_stat(vim.fn.argv(0))
			if stats and stats.type == "directory" then
				require("neo-tree")
			end
		end
	end,
})

autocmd("PackChanged", {
	pattern = "nvim-treesitter",
	desc = "Run :TSUpdate after pack changed",
	group = augroup("treesitter_update", { clear = true }),
	callback = function(e)
		local kind, name
		name = e.data.kind, e.data.spec.name
		if kind == "install" or kind == "update" then
			vim.cmd.packadd({ args = { name }, bang = false })
			vim.cmd("TSUpdate")
		end
	end,
})

-- if entering from neovide, dashboard displays
-- if entering from terminal, will trigger persistence
-- NOTE: this requires sesh+television+tmux

autocmd("VimEnter", {
  callback = function()
    if vim.g.neovide then
      vim.cmd("Dashboard")
    else
      require("persistence").load({
        silent = true,
      })
      vim.cmd("filetype detect")
    end
  end,
})

