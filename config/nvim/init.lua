vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opt = vim.opt
local keymap = vim.keymap.set
local key_opts = { noremap = true, silent = true }

-- Performance and Timing
opt.updatetime = 100
opt.lazyredraw = false
opt.synmaxcol = 240
opt.timeoutlen = 500

-- UI & Appearance
-- Enable relative line numbers
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.signcolumn = "yes"
opt.laststatus = 3
opt.showmode = false
opt.showmatch = true
opt.matchtime = 1
opt.termguicolors = true
opt.winborder = "rounded"

-- Windows & Splits
opt.splitbelow = true
opt.splitright = true

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.hlsearch = true

-- Files and Buffers
opt.swapfile = false
opt.backup = false
opt.writebackup = false
opt.undofile = true
opt.autoread = true
opt.fileencoding = "utf-8"
opt.modeline = true
opt.modelines = 100

-- Indents and Formatting
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true
opt.autoindent = true
-- opt.smartindent = true
opt.breakindent = true
opt.preserveindent = true
opt.linebreak = true
opt.wrap = true

-- Completion and Popup
opt.pumheight = 10
opt.infercase = true
opt.completeopt = "menuone,noinsert,noselect"

-- Command Line and Message
opt.cmdheight = 0
opt.history = 100
opt.report = 9001

-- Editor Behavior
opt.virtualedit = "block"
opt.startofline = true
opt.title = true

opt.grepprg = "rg --vimgrep"
opt.grepformat = "%f:%l:%c:%m"

opt.scrolloff = 8
opt.mouse = "a"

opt.encoding = "utf-8"

opt.modifiable = true

-- General keymaps
keymap("n", "gl", function()
	vim.diagnostic.open_float()
end, { desc = "Open Diagnostic in float" })
keymap("n", "<leader>cf", function()
	require("conform").format({
		lsp_format = "fallback",
	})
end, { desc = "Format [c]urrent [f]ile" })

