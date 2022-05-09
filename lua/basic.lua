-- general
lvim.log.level = "warn"
lvim.format_on_save = true
lvim.colorscheme = "onedarker"

vim.opt.relativenumber = true
vim.opt.spell = true
vim.opt.cmdheight = 1
vim.opt.clipboard = ""
vim.opt.wrap = true
vim.opt.mouse = ""
vim.opt.foldmethod = "expr"
vim.opt.foldenable = false
vim.opt.foldlevel = 99
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
-- vim.opt["swapfile"] = true
-- vim.opt.swapfile = true
lvim.builtin.telescope.defaults.wrap_results = true

-- change telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
local _, telescope = pcall(require, "telescope")
telescope.load_extension("ui-select")

-- todo: user config for predefined plugins
-- after changing plugin config exit and reopen lunarvim, run :packerinstall :packercompile
lvim.builtin.alpha.active = true
lvim.builtin.dap.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "right"
lvim.builtin.nvimtree.show_icons.git = 0

lvim.builtin.cmp.completion.keyword_length = 2
lvim.builtin.telescope.defaults.layout_config.width = 0.95
lvim.builtin.telescope.defaults.layout_config.preview_cutoff = 75

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "tsx",
  "markdown",
  "css",
  "rust",
  "java",
  "latex",
  "bibtex",
  "yaml",
  "fish"
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- generic lsp settings

-- ---@usage disable automatic installation of servers
lvim.lsp.automatic_servers_installation = true