-- Disable spacebar's default behavior
keymap({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- save file
keymap("n", "<C-s>", "<cmd> w <CR>", key_opts)

-- save file w/o auto-format
keymap("n", "<C-a>", "<cmd> noautocmd w <CR>", key_opts)

-- source
keymap("n", "<C-S-r>", "<CMD>so<CR>", key_opts)

-- quit file
keymap("n", "<C-q>", "<cmd> q <CR>", key_opts)

-- delete character w/o copy into register
keymap("n", "x", '"_x', key_opts)

-- Vertical Scroll and center
keymap("n", "<C-d>", "<C-d>zz", key_opts)
keymap("n", "<C-u>", "<C-u>zz", key_opts)

-- Find and center
keymap("n", "n", "nzzzv", key_opts)
keymap("n", "N", "Nzzzv", key_opts)

-- Resize with arrows
keymap("n", "<S-Up>", ":resize -2<CR>", key_opts)
keymap("n", "<S-Down>", ":resize +2<CR>", key_opts)
keymap("n", "<S-Left>", ":vertical resize -2<CR>", key_opts)
keymap("n", "<S-Right>", ":vertical resize +2<CR>", key_opts)

-- Buffers
keymap("n", "<Tab>", ":bnext<CR>", key_opts)
keymap("n", "<S-Tab>", ":bprevious<CR>", key_opts)
keymap("n", "<leader>x", ":Bdelete!<CR>", key_opts) -- close buffer
keymap("n", "<leader>b", "<cmd> enew <CR>", key_opts) -- new buffer

-- Window management
keymap("n", "<leader>v", "<C-w>v", key_opts) -- split window vertically
keymap("n", "<leader>h", "<C-w>s", key_opts) -- split window horizontally
keymap("n", "<leader>se", "<C-w>=", key_opts) -- split windows equally w/h
keymap("n", "<leader>xs", ":close<CR>", key_opts) -- close current split window

-- Navigate between splits
keymap("n", "<C-k>", ":wincmd k<CR>", key_opts)
keymap("n", "<C-j>", ":wincmd j<CR>", key_opts)
keymap("n", "<C-h>", ":wincmd h<CR>", key_opts)
keymap("n", "<C-l>", ":wincmd l<CR>", key_opts)

-- Tabs
keymap("n", "<leader>to", ":tabnew<CR>", key_opts) -- open new tab
keymap("n", "<leader>tx", ":tabclose<CR>", key_opts) -- close current tab
keymap("n", "<leader>tn", ":tabn<CR>", key_opts) --  go to next tab
keymap("n", "<leader>tp", ":tabp<CR>", key_opts) --  go to previous tab

-- Toggle line wrapping
keymap("n", "<leader>lw", "<cmd>set wrap!<CR>", key_opts)

-- Stay in indent mode
keymap("v", "<", "<gv", key_opts)
keymap("v", ">", ">gv", key_opts)

-- Keep last yanked when pasting
keymap("v", "p", '"_dP', key_opts)

-- Pack Add
vim.pack.add({
	{ src = "https://github.com/windwp/nvim-autopairs" },
	{ src = "https://github.com/folke/tokyonight.nvim" },
	{ src = "https://github.com/mikavilpas/yazi.nvim" },
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/ibhagwan/fzf-lua" },
	{ src = "https://github.com/nvim-tree/nvim-web-devicons" },
	{ src = "https://github.com/akinsho/bufferline.nvim" },
	{ src = "https://github.com/folke/which-key.nvim" },
	{ src = "https://github.com/nvim-lualine/lualine.nvim" },
	{ src = "https://github.com/kdheepak/lazygit.nvim" },
	{ src = "https://github.com/folke/noice.nvim" },
	{ src = "https://github.com/MunifTanjim/nui.nvim" },
	{ src = "https://github.com/christoomey/vim-tmux-navigator" },
	{
		src = "https://github.com/nvim-neo-tree/neo-tree.nvim",
		version = vim.version.range("3"),
	},
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/mason-org/mason-lspconfig.nvim" },
	{ src = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim" },
	{
		src = "https://github.com/Saghen/blink.cmp",
		version = vim.version.range("1.*"),
	},
	{ src = "https://github.com/MeanderingProgrammer/render-markdown.nvim" },
	{ src = "https://github.com/lukas-reineke/indent-blankline.nvim" },
	{ src = "https://github.com/karb94/neoscroll.nvim" },
	{ src = "https://github.com/akinsho/toggleterm.nvim" },
}, { confirm = false })

-- Plugin settings

require("nvim-autopairs").setup()


require("tokyonight").setup({
	style = "storm",
})

require("tokyonight").load()
-- Yazi
require("yazi").setup({
	open_for_directories = false,
	keymaps = {
		show_help = "<f1>",
	},
})

keymap("n", "<leader>-", function()
	require("yazi").yazi()
end)

vim.g.loaded_netrwPlugin = 1
vim.api.nvim_create_autocmd("UIEnter", {
	callback = function()
		require("yazi").setup({
			open_for_directories = true,
		})
	end,
})

-- FZFLua
require("fzf-lua").setup()

keymap("n", "<leader>ff", "<CMD>FzfLua files<CR>", { desc = "Find Files" })
keymap("n", "<leader>fh", "<CMD>FzfLua helptags<CR>", { desc = "Find Helptags" })
keymap("n", "<leader>fk", "<CMD>FzfLua keymaps<CR>", { desc = "Find keymaps" })
keymap("n", "<leader>fb", "<CMD>FzfLua builtin<CR>", { desc = "Find Builtin FZF" })
keymap("n", "<leader><leader>", "<CMD>FzfLua buffers<CR>", { desc = "Find existing buffers" })
keymap("n", "<leader>/", "<CMD>FzfLua live_grep<CR>", { desc = "Live grep current buffer" })

-- Bufferline
require("bufferline").setup({
	options = {
		mode = "buffers", -- set to "tabs" to only show tabpages instead
		themable = true, -- allows highlight groups to be overriden i.e. sets highlights as default
		numbers = "none", -- | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
		buffer_close_icon = "✗",
		close_icon = "✗",
		modified_icon = "●",
		left_trunc_marker = "",
		right_trunc_marker = "",
		max_name_length = 30,
		max_prefix_length = 30, -- prefix used when a buffer is de-duplicated
		tab_size = 21,
		diagnostics = false,
		diagnostics_update_in_insert = false,
		color_icons = true,
		show_buffer_icons = true,
		show_buffer_close_icons = true,
		show_close_icon = true,
		persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
		separator_style = { "│", "│" }, -- | "thick" | "thin" | { 'any', 'any' },
		enforce_regular_tabs = true,
		always_show_bufferline = true,
		show_tab_indicators = false,
		indicator = {
			-- icon = '▎', -- this should be omitted if indicator style is not 'icon'
			style = "none", -- Options: 'icon', 'underline', 'none'
		},
		icon_pinned = "󰐃",
		minimum_padding = 1,
		maximum_padding = 5,
		maximum_length = 15,
		sort_by = "insert_at_end",
		offsets = {
			{
				filetype = "neo-tree",
				text = "Neotree",
				text_align = "center",
				separator = true,
			},
		},
	},
	highlights = {
		separator = {
			fg = "#434C5E",
		},
		buffer_selected = {
			bold = true,
			italic = true,
		},
		-- separator_selected = {},
		-- tab_selected = {},
		-- background = {},
		-- indicator_selected = {},
		-- fill = {},
	},
})

-- WhichKey
require("which-key").setup({
	options = {
		preset = "helix",
	},
})
keymap("n", "<leader>?", function()
	require("which-key").show({ global = false })
end, { desc = "Buffer keymaps (which-key)" })

-- Lualine
local mode = {
	"mode",
	fmt = function(str)
		return " " .. str
		-- return ' ' .. str:sub(1, 1) -- displays only the first character of the mode
	end,
}

local filename = {
	"filename",
	file_status = true, -- displays file status (readonly status, modified status)
	path = 1, -- 0 = just filename, 1 = relative path, 2 = absolute path
}

local hide_in_width = function()
	return vim.fn.winwidth(0) > 100
end

local diagnostics = {
	"diagnostics",
	sources = { "nvim_diagnostic" },
	sections = { "error", "warn" },
	symbols = { error = " ", warn = " ", info = " ", hint = " " },
	colored = false,
	update_in_insert = false,
	always_visible = false,
	cond = hide_in_width,
}

local diff = {
	"diff",
	colored = false,
	symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
	cond = hide_in_width,
}

require("lualine").setup({
	options = {
		icons_enabled = true,
		theme = "tokyonight", -- Set theme based on environment variable
		-- Some useful glyphs:
		-- https://www.nerdfonts.com/cheat-sheet
		--       
		section_separators = { left = "", right = "" },
		component_separators = { left = "", right = "" },
		disabled_filetypes = {
      statusline = { "alpha", "neo-tree" },
      winbar = { "alpha", "neo-tree" },
    },
		always_divide_middle = true,
		globalstatus = true,
	},
	sections = {
		lualine_a = { mode },
		lualine_b = { "branch" },
		lualine_c = { filename },
		lualine_x = {
			diagnostics,
			diff,
			{ "encoding", cond = hide_in_width },
			{ "filetype", cond = hide_in_width },
		},
		lualine_y = { "location" },
		lualine_z = { "progress" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { { "filename", path = 1 } },
		lualine_x = { { "location", padding = 0 } },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	extensions = { "fugitive", "fzf" },
})

-- LazyGit

keymap(
	"n",
	"<leader>lg",
	"<cmd>LazyGit<cr><cmd>hi LazyGitFloat guibg=NONE guifg=NONE<cr><cmd>setlocal winhl=NormalFloat:LazyGitFloat<cr>",
	{ desc = "LazyGit" }
)
vim.g.lazygit_floating_window_winblend = 0 -- transparency of floating window (0-100)
vim.g.lazygit_floating_window_scaling_factor = 0.9 -- scaling factor for floating window
vim.g.lazygit_floating_window_border_chars = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" } -- customize lazygit popup window border characters
vim.g.lazygit_floating_window_use_plenary = 0 -- use plenary.nvim to manage floating window if available
vim.g.lazygit_use_neovim_remote = 1 -- fallback to 0 if neovim-remote is not installed
vim.g.lazygit_use_custom_config_file_path = 0 -- config file path is evaluated if this value is 1
vim.g.lazygit_config_file_path = {} -- table of custom config file paths

-- Diagnostics
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

-- Noice
require("noice").setup({
	presets = {
		bottom_search = false,
		command_palette = true,
		long_message_to_split = true,
		inc_rename = false,
		lsp_doc_border = false,
	},
})

-- Neotree

require("neo-tree").setup({
	sources = {
		"filesystem",
		"buffers",
		"git_status",
	},
	close_if_last_window = true,
	open_files_do_not_replace_types = {
		"terminal",
		"Trouble",
		"trouble",
		"qf",
		"Outline",
	},
	filesystem = {
		bind_to_cwd = false,
		follow_current_file = { enabled = true },
		use_libuv_file_watcher = true,
	},
	window = {
		width = 25,
		mappings = {
			["l"] = "open",
			["h"] = "close_node",
			["<space>"] = "none",
			["Y"] = {
				function(state)
					local node = state.tree:get_node()
					local path = node:get_id()
					vim.fn.setreg("+", path, "c")
				end,
				desc = "Copy Path to Clipboard",
			},
			["P"] = { "toggle_preview", config = { use_float = false } },
		},
	},
	source_selector = {
		winbar = true,
		statusline = false,
	},
	default_component_configs = {
		indent = {
			with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
			expander_collapsed = "",
			expander_expanded = "",
			expander_highlight = "NeoTreeExpander",
		},
		git_status = {
			symbols = {
				unstaged = "󰄱",
				staged = "󰱒",
			},
		},
	},
})

keymap( { "n", "t" }, "<leader>e", "<CMD>Neotree filesystem toggle left<CR>", { desc = "Neo-tree toggle" })

vim.api.nvim_create_autocmd("BufEnter", {
	group = vim.api.nvim_create_augroup("Neotree_start_directory", { clear = true }),
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

-- Treesitter
require("nvim-treesitter").setup({
	install_dir = vim.fn.stdpath("data") .. "/site",
	indent = { enable = false },
})

vim.api.nvim_create_autocmd("PackChanged", {
	pattern = "nvim-treesitter",
	desc = "Run :TSUpdate after pack changed",
	group = vim.api.nvim_create_augroup("treesitter_update", { clear = true }),
	callback = function(e)
		local kind, name
		name = e.data.kind, e.data.spec.name
		if kind == "install" or kind == "update" then
			vim.cmd.packadd({ args = { name }, bang = false })
			vim.cmd("TSUpdate")
		end
	end,
})

local parsers = {
	"lua",
	"vim",
	"bash",
	"regex",
	"javascript",
	"json",
	"markdown",
	"markdown_inline",
	"nix",
	"html",
	"latex",
	"yaml",
}

require("nvim-treesitter").install(parsers)

-- vim.api.nvim_create_autocmd("FileType", {
-- 	pattern = parsers,
-- 	callback = function(e)
-- 		vim.treesitter.start(e.buf)
-- 		vim.bo[e.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexp()"
-- 	end,
-- })

-- LSP and Mason
require("mason").setup()
require("mason-lspconfig").setup()
require("mason-tool-installer").setup({
	ensure_installed = {
		"lua_ls",
		"bashls",
		"nil",
		"jinja-lsp",
		"shellcheck",
		"marksman",
		"stylua",
		"shfmt",
		"markdownlint",
		"prettier",
	},
})

vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
			},
			diagnostics = {
				globals = {
					"vim",
					"require",
				},
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
			},
			telemetry = {
				enable = false,
			},
		},
	},
})

vim.filetype.add({
	pattern = {
		[".*/playbooks./*%.ya?ml"] = "yaml.ansible",
		[".*/roles.*/tasks/.*%.ya?ml"] = "yaml.ansible",
		[".*/group_vars/all/*.*%.ya?ml"] = "yaml.ansible",
	},
})

vim.api.nvim_create_autocmd("BufReadPost", {
	pattern = { "*main.yml", "*main.yaml" },
	callback = function()
		vim.bo.filetype = "yaml.ansible"
	end,
})

require("blink.cmp").setup({
	signature = {
		enabled = true,
		window = { border = "rounded" },
	},
	completion = {
		documentation = {
			auto_show = true,
			auto_show_delay_ms = 500,
			window = { border = "rounded" },
		},
		menu = {
			border = "rounded",
			auto_show = true,
			draw = {
				treesitter = { "lsp" },
				columns = { { "kind_icon", "label", "label_description", gap = 1 }, { "kind" } },
			},
		},
	},
	keymap = {
		preset = "default",
		["<C-k>"] = false,
		["<C-s>"] = { "show_signature", "hide_signature", "fallback" },
	},
})

keymap("n", "K", function()
	vim.lsp.buf.hover({ border = "rounded" })
end, { desc = "Hover" })

keymap("n", "<leader>fa", function()
	vim.lsp.buf.format({ async = true })
end, { desc = "Format" })

-- Renderer-Markdown
require("render-markdown").setup()

-- Indent Blankline
require("ibl").setup({
  indent = {
    char = '▏',
  },
  scope = {
    show_start = false,
    show_end = false,
    show_exact_scope = false,
  },
})

-- neoscroll
require("neoscroll").setup({
  hide_cursor = true,
  stop_eof = true,
  easing = 'quadratic',
})

-- toggleterm
require("toggleterm").setup()

keymap("n", "<leader>T", "<CMD>ToggleTerm size=15 direction=horizontal<CR>", { desc = "Toggle Terminal"})
